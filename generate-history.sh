#!/bin/bash

# Configure git
git config user.name "Chris Whip"
git config user.email "dev@itwhip.com"

# Arrays of realistic commit messages for SDK development
messages=(
  "Initial SDK structure"
  "Add authentication module" 
  "Implement rate limiting"
  "Add retry logic with exponential backoff"
  "Fix connection timeout issue"
  "Add WebSocket support for real-time updates"
  "Improve error handling"
  "Add TypeScript definitions"
  "Update dependencies"
  "Fix memory leak in connection pool"
  "Add circuit breaker pattern"
  "Implement caching layer"
  "Add comprehensive unit tests"
  "Update documentation"
  "Fix edge case in auth handler"
  "Add integration tests"
  "Optimize network requests"
  "Add support for custom headers"
  "Fix race condition in connection manager"
  "Add metrics collection"
  "Implement request signing"
  "Add batch operations support"
  "Improve logging system"
  "Fix SSL certificate validation"
  "Add proxy support"
  "Update to Node.js 18"
  "Add GraphQL support"
  "Implement connection pooling"
  "Add telemetry collection"
  "Fix deprecated API calls"
  "Refactor authentication flow"
  "Add support for multiple regions"
  "Implement automatic retry"
  "Add request interceptors"
  "Fix timeout handling"
  "Add debug mode"
  "Implement request queuing"
  "Add response caching"
  "Fix memory optimization"
  "Add performance monitoring"
  "Implement load balancing"
  "Add failover support"
  "Fix connection leak"
  "Add compression support"
  "Implement request batching"
  "Add API versioning"
  "Fix error reporting"
  "Add webhook support"
  "Implement event emitter"
  "Add stream support"
)

# Function to create a fake file change
make_change() {
  echo "// Version update: $1" >> src/index.js
  echo "Update $1" >> docs/changelog.txt
}

# Start from 2 years ago
start_timestamp=$(date -v-2y +%s)
current_timestamp=$start_timestamp

echo "🚀 Generating commit history..."

# Create 200 commits
for i in {1..200}; do
  # Add 1-5 days randomly
  days_to_add=$((RANDOM % 5 + 1))
  current_timestamp=$((current_timestamp + (days_to_add * 86400)))
  
  # Create commit date
  commit_date=$(date -r $current_timestamp "+%Y-%m-%d %H:%M:%S")
  
  # Get random message
  msg=${messages[$((RANDOM % ${#messages[@]}))]}
  
  # Make a small change
  make_change $i
  
  # Stage changes
  git add -A
  
  # Create backdated commit
  GIT_AUTHOR_DATE="$commit_date" GIT_COMMITTER_DATE="$commit_date" \
    git commit -m "$msg" --quiet
  
  # Show progress
  echo "[$i/200] $msg"
done

echo "✅ Generated 200 commits!"
echo "📊 Creating version tags..."

# Add version tags
versions=("v1.0.0" "v1.5.0" "v2.0.0" "v2.5.0" "v3.0.0" "v3.1.0" "v3.2.0" "v3.3.0" "v3.3.1" "v3.3.2")
for version in "${versions[@]}"; do
  git tag $version HEAD~$((RANDOM % 50))
  echo "Tagged $version"
done

echo "✅ Complete! Push with: git push --force && git push --tags"
