- 'What is a data Structure?'
# A data structure is used to store data in a specific format (Array, Hashes, etc...)
- 'Why study algos?'
# Because it's important for all other branches of computer science
# Plays a key role in modern technological innovation
# It's a challenge! Good for the brain
- 'What is a stack?'
# A stack is a data structure in which elements are sorted by insertion order. (You can only push/pop from the top).

- 'What is a queue?'
# A data structure where where elements can only be added from the back, and removed from the front

- 'What is the difference between a queue and a stack??'
# Both do not have an index to access the order but how the data is fetched is different.

#  Stacks are added and removed from the top fo the structure,
#  Queues are added from the back and removed from the top

- 'What is a stack useful for?'
# Think of a stack of books, if you want a book, get from the top, if you want to add, add from the top (You can only add/remove from the top)

# Usfull for which you want to reverse the order of the data.

- 'What is a queue useful for?'
#  Useful in context where managing reasorces. Think of a print que, the first person to send a job to the printer is the first one to get the job done, and viseversa for the last.

- 'What is the best way to implement Stacks and Queues in Ruby?'
# In traversing a binary tree

- 'Why bother having many different search algos?'
# It depends on the type and size of data, a quick sort is going to be much more efficient with a smaller set of data than a merge sort.

- 'What is Breadth First Search (BFS)'
#  BFS starts from the top of the Binary Tree and moves to the bottom. Visits all the children before thee grandchildren.

- 'What is Depth First Search (DFS)'
# DFS visits the root then the left section or right section. Unlike BFS (which traverses each element at one level before moving forward. A DFS starts from the root and scans one half before the next half

- 'What situations would you want to use DFS'
# If the solutions are frequent but located deeply int he tree

- 'When is it impractical to use BFS' 
# If the tree is very wide, a BFS would require a lot of memory.

- 'Binary Search'
# The idea of the algo is to divide and conquer, reducing the search area by half each time, tryung to find a target number.
# NOTE! In order to leverage this power, our array MUST be sorted else we can not make assumptions about the array contents.

- 'Tree Traversal'
#  The process of visiting each node in the tree exactly once in some oreder. Ther are 2 methods of doing this, Breadth-first  or Depth First

def binary_search
  # repeat until (sub)array.length is 0
  # Calculate the mid point od the array.length
  # If target is at mid, stop.
  # If the target is < mid , repeat
  # If the target is > mid, repeat
end

# <--- Level Ordder Traversal (BFT) --->
# We can do a level order traversal with a Queue! (A node that is inserted first will be discovered first!)

# <--- Preorder, Inorder, Postorder (DFT) --->
# Preorder - visits the root first
1) #visit root
2) #visit left subtree
3) #visit right subtree

# Inorder - Visites the left then root, then right
# Postorder visits left, right, then root.


