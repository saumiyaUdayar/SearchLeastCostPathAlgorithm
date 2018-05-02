# Search Least Cost Path

iOS app with swift code demonstrates test driven development approach to get path with least cost

## Built on

Xcode 9.2, Swift 4.0

### Implementation

User Interface provides user with a textview to input cost matrix and displays the computed least cost path, with row sequence for the path.

Algorithm computes the least cost to reach  next column until all columns are covered or max cost limit is exceeded. Adjacent column can reach next column from diagonally top, diagonally botton ot the next column on same row.
Finally traces path for covered column starts from the minimum cost of the last column and traverse reverse to the first column, with the minimum cost among the adjacent columns.

### Testcases

Unit test cases for following scenerios:
* Empty input
* Special characters and alphabets as input for cost matrix
* Input with inadequate for mXn matrix
* Path for 1X1 cost matrix
* Path for 5X6 cost matrix
* Path for 5X1 cost matrix
* Path for 3X5 cost matrix
* Path for 1X5 cost matrix
* Path for 3X20 cost matrix
* Path for cost matrix non path exists that gets through the grid below the cost max limit 50
* Cost matrix with all paths begin with cost exceeds max limit 50
* UITestcases
