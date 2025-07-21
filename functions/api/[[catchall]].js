// functions/api/[[catchall]].js

export async function onRequest(context) {
  const { env, request } = context;
  const url = new URL(request.url);
  // This cleans up the path array, e.g., /api/categories -> ['api', 'categories']
  const path = url.pathname.split("/").filter((p) => p);

  // A helper function to ensure all our responses are JSON
  const jsonResponse = (data, status = 200) => {
    return new Response(JSON.stringify(data), {
      headers: { "Content-Type": "application/json" },
      status: status,
    });
  };

  try {
    // --- Pre-computation Checks ---
    // First, check if the database binding exists. This is a common error source.
    if (!env.DB) {
      console.error(
        'D1 Database binding not found. Go to Settings > Functions > D1 Database Bindings and add the binding as "DB".'
      );
      return jsonResponse(
        { error: "Database not configured on the server." },
        500
      );
    }

    // --- API Routing ---
    // Check for a request to /api/categories
    if (path.length === 2 && path[1] === "categories") {
      const { results } = await env.DB.prepare("SELECT * FROM Category").all();
      return jsonResponse(results);
    }

    // Check for a request to /api/word/<some_id>
    if (path.length === 3 && path[1] === "word" && path[2]) {
      const categoryId = path[2];
      const stmt = env.DB.prepare(
        "SELECT Word FROM Words_in_Category WHERE Category_Id = ? ORDER BY RANDOM() LIMIT 1"
      );
      const { results } = await stmt.bind(categoryId).all();

      if (results.length > 0) {
        return jsonResponse(results[0]);
      } else {
        // This handles the case where a category exists but has no words
        return jsonResponse(
          { error: `No words found for category ID: ${categoryId}` },
          404
        );
      }
    }

    // If no route matched, return a specific "Not Found" JSON error
    return jsonResponse(
      { error: "API route not found.", requestedPath: path },
      404
    );
  } catch (e) {
    // Catch any unexpected errors during database queries or other logic
    console.error("An unexpected API error occurred:", e);
    return jsonResponse(
      { error: "An internal server error occurred.", message: e.message },
      500
    );
  }
}
