-- 由 scripts/export-problems-sql.mjs 从离线题库生成，请勿手工修改。
INSERT INTO problem_entries (
  source, rank, frontend_id, source_entry_id, title, slug, difficulty, category,
  frequency, source_updated_at, in_both, source_url, content_text, samples,
  example_testcases, tags, templates, acm_templates
) VALUES
('codetop',1,'3',1681,'无重复字符的最长子串','longest-substring-without-repeating-characters','中等',NULL,1188,'2026-08-25T04:48:54.586000Z',TRUE,'https://leetcode.cn/problems/longest-substring-without-repeating-characters/','给定一个字符串 s ，请你找出其中不含有重复字符的 最长 子串 的长度。

示例 1:

输入: s = "abcabcbb"
输出: 3
解释: 因为无重复字符的最长子串是 "abc"，所以其长度为 3。注意 "bca" 和 "cab" 也是正确答案。

示例 2:

输入: s = "bbbbb"
输出: 1
解释: 因为无重复字符的最长子串是 "b"，所以其长度为 1。

示例 3:

输入: s = "pwwkew"
输出: 3
解释: 因为无重复字符的最长子串是 "wke"，所以其长度为 3。
     请注意，你的答案必须是 子串 的长度，"pwke" 是一个子序列，不是子串。

提示：

	• 0 5

	• s 由英文字母、数字、符号和空格组成','[{"input":"s = \"abcabcbb\"","output":"3","explanation":"因为无重复字符的最长子串是 \"abc\"，所以其长度为 3。注意 \"bca\" 和 \"cab\" 也是正确答案。"},{"input":"s = \"bbbbb\"","output":"1","explanation":"因为无重复字符的最长子串是 \"b\"，所以其长度为 1。"},{"input":"s = \"pwwkew\"","output":"3","explanation":"因为无重复字符的最长子串是 \"wke\"，所以其长度为 3。\n     请注意，你的答案必须是 子串 的长度，\"pwke\" 是一个子序列，不是子串。"}]'::jsonb,'"abcabcbb"
"bbbbb"
"pwwkew"',ARRAY['哈希表','字符串','滑动窗口']::text[],'{"java":"class Solution {\n    public int lengthOfLongestSubstring(String s) {\n        \n    }\n}"}'::jsonb,'{"java":"import java.io.*;\nimport java.util.*;\n\npublic class Main {\n    public static void main(String[] args) throws Exception {\n        Scanner scanner = new Scanner(System.in);\n        // 每个参数占一行；数组、矩阵等复合参数使用 JSON 外观。\n        // 可用 nextInt()/next() 读取空白分隔数据，或 nextLine() 读取整行。\n        // TODO: 解析输入并输出答案。\n        scanner.close();\n    }\n}\n"}'::jsonb),
('codetop',2,'146',1538,'LRU缓存机制','lru-cache','中等',NULL,949,'2026-08-20T16:00:00Z',TRUE,'https://leetcode.cn/problems/lru-cache/','请你设计并实现一个满足  LRU (最近最少使用) 缓存 约束的数据结构。

实现 LRUCache 类：

	• LRUCache(int capacity) 以 正整数 作为容量 capacity 初始化 LRU 缓存

	• int get(int key) 如果关键字 key 存在于缓存中，则返回关键字的值，否则返回 -1 。

	• void put(int key, int value) 如果关键字 key 已经存在，则变更其数据值 value ；如果不存在，则向缓存中插入该组 key-value 。如果插入操作导致关键字数量超过 capacity ，则应该 逐出 最久未使用的关键字。

函数 get 和 put 必须以 O(1) 的平均时间复杂度运行。

示例：

输入
["LRUCache", "put", "put", "get", "put", "get", "put", "get", "get", "get"]
[[2], [1, 1], [2, 2], [1], [3, 3], [2], [4, 4], [1], [3], [4]]
输出
[null, null, null, 1, null, -1, null, -1, 3, 4]

解释
LRUCache lRUCache = new LRUCache(2);
lRUCache.put(1, 1); // 缓存是 {1=1}
lRUCache.put(2, 2); // 缓存是 {1=1, 2=2}
lRUCache.get(1);    // 返回 1
lRUCache.put(3, 3); // 该操作会使得关键字 2 作废，缓存是 {1=1, 3=3}
lRUCache.get(2);    // 返回 -1 (未找到)
lRUCache.put(4, 4); // 该操作会使得关键字 1 作废，缓存是 {4=4, 3=3}
lRUCache.get(1);    // 返回 -1 (未找到)
lRUCache.get(3);    // 返回 3
lRUCache.get(4);    // 返回 4

提示：

	• 1

	• 0

	• 0 5

	• 最多调用 2 * 105 次 get 和 put','[{"input":"[\"LRUCache\", \"put\", \"put\", \"get\", \"put\", \"get\", \"put\", \"get\", \"get\", \"get\"]\n[[2], [1, 1], [2, 2], [1], [3, 3], [2], [4, 4], [1], [3], [4]]","output":"[null, null, null, 1, null, -1, null, -1, 3, 4]","explanation":"LRUCache lRUCache = new LRUCache(2);\nlRUCache.put(1, 1); // 缓存是 {1=1}\nlRUCache.put(2, 2); // 缓存是 {1=1, 2=2}\nlRUCache.get(1);    // 返回 1\nlRUCache.put(3, 3); // 该操作会使得关键字 2 作废，缓存是 {1=1, 3=3}\nlRUCache.get(2);    // 返回 -1 (未找到)\nlRUCache.put(4, 4); // 该操作会使得关键字 1 作废，缓存是 {4=4, 3=3}\nlRUCache.get(1);    // 返回 -1 (未找到)\nlRUCache.get(3);    // 返回 3\nlRUCache.get(4);    // 返回 4"}]'::jsonb,'["LRUCache","put","put","get","put","get","put","get","get","get"]
[[2],[1,1],[2,2],[1],[3,3],[2],[4,4],[1],[3],[4]]',ARRAY['设计','哈希表','链表','双向链表']::text[],'{"java":"class LRUCache {\n\n    public LRUCache(int capacity) {\n        \n    }\n    \n    public int get(int key) {\n        \n    }\n    \n    public void put(int key, int value) {\n        \n    }\n}\n\n/**\n * Your LRUCache object will be instantiated and called as such:\n * LRUCache obj = new LRUCache(capacity);\n * int param_1 = obj.get(key);\n * obj.put(key,value);\n */"}'::jsonb,'{"java":"import java.io.*;\nimport java.util.*;\n\npublic class Main {\n    public static void main(String[] args) throws Exception {\n        Scanner scanner = new Scanner(System.in);\n        // 每个参数占一行；数组、矩阵等复合参数使用 JSON 外观。\n        // 可用 nextInt()/next() 读取空白分隔数据，或 nextLine() 读取整行。\n        // TODO: 解析输入并输出答案。\n        scanner.close();\n    }\n}\n"}'::jsonb),
('codetop',3,'206',1478,'反转链表','reverse-linked-list','简单',NULL,750,'2026-08-09T16:00:00Z',TRUE,'https://leetcode.cn/problems/reverse-linked-list/','给你单链表的头节点 head ，请你反转链表，并返回反转后的链表。

 

示例 1：

输入：head = [1,2,3,4,5]
输出：[5,4,3,2,1]

示例 2：

输入：head = [1,2]
输出：[2,1]

示例 3：

输入：head = []
输出：[]

 

提示：

	• 链表中节点的数目范围是 [0, 5000]

	• -5000

 

进阶：链表可以选用迭代或递归方式完成反转。你能否用两种方法解决这道题？','[{"input":"head = [1,2,3,4,5]","output":"[5,4,3,2,1]","explanation":""},{"input":"head = [1,2]","output":"[2,1]","explanation":""},{"input":"head = []","output":"[]","explanation":""}]'::jsonb,'[1,2,3,4,5]
[1,2]
[]',ARRAY['递归','链表']::text[],'{"java":"/**\n * Definition for singly-linked list.\n * public class ListNode {\n *     int val;\n *     ListNode next;\n *     ListNode() {}\n *     ListNode(int val) { this.val = val; }\n *     ListNode(int val, ListNode next) { this.val = val; this.next = next; }\n * }\n */\nclass Solution {\n    public ListNode reverseList(ListNode head) {\n        \n    }\n}"}'::jsonb,'{"java":"import java.io.*;\nimport java.util.*;\n\npublic class Main {\n    public static void main(String[] args) throws Exception {\n        Scanner scanner = new Scanner(System.in);\n        // 每个参数占一行；数组、矩阵等复合参数使用 JSON 外观。\n        // 可用 nextInt()/next() 读取空白分隔数据，或 nextLine() 读取整行。\n        // TODO: 解析输入并输出答案。\n        scanner.close();\n    }\n}\n"}'::jsonb),
('codetop',4,'215',1469,'数组中的第K个最大元素','kth-largest-element-in-an-array','中等',NULL,601,'2026-08-06T09:19:43.288000Z',TRUE,'https://leetcode.cn/problems/kth-largest-element-in-an-array/','给定整数数组 nums 和整数 k，请返回数组中第 k 个最大的元素。

请注意，你需要找的是数组排序后的第 k 个最大的元素，而不是第 k 个不同的元素。

你必须设计并实现时间复杂度为 O(n) 的算法解决此问题。

示例 1:

输入: [3,2,1,5,6,4], k = 2
输出: 5

示例 2:

输入: [3,2,3,1,2,4,5,5,6], k = 4
输出: 4

提示：

	• 1 5

	• -104 4','[{"input":"[3,2,1,5,6,4], k = 2","output":"5","explanation":""},{"input":"[3,2,3,1,2,4,5,5,6], k = 4","output":"4","explanation":""}]'::jsonb,'[3,2,1,5,6,4]
2
[3,2,3,1,2,4,5,5,6]
4',ARRAY['数组','分治','快速选择','排序','堆（优先队列）']::text[],'{"java":"class Solution {\n    public int findKthLargest(int[] nums, int k) {\n        \n    }\n}"}'::jsonb,'{"java":"import java.io.*;\nimport java.util.*;\n\npublic class Main {\n    public static void main(String[] args) throws Exception {\n        Scanner scanner = new Scanner(System.in);\n        // 每个参数占一行；数组、矩阵等复合参数使用 JSON 外观。\n        // 可用 nextInt()/next() 读取空白分隔数据，或 nextLine() 读取整行。\n        // TODO: 解析输入并输出答案。\n        scanner.close();\n    }\n}\n"}'::jsonb),
('codetop',5,'25',1659,'K 个一组翻转链表','reverse-nodes-in-k-group','困难',NULL,527,'2026-08-25T07:20:02.987000Z',TRUE,'https://leetcode.cn/problems/reverse-nodes-in-k-group/','给你链表的头节点 head ，每 k 个节点一组进行翻转，请你返回修改后的链表。

k 是一个正整数，它的值小于或等于链表的长度。如果节点总数不是 k 的整数倍，那么请将最后剩余的节点保持原有顺序。

你不能只是单纯的改变节点内部的值，而是需要实际进行节点交换。

示例 1：

输入：head = [1,2,3,4,5], k = 2
输出：[2,1,4,3,5]

示例 2：

输入：head = [1,2,3,4,5], k = 3
输出：[3,2,1,4,5]

提示：

	• 链表中的节点数目为 n

	• 1

	• 0

进阶：你可以设计一个只用 O(1) 额外内存空间的算法解决此问题吗？','[{"input":"head = [1,2,3,4,5], k = 2","output":"[2,1,4,3,5]","explanation":""},{"input":"head = [1,2,3,4,5], k = 3","output":"[3,2,1,4,5]","explanation":""}]'::jsonb,'[1,2,3,4,5]
2
[1,2,3,4,5]
3',ARRAY['递归','链表']::text[],'{"java":"/**\n * Definition for singly-linked list.\n * public class ListNode {\n *     int val;\n *     ListNode next;\n *     ListNode() {}\n *     ListNode(int val) { this.val = val; }\n *     ListNode(int val, ListNode next) { this.val = val; this.next = next; }\n * }\n */\nclass Solution {\n    public ListNode reverseKGroup(ListNode head, int k) {\n        \n    }\n}"}'::jsonb,'{"java":"import java.io.*;\nimport java.util.*;\n\npublic class Main {\n    public static void main(String[] args) throws Exception {\n        Scanner scanner = new Scanner(System.in);\n        // 每个参数占一行；数组、矩阵等复合参数使用 JSON 外观。\n        // 可用 nextInt()/next() 读取空白分隔数据，或 nextLine() 读取整行。\n        // TODO: 解析输入并输出答案。\n        scanner.close();\n    }\n}\n"}'::jsonb),
('codetop',6,'15',1669,'三数之和','3sum','中等',NULL,486,'2026-08-15T16:00:00Z',TRUE,'https://leetcode.cn/problems/3sum/','给你一个整数数组 nums ，判断是否存在三元组 [nums[i], nums[j], nums[k]] 满足 i != j、i != k 且 j != k ，同时还满足 nums[i] + nums[j] + nums[k] == 0 。请你返回所有和为 0 且不重复的三元组。

注意：答案中不可以包含重复的三元组。

示例 1：

输入：nums = [-1,0,1,2,-1,-4]
输出：[[-1,-1,2],[-1,0,1]]
解释：
nums[0] + nums[1] + nums[2] = (-1) + 0 + 1 = 0 。
nums[1] + nums[2] + nums[4] = 0 + 1 + (-1) = 0 。
nums[0] + nums[3] + nums[4] = (-1) + 2 + (-1) = 0 。
不同的三元组是 [-1,0,1] 和 [-1,-1,2] 。
注意，输出的顺序和三元组的顺序并不重要。

示例 2：

输入：nums = [0,1,1]
输出：[]
解释：唯一可能的三元组和不为 0 。

示例 3：

输入：nums = [0,0,0]
输出：[[0,0,0]]
解释：唯一可能的三元组和为 0 。

提示：

	• 3

	• -105 5','[{"input":"nums = [-1,0,1,2,-1,-4]","output":"[[-1,-1,2],[-1,0,1]]","explanation":"nums[0] + nums[1] + nums[2] = (-1) + 0 + 1 = 0 。\nnums[1] + nums[2] + nums[4] = 0 + 1 + (-1) = 0 。\nnums[0] + nums[3] + nums[4] = (-1) + 2 + (-1) = 0 。\n不同的三元组是 [-1,0,1] 和 [-1,-1,2] 。\n注意，输出的顺序和三元组的顺序并不重要。"},{"input":"nums = [0,1,1]","output":"[]","explanation":"唯一可能的三元组和不为 0 。"},{"input":"nums = [0,0,0]","output":"[[0,0,0]]","explanation":"唯一可能的三元组和为 0 。"}]'::jsonb,'[-1,0,1,2,-1,-4]
[0,1,1]
[0,0,0]',ARRAY['数组','双指针','排序']::text[],'{"java":"class Solution {\n    public List<List<Integer>> threeSum(int[] nums) {\n        \n    }\n}"}'::jsonb,'{"java":"import java.io.*;\nimport java.util.*;\n\npublic class Main {\n    public static void main(String[] args) throws Exception {\n        Scanner scanner = new Scanner(System.in);\n        // 每个参数占一行；数组、矩阵等复合参数使用 JSON 外观。\n        // 可用 nextInt()/next() 读取空白分隔数据，或 nextLine() 读取整行。\n        // TODO: 解析输入并输出答案。\n        scanner.close();\n    }\n}\n"}'::jsonb),
('codetop',7,'53',1631,'最大子数组和','maximum-subarray','中等',NULL,375,'2026-07-16T03:51:38.931000Z',TRUE,'https://leetcode.cn/problems/maximum-subarray/','给你一个整数数组 nums ，请你找出一个具有最大和的连续子数组（子数组最少包含一个元素），返回其最大和。

子数组 是数组中的一个连续部分。

示例 1：

输入：nums = [-2,1,-3,4,-1,2,1,-5,4]
输出：6
解释：连续子数组 [4,-1,2,1] 的和最大，为 6 。

示例 2：

输入：nums = [1]
输出：1

示例 3：

输入：nums = [5,4,-1,7,8]
输出：23

提示：

	• 1 5

	• -104 4

进阶：如果你已经实现复杂度为 O(n) 的解法，尝试使用更为精妙的 分治法 求解。','[{"input":"nums = [-2,1,-3,4,-1,2,1,-5,4]","output":"6","explanation":"连续子数组 [4,-1,2,1] 的和最大，为 6 。"},{"input":"nums = [1]","output":"1","explanation":""},{"input":"nums = [5,4,-1,7,8]","output":"23","explanation":""}]'::jsonb,'[-2,1,-3,4,-1,2,1,-5,4]
[1]
[5,4,-1,7,8]',ARRAY['数组','分治','动态规划']::text[],'{"java":"class Solution {\n    public int maxSubArray(int[] nums) {\n        \n    }\n}"}'::jsonb,'{"java":"import java.io.*;\nimport java.util.*;\n\npublic class Main {\n    public static void main(String[] args) throws Exception {\n        Scanner scanner = new Scanner(System.in);\n        // 每个参数占一行；数组、矩阵等复合参数使用 JSON 外观。\n        // 可用 nextInt()/next() 读取空白分隔数据，或 nextLine() 读取整行。\n        // TODO: 解析输入并输出答案。\n        scanner.close();\n    }\n}\n"}'::jsonb),
('codetop',8,'补充题4',1906,'手撕快速排序','sort-an-array','中等',NULL,357,'2026-08-16T16:00:00Z',FALSE,'https://leetcode.cn/problems/sort-an-array/','给你一个整数数组 nums，请你将该数组升序排列。

你必须在 不使用任何内置函数 的情况下解决问题，时间复杂度为 O(nlog(n))，并且空间复杂度尽可能小。

示例 1：

输入：nums = [5,2,3,1]
输出：[1,2,3,5]
解释：数组排序后，某些数字的位置没有改变（例如，2 和 3），而其他数字的位置发生了改变（例如，1 和 5）。

示例 2：

输入：nums = [5,1,1,2,0,0]
输出：[0,0,1,1,2,5]
解释：请注意，nums 的值不一定唯一。

提示：

	• 1 4

	• -5 * 104 4','[{"input":"nums = [5,2,3,1]","output":"[1,2,3,5]","explanation":"数组排序后，某些数字的位置没有改变（例如，2 和 3），而其他数字的位置发生了改变（例如，1 和 5）。"},{"input":"nums = [5,1,1,2,0,0]","output":"[0,0,1,1,2,5]","explanation":"请注意，nums 的值不一定唯一。"}]'::jsonb,'[5,2,3,1]
[5,1,1,2,0,0]',ARRAY['数组','分治','桶排序','计数排序','基数排序','排序','堆（优先队列）','归并排序']::text[],'{"java":"class Solution {\n    public int[] sortArray(int[] nums) {\n        \n    }\n}"}'::jsonb,'{"java":"import java.io.*;\nimport java.util.*;\n\npublic class Main {\n    public static void main(String[] args) throws Exception {\n        Scanner scanner = new Scanner(System.in);\n        // 每个参数占一行；数组、矩阵等复合参数使用 JSON 外观。\n        // 可用 nextInt()/next() 读取空白分隔数据，或 nextLine() 读取整行。\n        // TODO: 解析输入并输出答案。\n        scanner.close();\n    }\n}\n"}'::jsonb),
('codetop',9,'5',1679,'最长回文子串','longest-palindromic-substring','中等',NULL,355,'2026-08-10T16:00:00Z',TRUE,'https://leetcode.cn/problems/longest-palindromic-substring/','给你一个字符串 s，找到 s 中最长的 回文 子串。

示例 1：

输入：s = "babad"
输出："bab"
解释："aba" 同样是符合题意的答案。

示例 2：

输入：s = "cbbd"
输出："bb"

提示：

	• 1

	• s 仅由数字和英文字母组成','[{"input":"s = \"babad\"","output":"\"bab\"","explanation":"\"aba\" 同样是符合题意的答案。"},{"input":"s = \"cbbd\"","output":"\"bb\"","explanation":""}]'::jsonb,'"babad"
"cbbd"',ARRAY['双指针','字符串','动态规划','manacher']::text[],'{"java":"class Solution {\n    public String longestPalindrome(String s) {\n        \n    }\n}"}'::jsonb,'{"java":"import java.io.*;\nimport java.util.*;\n\npublic class Main {\n    public static void main(String[] args) throws Exception {\n        Scanner scanner = new Scanner(System.in);\n        // 每个参数占一行；数组、矩阵等复合参数使用 JSON 外观。\n        // 可用 nextInt()/next() 读取空白分隔数据，或 nextLine() 读取整行。\n        // TODO: 解析输入并输出答案。\n        scanner.close();\n    }\n}\n"}'::jsonb),
('codetop',10,'21',1663,'合并两个有序链表','merge-two-sorted-lists','简单',NULL,333,'2026-08-19T13:07:03.355000Z',TRUE,'https://leetcode.cn/problems/merge-two-sorted-lists/','将两个升序链表合并为一个新的 升序 链表并返回。新链表是通过拼接给定的两个链表的所有节点组成的。 

 

示例 1：

输入：l1 = [1,2,4], l2 = [1,3,4]
输出：[1,1,2,3,4,4]

示例 2：

输入：l1 = [], l2 = []
输出：[]

示例 3：

输入：l1 = [], l2 = [0]
输出：[0]

 

提示：

	• 两个链表的节点数目范围是 [0, 50]

	• -100

	• l1 和 l2 均按 非递减顺序 排列','[{"input":"l1 = [1,2,4], l2 = [1,3,4]","output":"[1,1,2,3,4,4]","explanation":""},{"input":"l1 = [], l2 = []","output":"[]","explanation":""},{"input":"l1 = [], l2 = [0]","output":"[0]","explanation":""}]'::jsonb,'[1,2,4]
[1,3,4]
[]
[]
[]
[0]',ARRAY['递归','链表']::text[],'{"java":"/**\n * Definition for singly-linked list.\n * public class ListNode {\n *     int val;\n *     ListNode next;\n *     ListNode() {}\n *     ListNode(int val) { this.val = val; }\n *     ListNode(int val, ListNode next) { this.val = val; this.next = next; }\n * }\n */\nclass Solution {\n    public ListNode mergeTwoLists(ListNode list1, ListNode list2) {\n        \n    }\n}"}'::jsonb,'{"java":"import java.io.*;\nimport java.util.*;\n\npublic class Main {\n    public static void main(String[] args) throws Exception {\n        Scanner scanner = new Scanner(System.in);\n        // 每个参数占一行；数组、矩阵等复合参数使用 JSON 外观。\n        // 可用 nextInt()/next() 读取空白分隔数据，或 nextLine() 读取整行。\n        // TODO: 解析输入并输出答案。\n        scanner.close();\n    }\n}\n"}'::jsonb),
('codetop',11,'102',1582,'二叉树的层序遍历','binary-tree-level-order-traversal','中等',NULL,331,'2026-08-20T16:00:00Z',TRUE,'https://leetcode.cn/problems/binary-tree-level-order-traversal/','给你二叉树的根节点 root ，返回其节点值的 层序遍历 。 （即逐层地，从左到右访问所有节点）。

示例 1：

输入：root = [3,9,20,null,null,15,7]
输出：[[3],[9,20],[15,7]]

示例 2：

输入：root = [1]
输出：[[1]]

示例 3：

输入：root = []
输出：[]

提示：

	• 树中节点数目在范围 [0, 2000] 内

	• -1000','[{"input":"root = [3,9,20,null,null,15,7]","output":"[[3],[9,20],[15,7]]","explanation":""},{"input":"root = [1]","output":"[[1]]","explanation":""},{"input":"root = []","output":"[]","explanation":""}]'::jsonb,'[3,9,20,null,null,15,7]
[1]
[]',ARRAY['树','广度优先搜索','二叉树']::text[],'{"java":"/**\n * Definition for a binary tree node.\n * public class TreeNode {\n *     int val;\n *     TreeNode left;\n *     TreeNode right;\n *     TreeNode() {}\n *     TreeNode(int val) { this.val = val; }\n *     TreeNode(int val, TreeNode left, TreeNode right) {\n *         this.val = val;\n *         this.left = left;\n *         this.right = right;\n *     }\n * }\n */\nclass Solution {\n    public List<List<Integer>> levelOrder(TreeNode root) {\n        \n    }\n}"}'::jsonb,'{"java":"import java.io.*;\nimport java.util.*;\n\npublic class Main {\n    public static void main(String[] args) throws Exception {\n        Scanner scanner = new Scanner(System.in);\n        // 每个参数占一行；数组、矩阵等复合参数使用 JSON 外观。\n        // 可用 nextInt()/next() 读取空白分隔数据，或 nextLine() 读取整行。\n        // TODO: 解析输入并输出答案。\n        scanner.close();\n    }\n}\n"}'::jsonb),
('codetop',12,'200',1484,'岛屿数量','number-of-islands','中等',NULL,330,'2026-08-24T12:55:15.884000Z',TRUE,'https://leetcode.cn/problems/number-of-islands/','给你一个由 ''1''（陆地）和 ''0''（水）组成的的二维网格，请你计算网格中岛屿的数量。

岛屿总是被水包围，并且每座岛屿只能由水平方向和/或竖直方向上相邻的陆地连接形成。

此外，你可以假设该网格的四条边均被水包围。

示例 1：

输入：grid = [
  [''1'',''1'',''1'',''1'',''0''],
  [''1'',''1'',''0'',''1'',''0''],
  [''1'',''1'',''0'',''0'',''0''],
  [''0'',''0'',''0'',''0'',''0'']
]
输出：1

示例 2：

输入：grid = [
  [''1'',''1'',''0'',''0'',''0''],
  [''1'',''1'',''0'',''0'',''0''],
  [''0'',''0'',''1'',''0'',''0''],
  [''0'',''0'',''0'',''1'',''1'']
]
输出：3

提示：

	• m == grid.length

	• n == grid[i].length

	• 1

	• grid[i][j] 的值为 ''0'' 或 ''1''','[{"input":"grid = [\n  [''1'',''1'',''1'',''1'',''0''],\n  [''1'',''1'',''0'',''1'',''0''],\n  [''1'',''1'',''0'',''0'',''0''],\n  [''0'',''0'',''0'',''0'',''0'']\n]","output":"1","explanation":""},{"input":"grid = [\n  [''1'',''1'',''0'',''0'',''0''],\n  [''1'',''1'',''0'',''0'',''0''],\n  [''0'',''0'',''1'',''0'',''0''],\n  [''0'',''0'',''0'',''1'',''1'']\n]","output":"3","explanation":""}]'::jsonb,'[["1","1","1","1","0"],["1","1","0","1","0"],["1","1","0","0","0"],["0","0","0","0","0"]]
[["1","1","0","0","0"],["1","1","0","0","0"],["0","0","1","0","0"],["0","0","0","1","1"]]',ARRAY['深度优先搜索','广度优先搜索','并查集','数组','矩阵']::text[],'{"java":"class Solution {\n    public int numIslands(char[][] grid) {\n        \n    }\n}"}'::jsonb,'{"java":"import java.io.*;\nimport java.util.*;\n\npublic class Main {\n    public static void main(String[] args) throws Exception {\n        Scanner scanner = new Scanner(System.in);\n        // 每个参数占一行；数组、矩阵等复合参数使用 JSON 外观。\n        // 可用 nextInt()/next() 读取空白分隔数据，或 nextLine() 读取整行。\n        // TODO: 解析输入并输出答案。\n        scanner.close();\n    }\n}\n"}'::jsonb),
('codetop',13,'33',1651,'搜索旋转排序数组','search-in-rotated-sorted-array','中等',NULL,315,'2026-08-21T05:40:28.457000Z',TRUE,'https://leetcode.cn/problems/search-in-rotated-sorted-array/','整数数组 nums 按升序排列，数组中的值 互不相同 。

在传递给函数之前，nums 在预先未知的某个下标 k（0 ）上进行了 向左旋转，使数组变为 [nums[k], nums[k+1], ..., nums[n-1], nums[0], nums[1], ..., nums[k-1]]（下标 从 0 开始 计数）。例如， [0,1,2,4,5,6,7] 下标 3 上向左旋转后可能变为 [4,5,6,7,0,1,2] 。

给你 旋转后 的数组 nums 和一个整数 target ，如果 nums 中存在这个目标值 target ，则返回它的下标，否则返回 -1 。

你必须设计一个时间复杂度为 O(log n) 的算法解决此问题。

示例 1：

输入：nums = [4,5,6,7,0,1,2], target = 0
输出：4

示例 2：

输入：nums = [4,5,6,7,0,1,2], target = 3
输出：-1

示例 3：

输入：nums = [1], target = 0
输出：-1

提示：

	• 1

	• -104 4

	• nums 中的每个值都 独一无二

	• 题目数据保证 nums 在预先未知的某个下标上进行了旋转

	• -104 4','[{"input":"nums = [4,5,6,7,0,1,2], target = 0","output":"4","explanation":""},{"input":"nums = [4,5,6,7,0,1,2], target = 3","output":"-1","explanation":""},{"input":"nums = [1], target = 0","output":"-1","explanation":""}]'::jsonb,'[4,5,6,7,0,1,2]
0
[4,5,6,7,0,1,2]
3
[1]
0',ARRAY['数组','二分查找']::text[],'{"java":"class Solution {\n    public int search(int[] nums, int target) {\n        \n    }\n}"}'::jsonb,'{"java":"import java.io.*;\nimport java.util.*;\n\npublic class Main {\n    public static void main(String[] args) throws Exception {\n        Scanner scanner = new Scanner(System.in);\n        // 每个参数占一行；数组、矩阵等复合参数使用 JSON 外观。\n        // 可用 nextInt()/next() 读取空白分隔数据，或 nextLine() 读取整行。\n        // TODO: 解析输入并输出答案。\n        scanner.close();\n    }\n}\n"}'::jsonb),
('codetop',14,'1',1683,'两数之和','two-sum','简单',NULL,305,'2026-08-03T16:00:00Z',TRUE,'https://leetcode.cn/problems/two-sum/','给定一个整数数组 nums 和一个整数目标值 target，请你在该数组中找出 和为目标值 target  的那 两个 整数，并返回它们的数组下标。

你可以假设每种输入只会对应一个答案，并且你不能使用两次相同的元素。

你可以按任意顺序返回答案。

示例 1：

输入：nums = [2,7,11,15], target = 9
输出：[0,1]
解释：因为 nums[0] + nums[1] == 9 ，返回 [0, 1] 。

示例 2：

输入：nums = [3,2,4], target = 6
输出：[1,2]

示例 3：

输入：nums = [3,3], target = 6
输出：[0,1]

提示：

	• 2 4

	• -109 9

	• -109 9

	• 只会存在一个有效答案

进阶：你可以想出一个时间复杂度小于 O(n2) 的算法吗？','[{"input":"nums = [2,7,11,15], target = 9","output":"[0,1]","explanation":"因为 nums[0] + nums[1] == 9 ，返回 [0, 1] 。"},{"input":"nums = [3,2,4], target = 6","output":"[1,2]","explanation":""},{"input":"nums = [3,3], target = 6","output":"[0,1]","explanation":""}]'::jsonb,'[2,7,11,15]
9
[3,2,4]
6
[3,3]
6',ARRAY['数组','哈希表']::text[],'{"java":"class Solution {\n    public int[] twoSum(int[] nums, int target) {\n        \n    }\n}"}'::jsonb,'{"java":"import java.io.*;\nimport java.util.*;\n\npublic class Main {\n    public static void main(String[] args) throws Exception {\n        Scanner scanner = new Scanner(System.in);\n        // 每个参数占一行；数组、矩阵等复合参数使用 JSON 外观。\n        // 可用 nextInt()/next() 读取空白分隔数据，或 nextLine() 读取整行。\n        // TODO: 解析输入并输出答案。\n        scanner.close();\n    }\n}\n"}'::jsonb),
('codetop',15,'46',1638,'全排列','permutations','中等',NULL,299,'2026-08-11T10:30:57.479000Z',TRUE,'https://leetcode.cn/problems/permutations/','给定一个不含重复数字的数组 nums ，返回其 所有可能的全排列 。你可以 按任意顺序 返回答案。

示例 1：

输入：nums = [1,2,3]
输出：[[1,2,3],[1,3,2],[2,1,3],[2,3,1],[3,1,2],[3,2,1]]

示例 2：

输入：nums = [0,1]
输出：[[0,1],[1,0]]

示例 3：

输入：nums = [1]
输出：[[1]]

提示：

	• 1

	• -10

	• nums 中的所有整数 互不相同','[{"input":"nums = [1,2,3]","output":"[[1,2,3],[1,3,2],[2,1,3],[2,3,1],[3,1,2],[3,2,1]]","explanation":""},{"input":"nums = [0,1]","output":"[[0,1],[1,0]]","explanation":""},{"input":"nums = [1]","output":"[[1]]","explanation":""}]'::jsonb,'[1,2,3]
[0,1]
[1]',ARRAY['数组','回溯']::text[],'{"java":"class Solution {\n    public List<List<Integer>> permute(int[] nums) {\n        \n    }\n}"}'::jsonb,'{"java":"import java.io.*;\nimport java.util.*;\n\npublic class Main {\n    public static void main(String[] args) throws Exception {\n        Scanner scanner = new Scanner(System.in);\n        // 每个参数占一行；数组、矩阵等复合参数使用 JSON 外观。\n        // 可用 nextInt()/next() 读取空白分隔数据，或 nextLine() 读取整行。\n        // TODO: 解析输入并输出答案。\n        scanner.close();\n    }\n}\n"}'::jsonb),
('codetop',16,'88',1596,'合并两个有序数组','merge-sorted-array','简单',NULL,298,'2026-08-10T09:24:21.745000Z',FALSE,'https://leetcode.cn/problems/merge-sorted-array/','给你两个按 非递减顺序 排列的整数数组 nums1 和 nums2，另有两个整数 m 和 n ，分别表示 nums1 和 nums2 中的元素数目。

请你 合并 nums2 到 nums1 中，使合并后的数组同样按 非递减顺序 排列。

注意：最终，合并后数组不应由函数返回，而是存储在数组 nums1 中。为了应对这种情况，nums1 的初始长度为 m + n，其中前 m 个元素表示应合并的元素，后 n 个元素为 0 ，应忽略。nums2 的长度为 n 。

示例 1：

输入：nums1 = [1,2,3,0,0,0], m = 3, nums2 = [2,5,6], n = 3
输出：[1,2,2,3,5,6]
解释：需要合并 [1,2,3] 和 [2,5,6] 。
合并结果是 [1,2,2,3,5,6] ，其中斜体加粗标注的为 nums1 中的元素。

示例 2：

输入：nums1 = [1], m = 1, nums2 = [], n = 0
输出：[1]
解释：需要合并 [1] 和 [] 。
合并结果是 [1] 。

示例 3：

输入：nums1 = [0], m = 0, nums2 = [1], n = 1
输出：[1]
解释：需要合并的数组是 [] 和 [1] 。
合并结果是 [1] 。
注意，因为 m = 0 ，所以 nums1 中没有元素。nums1 中仅存的 0 仅仅是为了确保合并结果可以顺利存放到 nums1 中。

提示：

	• nums1.length == m + n

	• nums2.length == n

	• 0

	• 1

	• -109 9

进阶：你可以设计实现一个时间复杂度为 O(m + n) 的算法解决此问题吗？','[{"input":"nums1 = [1,2,3,0,0,0], m = 3, nums2 = [2,5,6], n = 3","output":"[1,2,2,3,5,6]","explanation":"需要合并 [1,2,3] 和 [2,5,6] 。\n合并结果是 [1,2,2,3,5,6] ，其中斜体加粗标注的为 nums1 中的元素。"},{"input":"nums1 = [1], m = 1, nums2 = [], n = 0","output":"[1]","explanation":"需要合并 [1] 和 [] 。\n合并结果是 [1] 。"},{"input":"nums1 = [0], m = 0, nums2 = [1], n = 1","output":"[1]","explanation":"需要合并的数组是 [] 和 [1] 。\n合并结果是 [1] 。\n注意，因为 m = 0 ，所以 nums1 中没有元素。nums1 中仅存的 0 仅仅是为了确保合并结果可以顺利存放到 nums1 中。"}]'::jsonb,'[1,2,3,0,0,0]
3
[2,5,6]
3
[1]
1
[]
0
[0]
0
[1]
1',ARRAY['数组','双指针','排序']::text[],'{"java":"class Solution {\n    public void merge(int[] nums1, int m, int[] nums2, int n) {\n        \n    }\n}"}'::jsonb,'{"java":"import java.io.*;\nimport java.util.*;\n\npublic class Main {\n    public static void main(String[] args) throws Exception {\n        Scanner scanner = new Scanner(System.in);\n        // 每个参数占一行；数组、矩阵等复合参数使用 JSON 外观。\n        // 可用 nextInt()/next() 读取空白分隔数据，或 nextLine() 读取整行。\n        // TODO: 解析输入并输出答案。\n        scanner.close();\n    }\n}\n"}'::jsonb),
('codetop',17,'20',1664,'有效的括号','valid-parentheses','简单',NULL,297,'2026-07-02T13:35:47.056000Z',TRUE,'https://leetcode.cn/problems/valid-parentheses/','给定一个只包括 ''(''，'')''，''{''，''}''，''[''，'']'' 的字符串 s ，判断字符串是否有效。

有效字符串需满足：

	• 左括号必须用相同类型的右括号闭合。

	• 左括号必须以正确的顺序闭合。

	• 每个右括号都有一个对应的相同类型的左括号。

示例 1：

输入：s = "()"

输出：true

示例 2：

输入：s = "()[]{}"

输出：true

示例 3：

输入：s = "(]"

输出：false

示例 4：

输入：s = "([])"

输出：true

示例 5：

输入：s = "([)]"

输出：false

提示：

	• 1 4

	• s 仅由括号 ''()[]{}'' 组成','[{"input":"s = \"()\"","output":"true","explanation":""},{"input":"s = \"()[]{}\"","output":"true","explanation":""},{"input":"s = \"(]\"","output":"false","explanation":""},{"input":"s = \"([])\"","output":"true","explanation":""}]'::jsonb,'"()"
"()[]{}"
"(]"
"([])"
"([)]"',ARRAY['栈','字符串','bracket-sequences']::text[],'{"java":"class Solution {\n    public boolean isValid(String s) {\n        \n    }\n}"}'::jsonb,'{"java":"import java.io.*;\nimport java.util.*;\n\npublic class Main {\n    public static void main(String[] args) throws Exception {\n        Scanner scanner = new Scanner(System.in);\n        // 每个参数占一行；数组、矩阵等复合参数使用 JSON 外观。\n        // 可用 nextInt()/next() 读取空白分隔数据，或 nextLine() 读取整行。\n        // TODO: 解析输入并输出答案。\n        scanner.close();\n    }\n}\n"}'::jsonb),
('codetop',18,'121',1563,'买卖股票的最佳时机','best-time-to-buy-and-sell-stock','简单',NULL,280,'2026-07-14T16:00:00Z',TRUE,'https://leetcode.cn/problems/best-time-to-buy-and-sell-stock/','给定一个数组 prices ，它的第 i 个元素 prices[i] 表示一支给定股票第 i 天的价格。

你只能选择 某一天 买入这只股票，并选择在 未来的某一个不同的日子 卖出该股票。设计一个算法来计算你所能获取的最大利润。

返回你可以从这笔交易中获取的最大利润。如果你不能获取任何利润，返回 0 。

 

示例 1：

输入：[7,1,5,3,6,4]
输出：5
解释：在第 2 天（股票价格 = 1）的时候买入，在第 5 天（股票价格 = 6）的时候卖出，最大利润 = 6-1 = 5 。
     注意利润不能是 7-1 = 6, 因为卖出价格需要大于买入价格；同时，你不能在买入前卖出股票。

示例 2：

输入：prices = [7,6,4,3,1]
输出：0
解释：在这种情况下, 没有交易完成, 所以最大利润为 0。

 

提示：

	• 1 5

	• 0 4','[{"input":"[7,1,5,3,6,4]","output":"5","explanation":"在第 2 天（股票价格 = 1）的时候买入，在第 5 天（股票价格 = 6）的时候卖出，最大利润 = 6-1 = 5 。\n     注意利润不能是 7-1 = 6, 因为卖出价格需要大于买入价格；同时，你不能在买入前卖出股票。"},{"input":"prices = [7,6,4,3,1]","output":"0","explanation":"在这种情况下, 没有交易完成, 所以最大利润为 0。"}]'::jsonb,'[7,1,5,3,6,4]
[7,6,4,3,1]',ARRAY['数组','动态规划']::text[],'{"java":"class Solution {\n    public int maxProfit(int[] prices) {\n        \n    }\n}"}'::jsonb,'{"java":"import java.io.*;\nimport java.util.*;\n\npublic class Main {\n    public static void main(String[] args) throws Exception {\n        Scanner scanner = new Scanner(System.in);\n        // 每个参数占一行；数组、矩阵等复合参数使用 JSON 外观。\n        // 可用 nextInt()/next() 读取空白分隔数据，或 nextLine() 读取整行。\n        // TODO: 解析输入并输出答案。\n        scanner.close();\n    }\n}\n"}'::jsonb),
('codetop',19,'300',1384,'最长上升子序列','longest-increasing-subsequence','中等',NULL,273,'2026-08-22T03:31:36.355000Z',TRUE,'https://leetcode.cn/problems/longest-increasing-subsequence/','给你一个整数数组 nums ，找到其中最长严格递增子序列的长度。

子序列 是由数组派生而来的序列，删除（或不删除）数组中的元素而不改变其余元素的顺序。例如，[3,6,2,7] 是数组 [0,3,1,6,2,2,7] 的子序列。

示例 1：

输入：nums = [10,9,2,5,3,7,101,18]
输出：4
解释：最长递增子序列是 [2,3,7,101]，因此长度为 4 。

示例 2：

输入：nums = [0,1,0,3,2,3]
输出：4

示例 3：

输入：nums = [7,7,7,7,7,7,7]
输出：1

提示：

	• 1

	• -104 4

进阶：

	• 你能将算法的时间复杂度降低到 O(n log(n)) 吗?','[{"input":"nums = [10,9,2,5,3,7,101,18]","output":"4","explanation":"最长递增子序列是 [2,3,7,101]，因此长度为 4 。"},{"input":"nums = [0,1,0,3,2,3]","output":"4","explanation":""},{"input":"nums = [7,7,7,7,7,7,7]","output":"1","explanation":""}]'::jsonb,'[10,9,2,5,3,7,101,18]
[0,1,0,3,2,3]
[7,7,7,7,7,7,7]',ARRAY['数组','二分查找','动态规划','longest-increasing-subsequence']::text[],'{"java":"class Solution {\n    public int lengthOfLIS(int[] nums) {\n        \n    }\n}"}'::jsonb,'{"java":"import java.io.*;\nimport java.util.*;\n\npublic class Main {\n    public static void main(String[] args) throws Exception {\n        Scanner scanner = new Scanner(System.in);\n        // 每个参数占一行；数组、矩阵等复合参数使用 JSON 外观。\n        // 可用 nextInt()/next() 读取空白分隔数据，或 nextLine() 读取整行。\n        // TODO: 解析输入并输出答案。\n        scanner.close();\n    }\n}\n"}'::jsonb),
('codetop',20,'92',1592,'反转链表 II','reverse-linked-list-ii','中等',NULL,271,'2026-06-30T16:00:00Z',FALSE,'https://leetcode.cn/problems/reverse-linked-list-ii/','给你单链表的头指针 head 和两个整数 left 和 right ，其中 left  。请你反转从位置 left 到位置 right 的链表节点，返回 反转后的链表 。
 

示例 1：

输入：head = [1,2,3,4,5], left = 2, right = 4
输出：[1,4,3,2,5]

示例 2：

输入：head = [5], left = 1, right = 1
输出：[5]

 

提示：

	• 链表中节点数目为 n

	• 1

	• -500

	• 1

 

进阶： 你可以使用一趟扫描完成反转吗？','[{"input":"head = [1,2,3,4,5], left = 2, right = 4","output":"[1,4,3,2,5]","explanation":""},{"input":"head = [5], left = 1, right = 1","output":"[5]","explanation":""}]'::jsonb,'[1,2,3,4,5]
2
4
[5]
1
1',ARRAY['链表']::text[],'{"java":"/**\n * Definition for singly-linked list.\n * public class ListNode {\n *     int val;\n *     ListNode next;\n *     ListNode() {}\n *     ListNode(int val) { this.val = val; }\n *     ListNode(int val, ListNode next) { this.val = val; this.next = next; }\n * }\n */\nclass Solution {\n    public ListNode reverseBetween(ListNode head, int left, int right) {\n        \n    }\n}"}'::jsonb,'{"java":"import java.io.*;\nimport java.util.*;\n\npublic class Main {\n    public static void main(String[] args) throws Exception {\n        Scanner scanner = new Scanner(System.in);\n        // 每个参数占一行；数组、矩阵等复合参数使用 JSON 外观。\n        // 可用 nextInt()/next() 读取空白分隔数据，或 nextLine() 读取整行。\n        // TODO: 解析输入并输出答案。\n        scanner.close();\n    }\n}\n"}'::jsonb),
('codetop',21,'103',1581,'二叉树的锯齿形层次遍历','binary-tree-zigzag-level-order-traversal','中等',NULL,269,'2026-06-30T16:00:00Z',FALSE,'https://leetcode.cn/problems/binary-tree-zigzag-level-order-traversal/','给你二叉树的根节点 root ，返回其节点值的 锯齿形层序遍历 。（即先从左往右，再从右往左进行下一层遍历，以此类推，层与层之间交替进行）。

示例 1：

输入：root = [3,9,20,null,null,15,7]
输出：[[3],[20,9],[15,7]]

示例 2：

输入：root = [1]
输出：[[1]]

示例 3：

输入：root = []
输出：[]

提示：

	• 树中节点数目在范围 [0, 2000] 内

	• -100','[{"input":"root = [3,9,20,null,null,15,7]","output":"[[3],[20,9],[15,7]]","explanation":""},{"input":"root = [1]","output":"[[1]]","explanation":""},{"input":"root = []","output":"[]","explanation":""}]'::jsonb,'[3,9,20,null,null,15,7]
[1]
[]',ARRAY['树','广度优先搜索','二叉树']::text[],'{"java":"/**\n * Definition for a binary tree node.\n * public class TreeNode {\n *     int val;\n *     TreeNode left;\n *     TreeNode right;\n *     TreeNode() {}\n *     TreeNode(int val) { this.val = val; }\n *     TreeNode(int val, TreeNode left, TreeNode right) {\n *         this.val = val;\n *         this.left = left;\n *         this.right = right;\n *     }\n * }\n */\nclass Solution {\n    public List<List<Integer>> zigzagLevelOrder(TreeNode root) {\n        \n    }\n}"}'::jsonb,'{"java":"import java.io.*;\nimport java.util.*;\n\npublic class Main {\n    public static void main(String[] args) throws Exception {\n        Scanner scanner = new Scanner(System.in);\n        // 每个参数占一行；数组、矩阵等复合参数使用 JSON 外观。\n        // 可用 nextInt()/next() 读取空白分隔数据，或 nextLine() 读取整行。\n        // TODO: 解析输入并输出答案。\n        scanner.close();\n    }\n}\n"}'::jsonb),
('codetop',22,'236',1448,'二叉树的最近公共祖先','lowest-common-ancestor-of-a-binary-tree','中等',NULL,267,'2026-07-06T03:47:33.336000Z',TRUE,'https://leetcode.cn/problems/lowest-common-ancestor-of-a-binary-tree/','给定一个二叉树, 找到该树中两个指定节点的最近公共祖先。

百度百科中最近公共祖先的定义为：“对于有根树 T 的两个节点 p、q，最近公共祖先表示为一个节点 x，满足 x 是 p、q 的祖先且 x 的深度尽可能大（一个节点也可以是它自己的祖先）。”

 

示例 1：

输入：root = [3,5,1,6,2,0,8,null,null,7,4], p = 5, q = 1
输出：3
解释：节点 5 和节点 1 的最近公共祖先是节点 3 。

示例 2：

输入：root = [3,5,1,6,2,0,8,null,null,7,4], p = 5, q = 4
输出：5
解释：节点 5 和节点 4 的最近公共祖先是节点 5 。因为根据定义最近公共祖先节点可以为节点本身。

示例 3：

输入：root = [1,2], p = 1, q = 2
输出：1

 

提示：

	• 树中节点数目在范围 [2, 105] 内。

	• -109 9

	• 所有 Node.val 互不相同 。

	• p != q

	• p 和 q 均存在于给定的二叉树中。','[{"input":"root = [3,5,1,6,2,0,8,null,null,7,4], p = 5, q = 1","output":"3","explanation":"节点 5 和节点 1 的最近公共祖先是节点 3 。"},{"input":"root = [3,5,1,6,2,0,8,null,null,7,4], p = 5, q = 4","output":"5","explanation":"节点 5 和节点 4 的最近公共祖先是节点 5 。因为根据定义最近公共祖先节点可以为节点本身。"},{"input":"root = [1,2], p = 1, q = 2","output":"1","explanation":""}]'::jsonb,'[3,5,1,6,2,0,8,null,null,7,4]
5
1
[3,5,1,6,2,0,8,null,null,7,4]
5
4
[1,2]
1
2',ARRAY['树','深度优先搜索','二叉树','lowest-common-ancestor','binary-lifting']::text[],'{"java":"/**\n * Definition for a binary tree node.\n * public class TreeNode {\n *     int val;\n *     TreeNode left;\n *     TreeNode right;\n *     TreeNode(int x) { val = x; }\n * }\n */\nclass Solution {\n    public TreeNode lowestCommonAncestor(TreeNode root, TreeNode p, TreeNode q) {\n        \n    }\n}"}'::jsonb,'{"java":"import java.io.*;\nimport java.util.*;\n\npublic class Main {\n    public static void main(String[] args) throws Exception {\n        Scanner scanner = new Scanner(System.in);\n        // 每个参数占一行；数组、矩阵等复合参数使用 JSON 外观。\n        // 可用 nextInt()/next() 读取空白分隔数据，或 nextLine() 读取整行。\n        // TODO: 解析输入并输出答案。\n        scanner.close();\n    }\n}\n"}'::jsonb),
('codetop',23,'23',1661,'合并K个排序链表','merge-k-sorted-lists','困难',NULL,259,'2026-08-21T14:42:07.751000Z',TRUE,'https://leetcode.cn/problems/merge-k-sorted-lists/','给你一个链表数组，每个链表都已经按升序排列。

请你将所有链表合并到一个升序链表中，返回合并后的链表。

示例 1：

输入：lists = [[1,4,5],[1,3,4],[2,6]]
输出：[1,1,2,3,4,4,5,6]
解释：链表数组如下：
[
  1->4->5,
  1->3->4,
  2->6
]
将它们合并到一个有序链表中得到。
1->1->2->3->4->4->5->6

示例 2：

输入：lists = []
输出：[]

示例 3：

输入：lists = [[]]
输出：[]

提示：

	• k == lists.length

	• 0

	• 0

	• -10^4

	• lists[i] 按 升序 排列

	• lists[i].length 的总和不超过 10^4','[{"input":"lists = [[1,4,5],[1,3,4],[2,6]]","output":"[1,1,2,3,4,4,5,6]","explanation":"链表数组如下：\n[\n  1->4->5,\n  1->3->4,\n  2->6\n]\n将它们合并到一个有序链表中得到。\n1->1->2->3->4->4->5->6"},{"input":"lists = []","output":"[]","explanation":""},{"input":"lists = [[]]","output":"[]","explanation":""}]'::jsonb,'[[1,4,5],[1,3,4],[2,6]]
[]
[[]]',ARRAY['链表','分治','堆（优先队列）','归并排序','tournament-sort']::text[],'{"java":"/**\n * Definition for singly-linked list.\n * public class ListNode {\n *     int val;\n *     ListNode next;\n *     ListNode() {}\n *     ListNode(int val) { this.val = val; }\n *     ListNode(int val, ListNode next) { this.val = val; this.next = next; }\n * }\n */\nclass Solution {\n    public ListNode mergeKLists(ListNode[] lists) {\n        \n    }\n}"}'::jsonb,'{"java":"import java.io.*;\nimport java.util.*;\n\npublic class Main {\n    public static void main(String[] args) throws Exception {\n        Scanner scanner = new Scanner(System.in);\n        // 每个参数占一行；数组、矩阵等复合参数使用 JSON 外观。\n        // 可用 nextInt()/next() 读取空白分隔数据，或 nextLine() 读取整行。\n        // TODO: 解析输入并输出答案。\n        scanner.close();\n    }\n}\n"}'::jsonb),
('codetop',24,'54',1630,'螺旋矩阵','spiral-matrix','中等',NULL,256,'2026-07-30T07:31:56.885000Z',TRUE,'https://leetcode.cn/problems/spiral-matrix/','给你一个 m 行 n 列的矩阵 matrix ，请按照 顺时针螺旋顺序 ，返回矩阵中的所有元素。

 

示例 1：

输入：matrix = [[1,2,3],[4,5,6],[7,8,9]]
输出：[1,2,3,6,9,8,7,4,5]

示例 2：

输入：matrix = [[1,2,3,4],[5,6,7,8],[9,10,11,12]]
输出：[1,2,3,4,8,12,11,10,9,5,6,7]

 

提示：

	• m == matrix.length

	• n == matrix[i].length

	• 1

	• -100','[{"input":"matrix = [[1,2,3],[4,5,6],[7,8,9]]","output":"[1,2,3,6,9,8,7,4,5]","explanation":""},{"input":"matrix = [[1,2,3,4],[5,6,7,8],[9,10,11,12]]","output":"[1,2,3,4,8,12,11,10,9,5,6,7]","explanation":""}]'::jsonb,'[[1,2,3],[4,5,6],[7,8,9]]
[[1,2,3,4],[5,6,7,8],[9,10,11,12]]',ARRAY['数组','矩阵','模拟']::text[],'{"java":"class Solution {\n    public List<Integer> spiralOrder(int[][] matrix) {\n        \n    }\n}"}'::jsonb,'{"java":"import java.io.*;\nimport java.util.*;\n\npublic class Main {\n    public static void main(String[] args) throws Exception {\n        Scanner scanner = new Scanner(System.in);\n        // 每个参数占一行；数组、矩阵等复合参数使用 JSON 外观。\n        // 可用 nextInt()/next() 读取空白分隔数据，或 nextLine() 读取整行。\n        // TODO: 解析输入并输出答案。\n        scanner.close();\n    }\n}\n"}'::jsonb),
('codetop',25,'141',1543,'环形链表','linked-list-cycle','简单',NULL,254,'2026-08-17T16:00:00Z',TRUE,'https://leetcode.cn/problems/linked-list-cycle/','给你一个链表的头节点 head ，判断链表中是否有环。

如果链表中有某个节点，可以通过连续跟踪 next 指针再次到达，则链表中存在环。 为了表示给定链表中的环，评测系统内部使用整数 pos 来表示链表尾连接到链表中的位置（索引从 0 开始）。注意：pos 不作为参数进行传递 。仅仅是为了标识链表的实际情况。

如果链表中存在环 ，则返回 true 。 否则，返回 false 。

示例 1：

输入：head = [3,2,0,-4], pos = 1
输出：true
解释：链表中有一个环，其尾部连接到第二个节点。

示例 2：

输入：head = [1,2], pos = 0
输出：true
解释：链表中有一个环，其尾部连接到第一个节点。

示例 3：

输入：head = [1], pos = -1
输出：false
解释：链表中没有环。

提示：

	• 链表中节点的数目范围是 [0, 104]

	• -105 5

	• pos 为 -1 或者链表中的一个 有效索引 。

进阶：你能用 O(1)（即，常量）内存解决此问题吗？','[{"input":"head = [3,2,0,-4], pos = 1","output":"true","explanation":"链表中有一个环，其尾部连接到第二个节点。"},{"input":"head = [1,2], pos = 0","output":"true","explanation":"链表中有一个环，其尾部连接到第一个节点。"},{"input":"head = [1], pos = -1","output":"false","explanation":"链表中没有环。"}]'::jsonb,'[3,2,0,-4]
1
[1,2]
0
[1]
-1',ARRAY['哈希表','链表','双指针','floyds-cycle-finding-algorithm']::text[],'{"java":"/**\n * Definition for singly-linked list.\n * class ListNode {\n *     int val;\n *     ListNode next;\n *     ListNode(int x) {\n *         val = x;\n *         next = null;\n *     }\n * }\n */\npublic class Solution {\n    public boolean hasCycle(ListNode head) {\n        \n    }\n}"}'::jsonb,'{"java":"import java.io.*;\nimport java.util.*;\n\npublic class Main {\n    public static void main(String[] args) throws Exception {\n        Scanner scanner = new Scanner(System.in);\n        // 每个参数占一行；数组、矩阵等复合参数使用 JSON 外观。\n        // 可用 nextInt()/next() 读取空白分隔数据，或 nextLine() 读取整行。\n        // TODO: 解析输入并输出答案。\n        scanner.close();\n    }\n}\n"}'::jsonb),
('codetop',26,'143',1541,'重排链表','reorder-list','中等',NULL,253,'2026-05-27T13:23:36.188000Z',FALSE,'https://leetcode.cn/problems/reorder-list/','给定一个单链表 L 的头节点 head ，单链表 L 表示为：

L0 → L1 → … → Ln - 1 → Ln

请将其重新排列后变为：

L0 → Ln → L1 → Ln - 1 → L2 → Ln - 2 → …

不能只是单纯的改变节点内部的值，而是需要实际的进行节点交换。

示例 1：

输入：head = [1,2,3,4]
输出：[1,4,2,3]

示例 2：

输入：head = [1,2,3,4,5]
输出：[1,5,2,4,3]

提示：

	• 链表的长度范围为 [1, 5 * 104]

	• 1','[{"input":"head = [1,2,3,4]","output":"[1,4,2,3]","explanation":""},{"input":"head = [1,2,3,4,5]","output":"[1,5,2,4,3]","explanation":""}]'::jsonb,'[1,2,3,4]
[1,2,3,4,5]',ARRAY['栈','递归','链表','双指针']::text[],'{"java":"/**\n * Definition for singly-linked list.\n * public class ListNode {\n *     int val;\n *     ListNode next;\n *     ListNode() {}\n *     ListNode(int val) { this.val = val; }\n *     ListNode(int val, ListNode next) { this.val = val; this.next = next; }\n * }\n */\nclass Solution {\n    public void reorderList(ListNode head) {\n        \n    }\n}"}'::jsonb,'{"java":"import java.io.*;\nimport java.util.*;\n\npublic class Main {\n    public static void main(String[] args) throws Exception {\n        Scanner scanner = new Scanner(System.in);\n        // 每个参数占一行；数组、矩阵等复合参数使用 JSON 外观。\n        // 可用 nextInt()/next() 读取空白分隔数据，或 nextLine() 读取整行。\n        // TODO: 解析输入并输出答案。\n        scanner.close();\n    }\n}\n"}'::jsonb),
('codetop',27,'56',1628,'合并区间','merge-intervals','中等',NULL,246,'2026-08-15T07:58:37.064000Z',TRUE,'https://leetcode.cn/problems/merge-intervals/','以数组 intervals 表示若干个区间的集合，其中单个区间为 intervals[i] = [starti, endi] 。请你合并所有重叠的区间，并返回 一个不重叠的区间数组，该数组需恰好覆盖输入中的所有区间 。

示例 1：

输入：intervals = [[1,3],[2,6],[8,10],[15,18]]
输出：[[1,6],[8,10],[15,18]]
解释：区间 [1,3] 和 [2,6] 重叠, 将它们合并为 [1,6].

示例 2：

输入：intervals = [[1,4],[4,5]]
输出：[[1,5]]
解释：区间 [1,4] 和 [4,5] 可被视为重叠区间。

示例 3：

输入：intervals = [[4,7],[1,4]]
输出：[[1,7]]
解释：区间 [1,4] 和 [4,7] 可被视为重叠区间。

提示：

	• 1 4

	• intervals[i].length == 2

	• 0 i i 4','[{"input":"intervals = [[1,3],[2,6],[8,10],[15,18]]","output":"[[1,6],[8,10],[15,18]]","explanation":"区间 [1,3] 和 [2,6] 重叠, 将它们合并为 [1,6]."},{"input":"intervals = [[1,4],[4,5]]","output":"[[1,5]]","explanation":"区间 [1,4] 和 [4,5] 可被视为重叠区间。"},{"input":"intervals = [[4,7],[1,4]]","output":"[[1,7]]","explanation":"区间 [1,4] 和 [4,7] 可被视为重叠区间。"}]'::jsonb,'[[1,3],[2,6],[8,10],[15,18]]
[[1,4],[4,5]]
[[4,7],[1,4]]',ARRAY['数组','排序','quicksort']::text[],'{"java":"class Solution {\n    public int[][] merge(int[][] intervals) {\n        \n    }\n}"}'::jsonb,'{"java":"import java.io.*;\nimport java.util.*;\n\npublic class Main {\n    public static void main(String[] args) throws Exception {\n        Scanner scanner = new Scanner(System.in);\n        // 每个参数占一行；数组、矩阵等复合参数使用 JSON 外观。\n        // 可用 nextInt()/next() 读取空白分隔数据，或 nextLine() 读取整行。\n        // TODO: 解析输入并输出答案。\n        scanner.close();\n    }\n}\n"}'::jsonb),
('codetop',28,'415',1269,'字符串相加','add-strings','简单',NULL,243,'2026-08-20T08:37:09.079000Z',FALSE,'https://leetcode.cn/problems/add-strings/','给定两个字符串形式的非负整数 num1 和num2 ，计算它们的和并同样以字符串形式返回。

你不能使用任何內建的用于处理大整数的库（比如 BigInteger）， 也不能直接将输入的字符串转换为整数形式。

示例 1：

输入：num1 = "11", num2 = "123"
输出："134"

示例 2：

输入：num1 = "456", num2 = "77"
输出："533"

示例 3：

输入：num1 = "0", num2 = "0"
输出："0"

提示：

	• 1 4

	• num1 和num2 都只包含数字 0-9

	• num1 和num2 都不包含任何前导零','[{"input":"num1 = \"11\", num2 = \"123\"","output":"\"134\"","explanation":""},{"input":"num1 = \"456\", num2 = \"77\"","output":"\"533\"","explanation":""},{"input":"num1 = \"0\", num2 = \"0\"","output":"\"0\"","explanation":""}]'::jsonb,'"11"
"123"
"456"
"77"
"0"
"0"',ARRAY['数学','字符串','模拟']::text[],'{"java":"class Solution {\n    public String addStrings(String num1, String num2) {\n        \n    }\n}"}'::jsonb,'{"java":"import java.io.*;\nimport java.util.*;\n\npublic class Main {\n    public static void main(String[] args) throws Exception {\n        Scanner scanner = new Scanner(System.in);\n        // 每个参数占一行；数组、矩阵等复合参数使用 JSON 外观。\n        // 可用 nextInt()/next() 读取空白分隔数据，或 nextLine() 读取整行。\n        // TODO: 解析输入并输出答案。\n        scanner.close();\n    }\n}\n"}'::jsonb),
('codetop',29,'72',1612,'编辑距离','edit-distance','困难',NULL,205,'2026-08-12T07:34:31.527000Z',TRUE,'https://leetcode.cn/problems/edit-distance/','给你两个单词 word1 和 word2， 请返回将 word1 转换成 word2 所使用的最少操作数  。

你可以对一个单词进行如下三种操作：

	• 插入一个字符

	• 删除一个字符

	• 替换一个字符

示例 1：

输入：word1 = "horse", word2 = "ros"
输出：3
解释：
horse -> rorse (将 ''h'' 替换为 ''r'')
rorse -> rose (删除 ''r'')
rose -> ros (删除 ''e'')

示例 2：

输入：word1 = "intention", word2 = "execution"
输出：5
解释：
intention -> inention (删除 ''t'')
inention -> enention (将 ''i'' 替换为 ''e'')
enention -> exention (将 ''n'' 替换为 ''x'')
exention -> exection (将 ''n'' 替换为 ''c'')
exection -> execution (插入 ''u'')

提示：

	• 0

	• word1 和 word2 由小写英文字母组成','[{"input":"word1 = \"horse\", word2 = \"ros\"","output":"3","explanation":"horse -> rorse (将 ''h'' 替换为 ''r'')\nrorse -> rose (删除 ''r'')\nrose -> ros (删除 ''e'')"},{"input":"word1 = \"intention\", word2 = \"execution\"","output":"5","explanation":"intention -> inention (删除 ''t'')\ninention -> enention (将 ''i'' 替换为 ''e'')\nenention -> exention (将 ''n'' 替换为 ''x'')\nexention -> exection (将 ''n'' 替换为 ''c'')\nexection -> execution (插入 ''u'')"}]'::jsonb,'"horse"
"ros"
"intention"
"execution"',ARRAY['字符串','动态规划']::text[],'{"java":"class Solution {\n    public int minDistance(String word1, String word2) {\n        \n    }\n}"}'::jsonb,'{"java":"import java.io.*;\nimport java.util.*;\n\npublic class Main {\n    public static void main(String[] args) throws Exception {\n        Scanner scanner = new Scanner(System.in);\n        // 每个参数占一行；数组、矩阵等复合参数使用 JSON 外观。\n        // 可用 nextInt()/next() 读取空白分隔数据，或 nextLine() 读取整行。\n        // TODO: 解析输入并输出答案。\n        scanner.close();\n    }\n}\n"}'::jsonb),
('codetop',30,'160',1524,'相交链表','intersection-of-two-linked-lists','简单',NULL,202,'2026-06-29T16:00:00Z',TRUE,'https://leetcode.cn/problems/intersection-of-two-linked-lists/','给你两个单链表的头节点 headA 和 headB ，请你找出并返回两个单链表相交的起始节点。如果两个链表不存在相交节点，返回 null 。

图示两个链表在节点 c1 开始相交：

题目数据 保证 整个链式结构中不存在环。

注意，函数返回结果后，链表必须 保持其原始结构 。

自定义评测：

评测系统 的输入如下（你设计的程序 不适用 此输入）：

	• intersectVal - 相交的起始节点的值。如果不存在相交节点，这一值为 0

	• listA - 第一个链表

	• listB - 第二个链表

	• skipA - 在 listA 中（从头节点开始）跳到交叉节点的节点数

	• skipB - 在 listB 中（从头节点开始）跳到交叉节点的节点数

评测系统将根据这些输入创建链式数据结构，并将两个头节点 headA 和 headB 传递给你的程序。如果程序能够正确返回相交节点，那么你的解决方案将被 视作正确答案 。

示例 1：

输入：intersectVal = 8, listA = [4,1,8,4,5], listB = [5,6,1,8,4,5], skipA = 2, skipB = 3
输出：Intersected at ''8''
解释：相交节点的值为 8 （注意，如果两个链表相交则不能为 0）。
从各自的表头开始算起，链表 A 为 [4,1,8,4,5]，链表 B 为 [5,6,1,8,4,5]。
在 A 中，相交节点前有 2 个节点；在 B 中，相交节点前有 3 个节点。
— 请注意相交节点的值不为 1，因为在链表 A 和链表 B 之中值为 1 的节点 (A 中第二个节点和 B 中第三个节点) 是不同的节点。换句话说，它们在内存中指向两个不同的位置，而链表 A 和链表 B 中值为 8 的节点 (A 中第三个节点，B 中第四个节点) 在内存中指向相同的位置。

示例 2：

输入：intersectVal = 2, listA = [1,9,1,2,4], listB = [3,2,4], skipA = 3, skipB = 1
输出：Intersected at ''2''
解释：相交节点的值为 2 （注意，如果两个链表相交则不能为 0）。
从各自的表头开始算起，链表 A 为 [1,9,1,2,4]，链表 B 为 [3,2,4]。
在 A 中，相交节点前有 3 个节点；在 B 中，相交节点前有 1 个节点。

示例 3：

输入：intersectVal = 0, listA = [2,6,4], listB = [1,5], skipA = 3, skipB = 2
输出：No intersection
解释：从各自的表头开始算起，链表 A 为 [2,6,4]，链表 B 为 [1,5]。
由于这两个链表不相交，所以 intersectVal 必须为 0，而 skipA 和 skipB 可以是任意值。
这两个链表不相交，因此返回 null 。

提示：

	• listA 中节点数目为 m

	• listB 中节点数目为 n

	• 1 4

	• 1 5

	• 0

	• 0

	• 如果 listA 和 listB 没有交点，intersectVal 为 0

	• 如果 listA 和 listB 有交点，intersectVal == listA[skipA] == listB[skipB]

进阶：你能否设计一个时间复杂度 O(m + n) 、仅用 O(1) 内存的解决方案？','[{"input":"intersectVal = 8, listA = [4,1,8,4,5], listB = [5,6,1,8,4,5], skipA = 2, skipB = 3","output":"Intersected at ''8''","explanation":"相交节点的值为 8 （注意，如果两个链表相交则不能为 0）。\n从各自的表头开始算起，链表 A 为 [4,1,8,4,5]，链表 B 为 [5,6,1,8,4,5]。\n在 A 中，相交节点前有 2 个节点；在 B 中，相交节点前有 3 个节点。\n— 请注意相交节点的值不为 1，因为在链表 A 和链表 B 之中值为 1 的节点 (A 中第二个节点和 B 中第三个节点) 是不同的节点。换句话说，它们在内存中指向两个不同的位置，而链表 A 和链表 B 中值为 8 的节点 (A 中第三个节点，B 中第四个节点) 在内存中指向相同的位置。"},{"input":"intersectVal = 2, listA = [1,9,1,2,4], listB = [3,2,4], skipA = 3, skipB = 1","output":"Intersected at ''2''","explanation":"相交节点的值为 2 （注意，如果两个链表相交则不能为 0）。\n从各自的表头开始算起，链表 A 为 [1,9,1,2,4]，链表 B 为 [3,2,4]。\n在 A 中，相交节点前有 3 个节点；在 B 中，相交节点前有 1 个节点。"},{"input":"intersectVal = 0, listA = [2,6,4], listB = [1,5], skipA = 3, skipB = 2","output":"No intersection","explanation":"从各自的表头开始算起，链表 A 为 [2,6,4]，链表 B 为 [1,5]。\n由于这两个链表不相交，所以 intersectVal 必须为 0，而 skipA 和 skipB 可以是任意值。\n这两个链表不相交，因此返回 null 。"}]'::jsonb,'8
[4,1,8,4,5]
[5,6,1,8,4,5]
2
3
2
[1,9,1,2,4]
[3,2,4]
3
1
0
[2,6,4]
[1,5]
3
2',ARRAY['哈希表','链表','双指针']::text[],'{"java":"/**\n * Definition for singly-linked list.\n * public class ListNode {\n *     int val;\n *     ListNode next;\n *     ListNode(int x) {\n *         val = x;\n *         next = null;\n *     }\n * }\n */\npublic class Solution {\n    public ListNode getIntersectionNode(ListNode headA, ListNode headB) {\n        \n    }\n}"}'::jsonb,'{"java":"import java.io.*;\nimport java.util.*;\n\npublic class Main {\n    public static void main(String[] args) throws Exception {\n        Scanner scanner = new Scanner(System.in);\n        // 每个参数占一行；数组、矩阵等复合参数使用 JSON 外观。\n        // 可用 nextInt()/next() 读取空白分隔数据，或 nextLine() 读取整行。\n        // TODO: 解析输入并输出答案。\n        scanner.close();\n    }\n}\n"}'::jsonb),
('codetop',31,'42',1642,'接雨水','trapping-rain-water','困难',NULL,199,'2026-08-05T14:54:43.039000Z',TRUE,'https://leetcode.cn/problems/trapping-rain-water/','给定 n 个非负整数表示每个宽度为 1 的柱子的高度图，计算按此排列的柱子，下雨之后能接多少雨水。

示例 1：

输入：height = [0,1,0,2,1,0,1,3,2,1,2,1]
输出：6
解释：上面是由数组 [0,1,0,2,1,0,1,3,2,1,2,1] 表示的高度图，在这种情况下，可以接 6 个单位的雨水（蓝色部分表示雨水）。

示例 2：

输入：height = [4,2,0,3,2,5]
输出：9

提示：

	• n == height.length

	• 1 4

	• 0 5','[{"input":"height = [0,1,0,2,1,0,1,3,2,1,2,1]","output":"6","explanation":"上面是由数组 [0,1,0,2,1,0,1,3,2,1,2,1] 表示的高度图，在这种情况下，可以接 6 个单位的雨水（蓝色部分表示雨水）。"},{"input":"height = [4,2,0,3,2,5]","output":"9","explanation":""}]'::jsonb,'[0,1,0,2,1,0,1,3,2,1,2,1]
[4,2,0,3,2,5]',ARRAY['栈','数组','双指针','动态规划','单调栈']::text[],'{"java":"class Solution {\n    public int trap(int[] height) {\n        \n    }\n}"}'::jsonb,'{"java":"import java.io.*;\nimport java.util.*;\n\npublic class Main {\n    public static void main(String[] args) throws Exception {\n        Scanner scanner = new Scanner(System.in);\n        // 每个参数占一行；数组、矩阵等复合参数使用 JSON 外观。\n        // 可用 nextInt()/next() 读取空白分隔数据，或 nextLine() 读取整行。\n        // TODO: 解析输入并输出答案。\n        scanner.close();\n    }\n}\n"}'::jsonb),
('codetop',32,'1143',485,'最长公共子序列','longest-common-subsequence','中等',NULL,198,'2026-08-19T16:00:00Z',TRUE,'https://leetcode.cn/problems/longest-common-subsequence/','给定两个字符串 text1 和 text2，返回这两个字符串的最长 公共子序列 的长度。如果不存在 公共子序列 ，返回 0 。

一个字符串的 子序列 是指这样一个新的字符串：它是由原字符串在不改变字符的相对顺序的情况下删除某些字符（也可以不删除任何字符）后组成的新字符串。

	• 例如，"ace" 是 "abcde" 的子序列，但 "aec" 不是 "abcde" 的子序列。

两个字符串的 公共子序列 是这两个字符串所共同拥有的子序列。

 

示例 1：

输入：text1 = "abcde", text2 = "ace"
输出：3
解释：最长公共子序列是 "ace" ，它的长度为 3 。

示例 2：

输入：text1 = "abc", text2 = "abc"
输出：3
解释：最长公共子序列是 "abc" ，它的长度为 3 。

示例 3：

输入：text1 = "abc", text2 = "def"
输出：0
解释：两个字符串没有公共子序列，返回 0 。

 

提示：

	• 1

	• text1 和 text2 仅由小写英文字符组成。','[{"input":"text1 = \"abcde\", text2 = \"ace\"","output":"3","explanation":"最长公共子序列是 \"ace\" ，它的长度为 3 。"},{"input":"text1 = \"abc\", text2 = \"abc\"","output":"3","explanation":"最长公共子序列是 \"abc\" ，它的长度为 3 。"},{"input":"text1 = \"abc\", text2 = \"def\"","output":"0","explanation":"两个字符串没有公共子序列，返回 0 。"}]'::jsonb,'"abcde"
"ace"
"abc"
"abc"
"abc"
"def"',ARRAY['字符串','动态规划','longest-common-subsequence']::text[],'{"java":"class Solution {\n    public int longestCommonSubsequence(String text1, String text2) {\n        \n    }\n}"}'::jsonb,'{"java":"import java.io.*;\nimport java.util.*;\n\npublic class Main {\n    public static void main(String[] args) throws Exception {\n        Scanner scanner = new Scanner(System.in);\n        // 每个参数占一行；数组、矩阵等复合参数使用 JSON 外观。\n        // 可用 nextInt()/next() 读取空白分隔数据，或 nextLine() 读取整行。\n        // TODO: 解析输入并输出答案。\n        scanner.close();\n    }\n}\n"}'::jsonb),
('codetop',33,'82',1602,'删除排序链表中的重复元素 II','remove-duplicates-from-sorted-list-ii','中等',NULL,187,'2026-08-05T16:00:00Z',FALSE,'https://leetcode.cn/problems/remove-duplicates-from-sorted-list-ii/','给定一个已排序的链表的头 head ， 删除原始链表中所有重复数字的节点，只留下不同的数字 。返回 已排序的链表 。

示例 1：

输入：head = [1,2,3,3,4,4,5]
输出：[1,2,5]

示例 2：

输入：head = [1,1,1,2,3]
输出：[2,3]

提示：

	• 链表中节点数目在范围 [0, 300] 内

	• -100

	• 题目数据保证链表已经按升序 排列','[{"input":"head = [1,2,3,3,4,4,5]","output":"[1,2,5]","explanation":""},{"input":"head = [1,1,1,2,3]","output":"[2,3]","explanation":""}]'::jsonb,'[1,2,3,3,4,4,5]
[1,1,1,2,3]',ARRAY['链表','双指针']::text[],'{"java":"/**\n * Definition for singly-linked list.\n * public class ListNode {\n *     int val;\n *     ListNode next;\n *     ListNode() {}\n *     ListNode(int val) { this.val = val; }\n *     ListNode(int val, ListNode next) { this.val = val; this.next = next; }\n * }\n */\nclass Solution {\n    public ListNode deleteDuplicates(ListNode head) {\n        \n    }\n}"}'::jsonb,'{"java":"import java.io.*;\nimport java.util.*;\n\npublic class Main {\n    public static void main(String[] args) throws Exception {\n        Scanner scanner = new Scanner(System.in);\n        // 每个参数占一行；数组、矩阵等复合参数使用 JSON 外观。\n        // 可用 nextInt()/next() 读取空白分隔数据，或 nextLine() 读取整行。\n        // TODO: 解析输入并输出答案。\n        scanner.close();\n    }\n}\n"}'::jsonb),
('codetop',34,'124',1560,'二叉树中的最大路径和','binary-tree-maximum-path-sum','困难',NULL,185,'2026-08-06T16:00:00Z',TRUE,'https://leetcode.cn/problems/binary-tree-maximum-path-sum/','二叉树中的 路径 被定义为一条节点序列，序列中每对相邻节点之间都存在一条边。同一个节点在一条路径序列中 至多出现一次 。该路径 至少包含一个 节点，且不一定经过根节点。

路径和 是路径中各节点值的总和。

给你一个二叉树的根节点 root ，返回其 最大路径和 。

示例 1：

输入：root = [1,2,3]
输出：6
解释：最优路径是 2 -> 1 -> 3 ，路径和为 2 + 1 + 3 = 6

示例 2：

输入：root = [-10,9,20,null,null,15,7]
输出：42
解释：最优路径是 15 -> 20 -> 7 ，路径和为 15 + 20 + 7 = 42

提示：

	• 树中节点数目范围是 [1, 3 * 104]

	• -1000','[{"input":"root = [1,2,3]","output":"6","explanation":"最优路径是 2 -> 1 -> 3 ，路径和为 2 + 1 + 3 = 6"},{"input":"root = [-10,9,20,null,null,15,7]","output":"42","explanation":"最优路径是 15 -> 20 -> 7 ，路径和为 15 + 20 + 7 = 42"}]'::jsonb,'[1,2,3]
[-10,9,20,null,null,15,7]',ARRAY['树','深度优先搜索','动态规划','二叉树','dp-on-trees']::text[],'{"java":"/**\n * Definition for a binary tree node.\n * public class TreeNode {\n *     int val;\n *     TreeNode left;\n *     TreeNode right;\n *     TreeNode() {}\n *     TreeNode(int val) { this.val = val; }\n *     TreeNode(int val, TreeNode left, TreeNode right) {\n *         this.val = val;\n *         this.left = left;\n *         this.right = right;\n *     }\n * }\n */\nclass Solution {\n    public int maxPathSum(TreeNode root) {\n        \n    }\n}"}'::jsonb,'{"java":"import java.io.*;\nimport java.util.*;\n\npublic class Main {\n    public static void main(String[] args) throws Exception {\n        Scanner scanner = new Scanner(System.in);\n        // 每个参数占一行；数组、矩阵等复合参数使用 JSON 外观。\n        // 可用 nextInt()/next() 读取空白分隔数据，或 nextLine() 读取整行。\n        // TODO: 解析输入并输出答案。\n        scanner.close();\n    }\n}\n"}'::jsonb),
('codetop',35,'93',1591,'复原IP地址','restore-ip-addresses','中等',NULL,185,'2026-05-12T16:00:00Z',FALSE,'https://leetcode.cn/problems/restore-ip-addresses/','有效 IP 地址 正好由四个整数（每个整数位于 0 到 255 之间组成，且不能含有前导 0），整数之间用 ''.'' 分隔。

	• 例如："0.1.2.201" 和 "192.168.1.1" 是 有效 IP 地址，但是 "0.011.255.245"、"192.168.1.312" 和 "192.168@1.1" 是 无效 IP 地址。

给定一个只包含数字的字符串 s ，用以表示一个 IP 地址，返回所有可能的有效 IP 地址，这些地址可以通过在 s 中插入 ''.'' 来形成。你 不能 重新排序或删除 s 中的任何数字。你可以按 任何 顺序返回答案。

示例 1：

输入：s = "25525511135"
输出：["255.255.11.135","255.255.111.35"]

示例 2：

输入：s = "0000"
输出：["0.0.0.0"]

示例 3：

输入：s = "101023"
输出：["1.0.10.23","1.0.102.3","10.1.0.23","10.10.2.3","101.0.2.3"]

提示：

	• 1

	• s 仅由数字组成','[{"input":"s = \"25525511135\"","output":"[\"255.255.11.135\",\"255.255.111.35\"]","explanation":""},{"input":"s = \"0000\"","output":"[\"0.0.0.0\"]","explanation":""},{"input":"s = \"101023\"","output":"[\"1.0.10.23\",\"1.0.102.3\",\"10.1.0.23\",\"10.10.2.3\",\"101.0.2.3\"]","explanation":""}]'::jsonb,'"25525511135"
"0000"
"101023"',ARRAY['字符串','回溯']::text[],'{"java":"class Solution {\n    public List<String> restoreIpAddresses(String s) {\n        \n    }\n}"}'::jsonb,'{"java":"import java.io.*;\nimport java.util.*;\n\npublic class Main {\n    public static void main(String[] args) throws Exception {\n        Scanner scanner = new Scanner(System.in);\n        // 每个参数占一行；数组、矩阵等复合参数使用 JSON 外观。\n        // 可用 nextInt()/next() 读取空白分隔数据，或 nextLine() 读取整行。\n        // TODO: 解析输入并输出答案。\n        scanner.close();\n    }\n}\n"}'::jsonb),
('codetop',36,'19',1665,'删除链表的倒数第N个节点','remove-nth-node-from-end-of-list','中等',NULL,184,'2026-07-23T05:11:05.948000Z',TRUE,'https://leetcode.cn/problems/remove-nth-node-from-end-of-list/','给你一个链表，删除链表的倒数第 n 个结点，并且返回链表的头结点。

示例 1：

输入：head = [1,2,3,4,5], n = 2
输出：[1,2,3,5]

示例 2：

输入：head = [1], n = 1
输出：[]

示例 3：

输入：head = [1,2], n = 1
输出：[1]

提示：

	• 链表中结点的数目为 sz

	• 1

	• 0

	• 1

进阶：你能尝试使用一趟扫描实现吗？','[{"input":"head = [1,2,3,4,5], n = 2","output":"[1,2,3,5]","explanation":""},{"input":"head = [1], n = 1","output":"[]","explanation":""},{"input":"head = [1,2], n = 1","output":"[1]","explanation":""}]'::jsonb,'[1,2,3,4,5]
2
[1]
1
[1,2]
1',ARRAY['链表','双指针']::text[],'{"java":"/**\n * Definition for singly-linked list.\n * public class ListNode {\n *     int val;\n *     ListNode next;\n *     ListNode() {}\n *     ListNode(int val) { this.val = val; }\n *     ListNode(int val, ListNode next) { this.val = val; this.next = next; }\n * }\n */\nclass Solution {\n    public ListNode removeNthFromEnd(ListNode head, int n) {\n        \n    }\n}"}'::jsonb,'{"java":"import java.io.*;\nimport java.util.*;\n\npublic class Main {\n    public static void main(String[] args) throws Exception {\n        Scanner scanner = new Scanner(System.in);\n        // 每个参数占一行；数组、矩阵等复合参数使用 JSON 外观。\n        // 可用 nextInt()/next() 读取空白分隔数据，或 nextLine() 读取整行。\n        // TODO: 解析输入并输出答案。\n        scanner.close();\n    }\n}\n"}'::jsonb),
('codetop',37,'4',1680,'寻找两个正序数组的中位数','median-of-two-sorted-arrays','困难',NULL,174,'2026-08-10T16:00:00Z',TRUE,'https://leetcode.cn/problems/median-of-two-sorted-arrays/','给定两个大小分别为 m 和 n 的正序（从小到大）数组 nums1 和 nums2。请你找出并返回这两个正序数组的 中位数 。

算法的时间复杂度应该为 O(log (m+n)) 。

示例 1：

输入：nums1 = [1,3], nums2 = [2]
输出：2.00000
解释：合并数组 = [1,2,3] ，中位数 2

示例 2：

输入：nums1 = [1,2], nums2 = [3,4]
输出：2.50000
解释：合并数组 = [1,2,3,4] ，中位数 (2 + 3) / 2 = 2.5

提示：

	• nums1.length == m

	• nums2.length == n

	• 0

	• 0

	• 1

	• -106 6','[{"input":"nums1 = [1,3], nums2 = [2]","output":"2.00000","explanation":"合并数组 = [1,2,3] ，中位数 2"},{"input":"nums1 = [1,2], nums2 = [3,4]","output":"2.50000","explanation":"合并数组 = [1,2,3,4] ，中位数 (2 + 3) / 2 = 2.5"}]'::jsonb,'[1,3]
[2]
[1,2]
[3,4]',ARRAY['数组','二分查找','分治']::text[],'{"java":"class Solution {\n    public double findMedianSortedArrays(int[] nums1, int[] nums2) {\n        \n    }\n}"}'::jsonb,'{"java":"import java.io.*;\nimport java.util.*;\n\npublic class Main {\n    public static void main(String[] args) throws Exception {\n        Scanner scanner = new Scanner(System.in);\n        // 每个参数占一行；数组、矩阵等复合参数使用 JSON 外观。\n        // 可用 nextInt()/next() 读取空白分隔数据，或 nextLine() 读取整行。\n        // TODO: 解析输入并输出答案。\n        scanner.close();\n    }\n}\n"}'::jsonb),
('codetop',38,'142',1542,'环形链表 II','linked-list-cycle-ii','中等',NULL,170,'2026-05-08T09:19:39.031000Z',TRUE,'https://leetcode.cn/problems/linked-list-cycle-ii/','给定一个链表的头节点  head ，返回链表开始入环的第一个节点。 如果链表无环，则返回 null。

如果链表中有某个节点，可以通过连续跟踪 next 指针再次到达，则链表中存在环。 为了表示给定链表中的环，评测系统内部使用整数 pos 来表示链表尾连接到链表中的位置（索引从 0 开始）。如果 pos 是 -1，则在该链表中没有环。注意：pos 不作为参数进行传递，仅仅是为了标识链表的实际情况。

不允许修改 链表。

示例 1：

输入：head = [3,2,0,-4], pos = 1
输出：返回索引为 1 的链表节点
解释：链表中有一个环，其尾部连接到第二个节点。

示例 2：

输入：head = [1,2], pos = 0
输出：返回索引为 0 的链表节点
解释：链表中有一个环，其尾部连接到第一个节点。

示例 3：

输入：head = [1], pos = -1
输出：返回 null
解释：链表中没有环。

提示：

	• 链表中节点的数目范围在范围 [0, 104] 内

	• -105 5

	• pos 的值为 -1 或者链表中的一个有效索引

进阶：你是否可以使用 O(1) 空间解决此题？','[{"input":"head = [3,2,0,-4], pos = 1","output":"返回索引为 1 的链表节点","explanation":"链表中有一个环，其尾部连接到第二个节点。"},{"input":"head = [1,2], pos = 0","output":"返回索引为 0 的链表节点","explanation":"链表中有一个环，其尾部连接到第一个节点。"},{"input":"head = [1], pos = -1","output":"返回 null","explanation":"链表中没有环。"}]'::jsonb,'[3,2,0,-4]
1
[1,2]
0
[1]
-1',ARRAY['哈希表','链表','双指针','floyds-cycle-finding-algorithm']::text[],'{"java":"/**\n * Definition for singly-linked list.\n * class ListNode {\n *     int val;\n *     ListNode next;\n *     ListNode(int x) {\n *         val = x;\n *         next = null;\n *     }\n * }\n */\npublic class Solution {\n    public ListNode detectCycle(ListNode head) {\n        \n    }\n}"}'::jsonb,'{"java":"import java.io.*;\nimport java.util.*;\n\npublic class Main {\n    public static void main(String[] args) throws Exception {\n        Scanner scanner = new Scanner(System.in);\n        // 每个参数占一行；数组、矩阵等复合参数使用 JSON 外观。\n        // 可用 nextInt()/next() 读取空白分隔数据，或 nextLine() 读取整行。\n        // TODO: 解析输入并输出答案。\n        scanner.close();\n    }\n}\n"}'::jsonb),
('codetop',39,'165',1519,'比较版本号','compare-version-numbers','中等',NULL,166,'2026-08-18T13:25:22.055000Z',FALSE,'https://leetcode.cn/problems/compare-version-numbers/','给你两个 版本号字符串 version1 和 version2 ，请你比较它们。版本号由被点 ''.'' 分开的修订号组成。修订号的值 是它 转换为整数 并忽略前导零。

比较版本号时，请按 从左到右的顺序 依次比较它们的修订号。如果其中一个版本字符串的修订号较少，则将缺失的修订号视为 0。

返回规则如下：

	• 如果 version1 version2 返回 -1，

	• 如果 version1 > version2 返回 1，

	• 除此之外返回 0。

示例 1：

输入：version1 = "1.2", version2 = "1.10"

输出：-1

解释：

version1 的第二个修订号为 "2"，version2 的第二个修订号为 "10"：2 示例 2：

输入：version1 = "1.01", version2 = "1.001"

输出：0

解释：

忽略前导零，"01" 和 "001" 都代表相同的整数 "1"。

示例 3：

输入：version1 = "1.0", version2 = "1.0.0.0"

输出：0

解释：

version1 有更少的修订号，每个缺失的修订号按 "0" 处理。

提示：

	• 1

	• version1 和 version2 仅包含数字和 ''.''

	• version1 和 version2 都是 有效版本号

	• version1 和 version2 的所有修订号都可以存储在 32 位整数 中','[{"input":"version1 = \"1.2\", version2 = \"1.10\"","output":"-1","explanation":"version1 的第二个修订号为 \"2\"，version2 的第二个修订号为 \"10\"：2 < 10，所以 version1 < version2。"},{"input":"version1 = \"1.01\", version2 = \"1.001\"","output":"0","explanation":"忽略前导零，\"01\" 和 \"001\" 都代表相同的整数 \"1\"。"},{"input":"version1 = \"1.0\", version2 = \"1.0.0.0\"","output":"0","explanation":"version1 有更少的修订号，每个缺失的修订号按 \"0\" 处理。"}]'::jsonb,'"1.2"
"1.10"
"1.01"
"1.001"
"1.0"
"1.0.0.0"',ARRAY['双指针','字符串']::text[],'{"java":"class Solution {\n    public int compareVersion(String version1, String version2) {\n        \n    }\n}"}'::jsonb,'{"java":"import java.io.*;\nimport java.util.*;\n\npublic class Main {\n    public static void main(String[] args) throws Exception {\n        Scanner scanner = new Scanner(System.in);\n        // 每个参数占一行；数组、矩阵等复合参数使用 JSON 外观。\n        // 可用 nextInt()/next() 读取空白分隔数据，或 nextLine() 读取整行。\n        // TODO: 解析输入并输出答案。\n        scanner.close();\n    }\n}\n"}'::jsonb),
('codetop',40,'199',1485,'二叉树的右视图','binary-tree-right-side-view','中等',NULL,161,'2026-05-28T10:43:25.630000Z',TRUE,'https://leetcode.cn/problems/binary-tree-right-side-view/','给定一个二叉树的 根节点 root，想象自己站在它的右侧，按照从顶部到底部的顺序，返回从右侧所能看到的节点值。

示例 1：

输入：root = [1,2,3,null,5,null,4]

输出：[1,3,4]

解释：

示例 2：

输入：root = [1,2,3,4,null,null,null,5]

输出：[1,3,4,5]

解释：

示例 3：

输入：root = [1,null,3]

输出：[1,3]

示例 4：

输入：root = []

输出：[]

提示:

	• 二叉树的节点个数的范围是 [0,100]

	• -100','[{"input":"root = [1,2,3,null,5,null,4]","output":"[1,3,4]","explanation":""},{"input":"root = [1,2,3,4,null,null,null,5]","output":"[1,3,4,5]","explanation":""},{"input":"root = [1,null,3]","output":"[1,3]","explanation":""},{"input":"root = []","output":"[]","explanation":""}]'::jsonb,'[1,2,3,null,5,null,4]
[1,2,3,4,null,null,null,5]
[1,null,3]
[]',ARRAY['树','深度优先搜索','广度优先搜索','二叉树']::text[],'{"java":"/**\n * Definition for a binary tree node.\n * public class TreeNode {\n *     int val;\n *     TreeNode left;\n *     TreeNode right;\n *     TreeNode() {}\n *     TreeNode(int val) { this.val = val; }\n *     TreeNode(int val, TreeNode left, TreeNode right) {\n *         this.val = val;\n *         this.left = left;\n *         this.right = right;\n *     }\n * }\n */\nclass Solution {\n    public List<Integer> rightSideView(TreeNode root) {\n        \n    }\n}"}'::jsonb,'{"java":"import java.io.*;\nimport java.util.*;\n\npublic class Main {\n    public static void main(String[] args) throws Exception {\n        Scanner scanner = new Scanner(System.in);\n        // 每个参数占一行；数组、矩阵等复合参数使用 JSON 外观。\n        // 可用 nextInt()/next() 读取空白分隔数据，或 nextLine() 读取整行。\n        // TODO: 解析输入并输出答案。\n        scanner.close();\n    }\n}\n"}'::jsonb),
('codetop',41,'704',925,'二分查找','binary-search','简单',NULL,153,'2026-07-29T16:00:00Z',FALSE,'https://leetcode.cn/problems/binary-search/','给定一个 n 个元素有序的（升序）整型数组 nums 和一个目标值 target  ，写一个函数搜索 nums 中的 target，如果 target 存在返回下标，否则返回 -1。

你必须编写一个具有 O(log n) 时间复杂度的算法。

示例 1:

输入: nums = [-1,0,3,5,9,12], target = 9
输出: 4
解释: 9 出现在 nums 中并且下标为 4

示例 2:

输入: nums = [-1,0,3,5,9,12], target = 2
输出: -1
解释: 2 不存在 nums 中因此返回 -1

提示：

	• 你可以假设 nums 中的所有元素是不重复的。

	• n 将在 [1, 10000]之间。

	• nums 的每个元素都将在 [-9999, 9999]之间。','[{"input":"nums = [-1,0,3,5,9,12], target = 9","output":"4","explanation":"9 出现在 nums 中并且下标为 4"},{"input":"nums = [-1,0,3,5,9,12], target = 2","output":"-1","explanation":"2 不存在 nums 中因此返回 -1"}]'::jsonb,'[-1,0,3,5,9,12]
9
[-1,0,3,5,9,12]
2',ARRAY['数组','二分查找']::text[],'{"java":"class Solution {\n    public int search(int[] nums, int target) {\n        \n    }\n}"}'::jsonb,'{"java":"import java.io.*;\nimport java.util.*;\n\npublic class Main {\n    public static void main(String[] args) throws Exception {\n        Scanner scanner = new Scanner(System.in);\n        // 每个参数占一行；数组、矩阵等复合参数使用 JSON 外观。\n        // 可用 nextInt()/next() 读取空白分隔数据，或 nextLine() 读取整行。\n        // TODO: 解析输入并输出答案。\n        scanner.close();\n    }\n}\n"}'::jsonb),
('codetop',42,'239',1445,'滑动窗口最大值','sliding-window-maximum','困难',NULL,153,'2026-06-18T11:43:13.377000Z',TRUE,'https://leetcode.cn/problems/sliding-window-maximum/','给你一个整数数组 nums，有一个大小为 k 的滑动窗口从数组的最左侧移动到数组的最右侧。你只可以看到在滑动窗口内的 k 个数字。滑动窗口每次只向右移动一位。

返回 滑动窗口中的最大值 。

示例 1：

输入：nums = [1,3,-1,-3,5,3,6,7], k = 3
输出：[3,3,5,5,6,7]
解释：
滑动窗口的位置                最大值
---------------               -----
[1  3  -1] -3  5  3  6  7       3
 1 [3  -1  -3] 5  3  6  7       3
 1  3 [-1  -3  5] 3  6  7       5
 1  3  -1 [-3  5  3] 6  7       5
 1  3  -1  -3 [5  3  6] 7       6
 1  3  -1  -3  5 [3  6  7]      7

示例 2：

输入：nums = [1], k = 1
输出：[1]

提示：

	• 1 5

	• -104 4

	• 1','[{"input":"nums = [1,3,-1,-3,5,3,6,7], k = 3","output":"[3,3,5,5,6,7]","explanation":"滑动窗口的位置                最大值\n---------------               -----\n[1  3  -1] -3  5  3  6  7       3\n 1 [3  -1  -3] 5  3  6  7       3\n 1  3 [-1  -3  5] 3  6  7       5\n 1  3  -1 [-3  5  3] 6  7       5\n 1  3  -1  -3 [5  3  6] 7       6\n 1  3  -1  -3  5 [3  6  7]      7"},{"input":"nums = [1], k = 1","output":"[1]","explanation":""}]'::jsonb,'[1,3,-1,-3,5,3,6,7]
3
[1]
1',ARRAY['队列','数组','滑动窗口','单调队列','堆（优先队列）','range-minimum-maximum-query']::text[],'{"java":"class Solution {\n    public int[] maxSlidingWindow(int[] nums, int k) {\n        \n    }\n}"}'::jsonb,'{"java":"import java.io.*;\nimport java.util.*;\n\npublic class Main {\n    public static void main(String[] args) throws Exception {\n        Scanner scanner = new Scanner(System.in);\n        // 每个参数占一行；数组、矩阵等复合参数使用 JSON 外观。\n        // 可用 nextInt()/next() 读取空白分隔数据，或 nextLine() 读取整行。\n        // TODO: 解析输入并输出答案。\n        scanner.close();\n    }\n}\n"}'::jsonb),
('codetop',43,'22',1662,'括号生成','generate-parentheses','中等',NULL,151,'2026-06-27T09:44:26.951000Z',TRUE,'https://leetcode.cn/problems/generate-parentheses/','数字 n 代表生成括号的对数，请你设计一个函数，用于能够生成所有可能的并且 有效的 括号组合。

示例 1：

输入：n = 3
输出：["((()))","(()())","(())()","()(())","()()()"]

示例 2：

输入：n = 1
输出：["()"]

提示：

	• 1','[{"input":"n = 3","output":"[\"((()))\",\"(()())\",\"(())()\",\"()(())\",\"()()()\"]","explanation":""},{"input":"n = 1","output":"[\"()\"]","explanation":""}]'::jsonb,'3
1',ARRAY['字符串','动态规划','回溯','bracket-sequences']::text[],'{"java":"class Solution {\n    public List<String> generateParenthesis(int n) {\n        \n    }\n}"}'::jsonb,'{"java":"import java.io.*;\nimport java.util.*;\n\npublic class Main {\n    public static void main(String[] args) throws Exception {\n        Scanner scanner = new Scanner(System.in);\n        // 每个参数占一行；数组、矩阵等复合参数使用 JSON 外观。\n        // 可用 nextInt()/next() 读取空白分隔数据，或 nextLine() 读取整行。\n        // TODO: 解析输入并输出答案。\n        scanner.close();\n    }\n}\n"}'::jsonb),
('codetop',44,'32',1652,'最长有效括号','longest-valid-parentheses','困难',NULL,148,'2026-06-04T14:11:37.229000Z',TRUE,'https://leetcode.cn/problems/longest-valid-parentheses/','给你一个只包含 ''('' 和 '')'' 的字符串，找出最长有效（格式正确且连续）括号 子串 的长度。

左右括号匹配，即每个左括号都有对应的右括号将其闭合的字符串是格式正确的，比如 "(()())"。

示例 1：

输入：s = "(()"
输出：2
解释：最长有效括号子串是 "()"

示例 2：

输入：s = ")()())"
输出：4
解释：最长有效括号子串是 "()()"

示例 3：

输入：s = ""
输出：0

提示：

	• 0 4

	• s[i] 为 ''('' 或 '')''','[{"input":"s = \"(()\"","output":"2","explanation":"最长有效括号子串是 \"()\""},{"input":"s = \")()())\"","output":"4","explanation":"最长有效括号子串是 \"()()\""},{"input":"s = \"\"","output":"0","explanation":""}]'::jsonb,'"(()"
")()())"
""',ARRAY['栈','字符串','动态规划','bracket-sequences']::text[],'{"java":"class Solution {\n    public int longestValidParentheses(String s) {\n        \n    }\n}"}'::jsonb,'{"java":"import java.io.*;\nimport java.util.*;\n\npublic class Main {\n    public static void main(String[] args) throws Exception {\n        Scanner scanner = new Scanner(System.in);\n        // 每个参数占一行；数组、矩阵等复合参数使用 JSON 外观。\n        // 可用 nextInt()/next() 读取空白分隔数据，或 nextLine() 读取整行。\n        // TODO: 解析输入并输出答案。\n        scanner.close();\n    }\n}\n"}'::jsonb),
('codetop',45,'69',1615,'x 的平方根','sqrtx','简单',NULL,147,'2026-06-30T07:36:41.977000Z',FALSE,'https://leetcode.cn/problems/sqrtx/','给你一个非负整数 x ，计算并返回 x 的 算术平方根 。

由于返回类型是整数，结果只保留 整数部分 ，小数部分将被 舍去 。

注意：不允许使用任何内置指数函数和算符，例如 pow(x, 0.5) 或者 x ** 0.5 。

示例 1：

输入：x = 4
输出：2

示例 2：

输入：x = 8
输出：2
解释：8 的算术平方根是 2.82842..., 由于返回类型是整数，小数部分将被舍去。

提示：

	• 0 31 - 1','[{"input":"x = 4","output":"2","explanation":""},{"input":"x = 8","output":"2","explanation":"8 的算术平方根是 2.82842..., 由于返回类型是整数，小数部分将被舍去。"}]'::jsonb,'4
8',ARRAY['数学','二分查找','newtons-method']::text[],'{"java":"class Solution {\n    public int mySqrt(int x) {\n        \n    }\n}"}'::jsonb,'{"java":"import java.io.*;\nimport java.util.*;\n\npublic class Main {\n    public static void main(String[] args) throws Exception {\n        Scanner scanner = new Scanner(System.in);\n        // 每个参数占一行；数组、矩阵等复合参数使用 JSON 外观。\n        // 可用 nextInt()/next() 读取空白分隔数据，或 nextLine() 读取整行。\n        // TODO: 解析输入并输出答案。\n        scanner.close();\n    }\n}\n"}'::jsonb),
('codetop',46,'148',1536,'排序链表','sort-list','中等',NULL,147,'2026-06-07T16:00:00Z',TRUE,'https://leetcode.cn/problems/sort-list/','给你链表的头结点 head ，请将其按 升序 排列并返回 排序后的链表 。

示例 1：

输入：head = [4,2,1,3]
输出：[1,2,3,4]

示例 2：

输入：head = [-1,5,3,4,0]
输出：[-1,0,3,4,5]

示例 3：

输入：head = []
输出：[]

提示：

	• 链表中节点的数目在范围 [0, 5 * 104] 内

	• -105 5

进阶：你可以在 O(n log n) 时间复杂度和常数级空间复杂度下，对链表进行排序吗？','[{"input":"head = [4,2,1,3]","output":"[1,2,3,4]","explanation":""},{"input":"head = [-1,5,3,4,0]","output":"[-1,0,3,4,5]","explanation":""},{"input":"head = []","output":"[]","explanation":""}]'::jsonb,'[4,2,1,3]
[-1,5,3,4,0]
[]',ARRAY['链表','双指针','分治','排序','归并排序']::text[],'{"java":"/**\n * Definition for singly-linked list.\n * public class ListNode {\n *     int val;\n *     ListNode next;\n *     ListNode() {}\n *     ListNode(int val) { this.val = val; }\n *     ListNode(int val, ListNode next) { this.val = val; this.next = next; }\n * }\n */\nclass Solution {\n    public ListNode sortList(ListNode head) {\n        \n    }\n}"}'::jsonb,'{"java":"import java.io.*;\nimport java.util.*;\n\npublic class Main {\n    public static void main(String[] args) throws Exception {\n        Scanner scanner = new Scanner(System.in);\n        // 每个参数占一行；数组、矩阵等复合参数使用 JSON 外观。\n        // 可用 nextInt()/next() 读取空白分隔数据，或 nextLine() 读取整行。\n        // TODO: 解析输入并输出答案。\n        scanner.close();\n    }\n}\n"}'::jsonb),
('codetop',47,'94',1590,'二叉树的中序遍历','binary-tree-inorder-traversal','简单',NULL,144,'2026-05-20T16:00:00Z',TRUE,'https://leetcode.cn/problems/binary-tree-inorder-traversal/','给定一个二叉树的根节点 root ，返回 它的 中序 遍历 。

示例 1：

输入：root = [1,null,2,3]
输出：[1,3,2]

示例 2：

输入：root = []
输出：[]

示例 3：

输入：root = [1]
输出：[1]

提示：

	• 树中节点数目在范围 [0, 100] 内

	• -100

进阶: 递归算法很简单，你可以通过迭代算法完成吗？','[{"input":"root = [1,null,2,3]","output":"[1,3,2]","explanation":""},{"input":"root = []","output":"[]","explanation":""},{"input":"root = [1]","output":"[1]","explanation":""}]'::jsonb,'[1,null,2,3]
[1,2,3,4,5,null,8,null,null,6,7,9]
[]
[1]',ARRAY['栈','树','深度优先搜索','二叉树']::text[],'{"java":"/**\n * Definition for a binary tree node.\n * public class TreeNode {\n *     int val;\n *     TreeNode left;\n *     TreeNode right;\n *     TreeNode() {}\n *     TreeNode(int val) { this.val = val; }\n *     TreeNode(int val, TreeNode left, TreeNode right) {\n *         this.val = val;\n *         this.left = left;\n *         this.right = right;\n *     }\n * }\n */\nclass Solution {\n    public List<Integer> inorderTraversal(TreeNode root) {\n        \n    }\n}"}'::jsonb,'{"java":"import java.io.*;\nimport java.util.*;\n\npublic class Main {\n    public static void main(String[] args) throws Exception {\n        Scanner scanner = new Scanner(System.in);\n        // 每个参数占一行；数组、矩阵等复合参数使用 JSON 外观。\n        // 可用 nextInt()/next() 读取空白分隔数据，或 nextLine() 读取整行。\n        // TODO: 解析输入并输出答案。\n        scanner.close();\n    }\n}\n"}'::jsonb),
('codetop',48,'232',1452,'用栈实现队列','implement-queue-using-stacks','简单',NULL,143,'2026-03-08T16:00:00Z',FALSE,'https://leetcode.cn/problems/implement-queue-using-stacks/','请你仅使用两个栈实现先入先出队列。队列应当支持一般队列支持的所有操作（push、pop、peek、empty）：

实现 MyQueue 类：

	• void push(int x) 将元素 x 推到队列的末尾

	• int pop() 从队列的开头移除并返回元素

	• int peek() 返回队列开头的元素

	• boolean empty() 如果队列为空，返回 true ；否则，返回 false

说明：

	• 你 只能 使用标准的栈操作 —— 也就是只有 push to top, peek/pop from top, size, 和 is empty 操作是合法的。

	• 你所使用的语言也许不支持栈。你可以使用 list 或者 deque（双端队列）来模拟一个栈，只要是标准的栈操作即可。

示例 1：

输入：
["MyQueue", "push", "push", "peek", "pop", "empty"]
[[], [1], [2], [], [], []]
输出：
[null, null, null, 1, 1, false]

解释：
MyQueue myQueue = new MyQueue();
myQueue.push(1); // queue is: [1]
myQueue.push(2); // queue is: [1, 2] (leftmost is front of the queue)
myQueue.peek(); // return 1
myQueue.pop(); // return 1, queue is [2]
myQueue.empty(); // return false

提示：

	• 1

	• 最多调用 100 次 push、pop、peek 和 empty

	• 假设所有操作都是有效的 （例如，一个空的队列不会调用 pop 或者 peek 操作）

进阶：

	• 你能否实现每个操作均摊时间复杂度为 O(1) 的队列？换句话说，执行 n 个操作的总时间复杂度为 O(n) ，即使其中一个操作可能花费较长时间。','[{"input":"[\"MyQueue\", \"push\", \"push\", \"peek\", \"pop\", \"empty\"]\n[[], [1], [2], [], [], []]","output":"[null, null, null, 1, 1, false]","explanation":"MyQueue myQueue = new MyQueue();\nmyQueue.push(1); // queue is: [1]\nmyQueue.push(2); // queue is: [1, 2] (leftmost is front of the queue)\nmyQueue.peek(); // return 1\nmyQueue.pop(); // return 1, queue is [2]\nmyQueue.empty(); // return false"}]'::jsonb,'["MyQueue","push","push","peek","pop","empty"]
[[],[1],[2],[],[],[]]',ARRAY['栈','设计','队列']::text[],'{"java":"class MyQueue {\n\n    public MyQueue() {\n        \n    }\n    \n    public void push(int x) {\n        \n    }\n    \n    public int pop() {\n        \n    }\n    \n    public int peek() {\n        \n    }\n    \n    public boolean empty() {\n        \n    }\n}\n\n/**\n * Your MyQueue object will be instantiated and called as such:\n * MyQueue obj = new MyQueue();\n * obj.push(x);\n * int param_2 = obj.pop();\n * int param_3 = obj.peek();\n * boolean param_4 = obj.empty();\n */"}'::jsonb,'{"java":"import java.io.*;\nimport java.util.*;\n\npublic class Main {\n    public static void main(String[] args) throws Exception {\n        Scanner scanner = new Scanner(System.in);\n        // 每个参数占一行；数组、矩阵等复合参数使用 JSON 外观。\n        // 可用 nextInt()/next() 读取空白分隔数据，或 nextLine() 读取整行。\n        // TODO: 解析输入并输出答案。\n        scanner.close();\n    }\n}\n"}'::jsonb),
('codetop',49,'31',1653,'下一个排列','next-permutation','中等',NULL,137,'2026-08-04T16:00:00Z',TRUE,'https://leetcode.cn/problems/next-permutation/','整数数组的一个 排列  就是将其所有成员以序列或线性顺序排列。

	• 例如，arr = [1,2,3] ，以下这些都可以视作 arr 的排列：[1,2,3]、[1,3,2]、[3,1,2]、[2,3,1] 。

整数数组的 下一个排列 是指其整数的下一个字典序更大的排列。更正式地，如果数组的所有排列根据其字典顺序从小到大排列在一个容器中，那么数组的 下一个排列 就是在这个有序容器中排在它后面的那个排列。如果不存在下一个更大的排列，那么这个数组必须重排为字典序最小的排列（即，其元素按升序排列）。

	• 例如，arr = [1,2,3] 的下一个排列是 [1,3,2] 。

	• 类似地，arr = [2,3,1] 的下一个排列是 [3,1,2] 。

	• 而 arr = [3,2,1] 的下一个排列是 [1,2,3] ，因为 [3,2,1] 不存在一个字典序更大的排列。

给你一个整数数组 nums ，找出 nums 的下一个排列。

必须 原地 修改，只允许使用额外常数空间。

示例 1：

输入：nums = [1,2,3]
输出：[1,3,2]

示例 2：

输入：nums = [3,2,1]
输出：[1,2,3]

示例 3：

输入：nums = [1,1,5]
输出：[1,5,1]

提示：

	• 1

	• 0','[{"input":"nums = [1,2,3]","output":"[1,3,2]","explanation":""},{"input":"nums = [3,2,1]","output":"[1,2,3]","explanation":""},{"input":"nums = [1,1,5]","output":"[1,5,1]","explanation":""}]'::jsonb,'[1,2,3]
[3,2,1]
[1,1,5]',ARRAY['数组','双指针']::text[],'{"java":"class Solution {\n    public void nextPermutation(int[] nums) {\n        \n    }\n}"}'::jsonb,'{"java":"import java.io.*;\nimport java.util.*;\n\npublic class Main {\n    public static void main(String[] args) throws Exception {\n        Scanner scanner = new Scanner(System.in);\n        // 每个参数占一行；数组、矩阵等复合参数使用 JSON 外观。\n        // 可用 nextInt()/next() 读取空白分隔数据，或 nextLine() 读取整行。\n        // TODO: 解析输入并输出答案。\n        scanner.close();\n    }\n}\n"}'::jsonb),
('codetop',50,'76',1608,'最小覆盖子串','minimum-window-substring','困难',NULL,135,'2026-08-18T12:51:25.622000Z',TRUE,'https://leetcode.cn/problems/minimum-window-substring/','给定两个字符串 s 和 t，长度分别是 m 和 n，返回 s 中的 最短窗口 子串，使得该子串包含 t 中的每一个字符（包括重复字符）。如果没有这样的子串，返回空字符串 ""。

测试用例保证答案唯一。

示例 1：

输入：s = "ADOBECODEBANC", t = "ABC"
输出："BANC"
解释：最小覆盖子串 "BANC" 包含来自字符串 t 的 ''A''、''B'' 和 ''C''。

示例 2：

输入：s = "a", t = "a"
输出："a"
解释：整个字符串 s 是最小覆盖子串。

示例 3:

输入: s = "a", t = "aa"
输出: ""
解释: t 中两个字符 ''a'' 均应包含在 s 的子串中，
因此没有符合条件的子字符串，返回空字符串。

提示：

	• m == s.length

	• n == t.length

	• 1 5

	• s 和 t 由英文字母组成

进阶：你能设计一个在 O(m + n) 时间内解决此问题的算法吗？','[{"input":"s = \"ADOBECODEBANC\", t = \"ABC\"","output":"\"BANC\"","explanation":"最小覆盖子串 \"BANC\" 包含来自字符串 t 的 ''A''、''B'' 和 ''C''。"},{"input":"s = \"a\", t = \"a\"","output":"\"a\"","explanation":"整个字符串 s 是最小覆盖子串。"},{"input":"s = \"a\", t = \"aa\"","output":"\"\"","explanation":"t 中两个字符 ''a'' 均应包含在 s 的子串中，\n因此没有符合条件的子字符串，返回空字符串。"}]'::jsonb,'"ADOBECODEBANC"
"ABC"
"a"
"a"
"a"
"aa"',ARRAY['哈希表','字符串','滑动窗口']::text[],'{"java":"class Solution {\n    public String minWindow(String s, String t) {\n        \n    }\n}"}'::jsonb,'{"java":"import java.io.*;\nimport java.util.*;\n\npublic class Main {\n    public static void main(String[] args) throws Exception {\n        Scanner scanner = new Scanner(System.in);\n        // 每个参数占一行；数组、矩阵等复合参数使用 JSON 外观。\n        // 可用 nextInt()/next() 读取空白分隔数据，或 nextLine() 读取整行。\n        // TODO: 解析输入并输出答案。\n        scanner.close();\n    }\n}\n"}'::jsonb),
('codetop',51,'8',1676,'字符串转换整数 (atoi)','string-to-integer-atoi','中等',NULL,134,'2026-08-24T15:42:26.848000Z',FALSE,'https://leetcode.cn/problems/string-to-integer-atoi/','请你来实现一个 myAtoi(string s) 函数，使其能将字符串转换成一个 32 位有符号整数。

函数 myAtoi(string s) 的算法如下：

	• 空格：读入字符串并丢弃无用的前导空格（" "）

	• 符号：检查下一个字符（假设还未到字符末尾）为 ''-'' 还是 ''+''。如果两者都不存在，则假定结果为正。

	• 转换：通过跳过前置零来读取该整数，直到遇到非数字字符或到达字符串的结尾。如果没有读取数字，则结果为0。

	• 舍入：如果整数数超过 32 位有符号整数范围 [−231,  231 − 1] ，需要截断这个整数，使其保持在这个范围内。具体来说，小于 −231 的整数应该被舍入为 −231 ，大于 231 − 1 的整数应该被舍入为 231 − 1 。

返回整数作为最终结果。

示例 1：

输入：s = "42"

输出：42

解释：加粗的字符串为已经读入的字符，插入符号是当前读取的字符。

带下划线线的字符是所读的内容，插入符号是当前读入位置。
第 1 步："42"（当前没有读入字符，因为没有前导空格）
         ^
第 2 步："42"（当前没有读入字符，因为这里不存在 ''-'' 或者 ''+''）
         ^
第 3 步："42"（读入 "42"）
           ^

示例 2：

输入：s = " -042"

输出：-42

解释：

第 1 步："   -042"（读入前导空格，但忽视掉）
            ^
第 2 步："   -042"（读入 ''-'' 字符，所以结果应该是负数）
             ^
第 3 步："   -042"（读入 "042"，在结果中忽略前导零）
               ^

示例 3：

输入：s = "1337c0d3"

输出：1337

解释：

第 1 步："1337c0d3"（当前没有读入字符，因为没有前导空格）
         ^
第 2 步："1337c0d3"（当前没有读入字符，因为这里不存在 ''-'' 或者 ''+''）
         ^
第 3 步："1337c0d3"（读入 "1337"；由于下一个字符不是一个数字，所以读入停止）
             ^

示例 4：

输入：s = "0-1"

输出：0

解释：

第 1 步："0-1" (当前没有读入字符，因为没有前导空格)
         ^
第 2 步："0-1" (当前没有读入字符，因为这里不存在 ''-'' 或者 ''+'')
         ^
第 3 步："0-1" (读入 "0"；由于下一个字符不是一个数字，所以读入停止)
          ^

示例 5：

输入：s = "words and 987"

输出：0

解释：

读取在第一个非数字字符“w”处停止。

提示：

	• 0

	• s 由英文字母（大写和小写）、数字（0-9）、'' ''、''+''、''-'' 和 ''.'' 组成','[{"input":"s = \"42\"","output":"42","explanation":"加粗的字符串为已经读入的字符，插入符号是当前读取的字符。\n\n带下划线线的字符是所读的内容，插入符号是当前读入位置。\n第 1 步：\"42\"（当前没有读入字符，因为没有前导空格）\n         ^\n第 2 步：\"42\"（当前没有读入字符，因为这里不存在 ''-'' 或者 ''+''）\n         ^\n第 3 步：\"42\"（读入 \"42\"）\n           ^"},{"input":"s = \" -042\"","output":"-42","explanation":"第 1 步：\"   -042\"（读入前导空格，但忽视掉）\n            ^\n第 2 步：\"   -042\"（读入 ''-'' 字符，所以结果应该是负数）\n             ^\n第 3 步：\"   -042\"（读入 \"042\"，在结果中忽略前导零）\n               ^"},{"input":"s = \"1337c0d3\"","output":"1337","explanation":"第 1 步：\"1337c0d3\"（当前没有读入字符，因为没有前导空格）\n         ^\n第 2 步：\"1337c0d3\"（当前没有读入字符，因为这里不存在 ''-'' 或者 ''+''）\n         ^\n第 3 步：\"1337c0d3\"（读入 \"1337\"；由于下一个字符不是一个数字，所以读入停止）\n             ^"},{"input":"s = \"0-1\"","output":"0","explanation":"第 1 步：\"0-1\" (当前没有读入字符，因为没有前导空格)\n         ^\n第 2 步：\"0-1\" (当前没有读入字符，因为这里不存在 ''-'' 或者 ''+'')\n         ^\n第 3 步：\"0-1\" (读入 \"0\"；由于下一个字符不是一个数字，所以读入停止)\n          ^"}]'::jsonb,'"42"
"   -042"
"1337c0d3"
"0-1"
"words and 987"',ARRAY['字符串']::text[],'{"java":"class Solution {\n    public int myAtoi(String s) {\n        \n    }\n}"}'::jsonb,'{"java":"import java.io.*;\nimport java.util.*;\n\npublic class Main {\n    public static void main(String[] args) throws Exception {\n        Scanner scanner = new Scanner(System.in);\n        // 每个参数占一行；数组、矩阵等复合参数使用 JSON 外观。\n        // 可用 nextInt()/next() 读取空白分隔数据，或 nextLine() 读取整行。\n        // TODO: 解析输入并输出答案。\n        scanner.close();\n    }\n}\n"}'::jsonb),
('codetop',52,'2',1682,'两数相加','add-two-numbers','中等',NULL,133,'2026-04-16T07:17:15.104000Z',TRUE,'https://leetcode.cn/problems/add-two-numbers/','给你两个 非空 的链表，表示两个非负的整数。它们每位数字都是按照 逆序 的方式存储的，并且每个节点只能存储 一位 数字。

请你将两个数相加，并以相同形式返回一个表示和的链表。

你可以假设除了数字 0 之外，这两个数都不会以 0 开头。

示例 1：

输入：l1 = [2,4,3], l2 = [5,6,4]
输出：[7,0,8]
解释：342 + 465 = 807.

示例 2：

输入：l1 = [0], l2 = [0]
输出：[0]

示例 3：

输入：l1 = [9,9,9,9,9,9,9], l2 = [9,9,9,9]
输出：[8,9,9,9,0,0,0,1]

提示：

	• 每个链表中的节点数在范围 [1, 100] 内

	• 0

	• 题目数据保证列表表示的数字不含前导零','[{"input":"l1 = [2,4,3], l2 = [5,6,4]","output":"[7,0,8]","explanation":"342 + 465 = 807."},{"input":"l1 = [0], l2 = [0]","output":"[0]","explanation":""},{"input":"l1 = [9,9,9,9,9,9,9], l2 = [9,9,9,9]","output":"[8,9,9,9,0,0,0,1]","explanation":""}]'::jsonb,'[2,4,3]
[5,6,4]
[0]
[0]
[9,9,9,9,9,9,9]
[9,9,9,9]',ARRAY['递归','链表','数学']::text[],'{"java":"/**\n * Definition for singly-linked list.\n * public class ListNode {\n *     int val;\n *     ListNode next;\n *     ListNode() {}\n *     ListNode(int val) { this.val = val; }\n *     ListNode(int val, ListNode next) { this.val = val; this.next = next; }\n * }\n */\nclass Solution {\n    public ListNode addTwoNumbers(ListNode l1, ListNode l2) {\n        \n    }\n}"}'::jsonb,'{"java":"import java.io.*;\nimport java.util.*;\n\npublic class Main {\n    public static void main(String[] args) throws Exception {\n        Scanner scanner = new Scanner(System.in);\n        // 每个参数占一行；数组、矩阵等复合参数使用 JSON 外观。\n        // 可用 nextInt()/next() 读取空白分隔数据，或 nextLine() 读取整行。\n        // TODO: 解析输入并输出答案。\n        scanner.close();\n    }\n}\n"}'::jsonb),
('codetop',53,'322',1362,'零钱兑换','coin-change','中等',NULL,132,'2026-04-15T11:47:59.283000Z',TRUE,'https://leetcode.cn/problems/coin-change/','给你一个整数数组 coins ，表示不同面额的硬币；以及一个整数 amount ，表示总金额。

计算并返回可以凑成总金额所需的 最少的硬币个数 。如果没有任何一种硬币组合能组成总金额，返回 -1 。

你可以认为每种硬币的数量是无限的。

示例 1：

输入：coins = [1, 2, 5], amount = 11
输出：3
解释：11 = 5 + 5 + 1

示例 2：

输入：coins = [2], amount = 3
输出：-1

示例 3：

输入：coins = [1], amount = 0
输出：0

提示：

	• 1

	• 1 31 - 1

	• 0 4','[{"input":"coins = [1, 2, 5], amount = 11","output":"3","explanation":"11 = 5 + 5 + 1"},{"input":"coins = [2], amount = 3","output":"-1","explanation":""},{"input":"coins = [1], amount = 0","output":"0","explanation":""}]'::jsonb,'[1,2,5]
11
[2]
3
[1]
0',ARRAY['广度优先搜索','数组','动态规划','knapsack-problem','complete-knapsack']::text[],'{"java":"class Solution {\n    public int coinChange(int[] coins, int amount) {\n        \n    }\n}"}'::jsonb,'{"java":"import java.io.*;\nimport java.util.*;\n\npublic class Main {\n    public static void main(String[] args) throws Exception {\n        Scanner scanner = new Scanner(System.in);\n        // 每个参数占一行；数组、矩阵等复合参数使用 JSON 外观。\n        // 可用 nextInt()/next() 读取空白分隔数据，或 nextLine() 读取整行。\n        // TODO: 解析输入并输出答案。\n        scanner.close();\n    }\n}\n"}'::jsonb),
('codetop',54,'43',1641,'字符串相乘','multiply-strings','中等',NULL,131,'2026-05-22T11:30:17.205000Z',FALSE,'https://leetcode.cn/problems/multiply-strings/','给定两个以字符串形式表示的非负整数 num1 和 num2，返回 num1 和 num2 的乘积，它们的乘积也表示为字符串形式。

注意：不能使用任何内置的 BigInteger 库或直接将输入转换为整数。

示例 1:

输入: num1 = "2", num2 = "3"
输出: "6"

示例 2:

输入: num1 = "123", num2 = "456"
输出: "56088"

提示：

	• 1

	• num1 和 num2 只能由数字组成。

	• num1 和 num2 都不包含任何前导零，除了数字0本身。','[{"input":"num1 = \"2\", num2 = \"3\"","output":"\"6\"","explanation":""},{"input":"num1 = \"123\", num2 = \"456\"","output":"\"56088\"","explanation":""}]'::jsonb,'"2"
"3"
"123"
"456"',ARRAY['数学','字符串','模拟']::text[],'{"java":"class Solution {\n    public String multiply(String num1, String num2) {\n        \n    }\n}"}'::jsonb,'{"java":"import java.io.*;\nimport java.util.*;\n\npublic class Main {\n    public static void main(String[] args) throws Exception {\n        Scanner scanner = new Scanner(System.in);\n        // 每个参数占一行；数组、矩阵等复合参数使用 JSON 外观。\n        // 可用 nextInt()/next() 读取空白分隔数据，或 nextLine() 读取整行。\n        // TODO: 解析输入并输出答案。\n        scanner.close();\n    }\n}\n"}'::jsonb),
('codetop',55,'70',1614,'爬楼梯','climbing-stairs','简单',NULL,130,'2026-06-22T13:15:46.096000Z',TRUE,'https://leetcode.cn/problems/climbing-stairs/','假设你正在爬楼梯。需要 n 阶你才能到达楼顶。

每次你可以爬 1 或 2 个台阶。你有多少种不同的方法可以爬到楼顶呢？

示例 1：

输入：n = 2
输出：2
解释：有两种方法可以爬到楼顶。
1. 1 阶 + 1 阶
2. 2 阶

示例 2：

输入：n = 3
输出：3
解释：有三种方法可以爬到楼顶。
1. 1 阶 + 1 阶 + 1 阶
2. 1 阶 + 2 阶
3. 2 阶 + 1 阶

提示：

	• 1','[{"input":"n = 2","output":"2","explanation":"有两种方法可以爬到楼顶。\n1. 1 阶 + 1 阶\n2. 2 阶"},{"input":"n = 3","output":"3","explanation":"有三种方法可以爬到楼顶。\n1. 1 阶 + 1 阶 + 1 阶\n2. 1 阶 + 2 阶\n3. 2 阶 + 1 阶"}]'::jsonb,'2
3',ARRAY['记忆化','数学','动态规划']::text[],'{"java":"class Solution {\n    public int climbStairs(int n) {\n        \n    }\n}"}'::jsonb,'{"java":"import java.io.*;\nimport java.util.*;\n\npublic class Main {\n    public static void main(String[] args) throws Exception {\n        Scanner scanner = new Scanner(System.in);\n        // 每个参数占一行；数组、矩阵等复合参数使用 JSON 外观。\n        // 可用 nextInt()/next() 读取空白分隔数据，或 nextLine() 读取整行。\n        // TODO: 解析输入并输出答案。\n        scanner.close();\n    }\n}\n"}'::jsonb),
('codetop',56,'105',1579,'从前序与中序遍历序列构造二叉树','construct-binary-tree-from-preorder-and-inorder-traversal','中等',NULL,117,'2026-06-29T08:28:32.292000Z',TRUE,'https://leetcode.cn/problems/construct-binary-tree-from-preorder-and-inorder-traversal/','给定两个整数数组 preorder 和 inorder ，其中 preorder 是二叉树的先序遍历， inorder 是同一棵树的中序遍历，请构造二叉树并返回其根节点。

示例 1:

输入: preorder = [3,9,20,15,7], inorder = [9,3,15,20,7]
输出: [3,9,20,null,null,15,7]

示例 2:

输入: preorder = [-1], inorder = [-1]
输出: [-1]

提示:

	• 1

	• inorder.length == preorder.length

	• -3000

	• preorder 和 inorder 均 无重复 元素

	• inorder 均出现在 preorder

	• preorder 保证 为二叉树的前序遍历序列

	• inorder 保证 为二叉树的中序遍历序列','[{"input":"preorder = [3,9,20,15,7], inorder = [9,3,15,20,7]","output":"[3,9,20,null,null,15,7]","explanation":""},{"input":"preorder = [-1], inorder = [-1]","output":"[-1]","explanation":""}]'::jsonb,'[3,9,20,15,7]
[9,3,15,20,7]
[-1]
[-1]',ARRAY['树','数组','哈希表','分治','二叉树']::text[],'{"java":"/**\n * Definition for a binary tree node.\n * public class TreeNode {\n *     int val;\n *     TreeNode left;\n *     TreeNode right;\n *     TreeNode() {}\n *     TreeNode(int val) { this.val = val; }\n *     TreeNode(int val, TreeNode left, TreeNode right) {\n *         this.val = val;\n *         this.left = left;\n *         this.right = right;\n *     }\n * }\n */\nclass Solution {\n    public TreeNode buildTree(int[] preorder, int[] inorder) {\n        \n    }\n}"}'::jsonb,'{"java":"import java.io.*;\nimport java.util.*;\n\npublic class Main {\n    public static void main(String[] args) throws Exception {\n        Scanner scanner = new Scanner(System.in);\n        // 每个参数占一行；数组、矩阵等复合参数使用 JSON 外观。\n        // 可用 nextInt()/next() 读取空白分隔数据，或 nextLine() 读取整行。\n        // TODO: 解析输入并输出答案。\n        scanner.close();\n    }\n}\n"}'::jsonb),
('codetop',57,'41',1643,'缺失的第一个正数','first-missing-positive','困难',NULL,114,'2026-06-16T15:08:48.975000Z',TRUE,'https://leetcode.cn/problems/first-missing-positive/','给你一个未排序的整数数组 nums ，请你找出其中没有出现的最小的正整数。

请你实现时间复杂度为 O(n) 并且只使用常数级别额外空间的解决方案。

示例 1：

输入：nums = [1,2,0]
输出：3
解释：范围 [1,2] 中的数字都在数组中。

示例 2：

输入：nums = [3,4,-1,1]
输出：2
解释：1 在数组中，但 2 没有。

示例 3：

输入：nums = [7,8,9,11,12]
输出：1
解释：最小的正数 1 没有出现。

提示：

	• 1 5

	• -231 31 - 1','[{"input":"nums = [1,2,0]","output":"3","explanation":"范围 [1,2] 中的数字都在数组中。"},{"input":"nums = [3,4,-1,1]","output":"2","explanation":"1 在数组中，但 2 没有。"},{"input":"nums = [7,8,9,11,12]","output":"1","explanation":"最小的正数 1 没有出现。"}]'::jsonb,'[1,2,0]
[3,4,-1,1]
[7,8,9,11,12]',ARRAY['数组','哈希表']::text[],'{"java":"class Solution {\n    public int firstMissingPositive(int[] nums) {\n        \n    }\n}"}'::jsonb,'{"java":"import java.io.*;\nimport java.util.*;\n\npublic class Main {\n    public static void main(String[] args) throws Exception {\n        Scanner scanner = new Scanner(System.in);\n        // 每个参数占一行；数组、矩阵等复合参数使用 JSON 外观。\n        // 可用 nextInt()/next() 读取空白分隔数据，或 nextLine() 读取整行。\n        // TODO: 解析输入并输出答案。\n        scanner.close();\n    }\n}\n"}'::jsonb),
('codetop',58,'78',1606,'子集','subsets','中等',NULL,107,'2026-08-09T16:00:00Z',TRUE,'https://leetcode.cn/problems/subsets/','给你一个整数数组 nums ，数组中的元素 互不相同 。返回该数组所有可能的子集（幂集）。

解集 不能 包含重复的子集。你可以按 任意顺序 返回解集。

示例 1：

输入：nums = [1,2,3]
输出：[[],[1],[2],[1,2],[3],[1,3],[2,3],[1,2,3]]

示例 2：

输入：nums = [0]
输出：[[],[0]]

提示：

	• 1

	• -10

	• nums 中的所有元素 互不相同','[{"input":"nums = [1,2,3]","output":"[[],[1],[2],[1,2],[3],[1,3],[2,3],[1,2,3]]","explanation":""},{"input":"nums = [0]","output":"[[],[0]]","explanation":""}]'::jsonb,'[1,2,3]
[0]',ARRAY['位运算','数组','回溯']::text[],'{"java":"class Solution {\n    public List<List<Integer>> subsets(int[] nums) {\n        \n    }\n}"}'::jsonb,'{"java":"import java.io.*;\nimport java.util.*;\n\npublic class Main {\n    public static void main(String[] args) throws Exception {\n        Scanner scanner = new Scanner(System.in);\n        // 每个参数占一行；数组、矩阵等复合参数使用 JSON 外观。\n        // 可用 nextInt()/next() 读取空白分隔数据，或 nextLine() 读取整行。\n        // TODO: 解析输入并输出答案。\n        scanner.close();\n    }\n}\n"}'::jsonb),
('codetop',59,'151',1533,'翻转字符串里的单词','reverse-words-in-a-string','中等',NULL,106,'2026-07-21T16:00:00Z',FALSE,'https://leetcode.cn/problems/reverse-words-in-a-string/','给你一个字符串 s ，请你反转字符串中 单词 的顺序。

单词 是由非空格字符组成的字符串。s 中使用至少一个空格将字符串中的 单词 分隔开。

返回 单词 顺序颠倒且 单词 之间用单个空格连接的结果字符串。

注意：输入字符串 s中可能会存在前导空格、尾随空格或者单词间的多个空格。返回的结果字符串中，单词间应当仅用单个空格分隔，且不包含任何额外的空格。

示例 1：

输入：s = "the sky is blue"
输出："blue is sky the"

示例 2：

输入：s = "  hello world  "
输出："world hello"
解释：反转后的字符串中不能存在前导空格和尾随空格。

示例 3：

输入：s = "a good   example"
输出："example good a"
解释：如果两个单词间有多余的空格，反转后的字符串需要将单词间的空格减少到仅有一个。

提示：

	• 1 4

	• s 包含英文大小写字母、数字和空格 '' ''

	• s 中 至少存在一个 单词

进阶：如果字符串在你使用的编程语言中是一种可变数据类型，请尝试使用 O(1) 额外空间复杂度的 原地 解法。','[{"input":"s = \"the sky is blue\"","output":"\"blue is sky the\"","explanation":""},{"input":"s = \"  hello world  \"","output":"\"world hello\"","explanation":"反转后的字符串中不能存在前导空格和尾随空格。"},{"input":"s = \"a good   example\"","output":"\"example good a\"","explanation":"如果两个单词间有多余的空格，反转后的字符串需要将单词间的空格减少到仅有一个。"}]'::jsonb,'"the sky is blue"
"  hello world  "
"a good   example"',ARRAY['双指针','字符串']::text[],'{"java":"class Solution {\n    public String reverseWords(String s) {\n        \n    }\n}"}'::jsonb,'{"java":"import java.io.*;\nimport java.util.*;\n\npublic class Main {\n    public static void main(String[] args) throws Exception {\n        Scanner scanner = new Scanner(System.in);\n        // 每个参数占一行；数组、矩阵等复合参数使用 JSON 外观。\n        // 可用 nextInt()/next() 读取空白分隔数据，或 nextLine() 读取整行。\n        // TODO: 解析输入并输出答案。\n        scanner.close();\n    }\n}\n"}'::jsonb),
('codetop',60,'剑指 Offer 22',122,'链表中倒数第k个节点','lian-biao-zhong-dao-shu-di-kge-jie-dian-lcof','简单',NULL,103,'2026-08-04T09:59:00.246000Z',FALSE,'https://leetcode.cn/problems/lian-biao-zhong-dao-shu-di-kge-jie-dian-lcof/','给定一个头节点为 head 的链表用于记录一系列核心肌群训练项目编号，请查找并返回倒数第 cnt 个训练项目编号对应的节点。

示例 1：

输入：head = [2,4,7,8], cnt = 1
输出：8

提示：

	• 1

	• 0

	• 1','[{"input":"head = [2,4,7,8], cnt = 1","output":"8","explanation":""}]'::jsonb,'[2,4,7,8]
1',ARRAY['链表','双指针']::text[],'{"java":"/**\n * Definition for singly-linked list.\n * public class ListNode {\n *     int val;\n *     ListNode next;\n *     ListNode() {}\n *     ListNode(int val) { this.val = val; }\n *     ListNode(int val, ListNode next) { this.val = val; this.next = next; }\n * }\n */\nclass Solution {\n    public ListNode trainingPlan(ListNode head, int cnt) {\n        \n    }\n}"}'::jsonb,'{"java":"import java.io.*;\nimport java.util.*;\n\npublic class Main {\n    public static void main(String[] args) throws Exception {\n        Scanner scanner = new Scanner(System.in);\n        // 每个参数占一行；数组、矩阵等复合参数使用 JSON 外观。\n        // 可用 nextInt()/next() 读取空白分隔数据，或 nextLine() 读取整行。\n        // TODO: 解析输入并输出答案。\n        scanner.close();\n    }\n}\n"}'::jsonb),
('codetop',61,'34',1650,'在排序数组中查找元素的第一个和最后一个位置','find-first-and-last-position-of-element-in-sorted-array','中等',NULL,103,'2026-07-23T01:07:27.021000Z',TRUE,'https://leetcode.cn/problems/find-first-and-last-position-of-element-in-sorted-array/','给你一个按照非递减顺序排列的整数数组 nums，和一个目标值 target。请你找出给定目标值在数组中的开始位置和结束位置。

如果数组中不存在目标值 target，返回 [-1, -1]。

你必须设计并实现时间复杂度为 O(log n) 的算法解决此问题。

示例 1：

输入：nums = [5,7,7,8,8,10], target = 8
输出：[3,4]

示例 2：

输入：nums = [5,7,7,8,8,10], target = 6
输出：[-1,-1]

示例 3：

输入：nums = [], target = 0
输出：[-1,-1]

提示：

	• 0 5

	• -109 9

	• nums 是一个非递减数组

	• -109 9','[{"input":"nums = [5,7,7,8,8,10], target = 8","output":"[3,4]","explanation":""},{"input":"nums = [5,7,7,8,8,10], target = 6","output":"[-1,-1]","explanation":""},{"input":"nums = [], target = 0","output":"[-1,-1]","explanation":""}]'::jsonb,'[5,7,7,8,8,10]
8
[5,7,7,8,8,10]
6
[]
0',ARRAY['数组','二分查找']::text[],'{"java":"class Solution {\n    public int[] searchRange(int[] nums, int target) {\n        \n    }\n}"}'::jsonb,'{"java":"import java.io.*;\nimport java.util.*;\n\npublic class Main {\n    public static void main(String[] args) throws Exception {\n        Scanner scanner = new Scanner(System.in);\n        // 每个参数占一行；数组、矩阵等复合参数使用 JSON 外观。\n        // 可用 nextInt()/next() 读取空白分隔数据，或 nextLine() 读取整行。\n        // TODO: 解析输入并输出答案。\n        scanner.close();\n    }\n}\n"}'::jsonb),
('codetop',62,'394',1290,'字符串解码','decode-string','中等',NULL,101,'2026-08-20T14:46:14.430000Z',TRUE,'https://leetcode.cn/problems/decode-string/','给定一个经过编码的字符串，返回它解码后的字符串。

编码规则为: k[encoded_string]，表示其中方括号内部的 encoded_string 正好重复 k 次。注意 k 保证为正整数。

你可以认为输入字符串总是有效的；输入字符串中没有额外的空格，且输入的方括号总是符合格式要求的。

此外，你可以认为原始数据不包含数字，所有的数字只表示重复的次数 k ，例如不会出现像 3a 或 2[4] 的输入。

测试用例保证输出的长度不会超过 105。

示例 1：

输入：s = "3[a]2[bc]"
输出："aaabcbc"

示例 2：

输入：s = "3[a2[c]]"
输出："accaccacc"

示例 3：

输入：s = "2[abc]3[cd]ef"
输出："abcabccdcdcdef"

示例 4：

输入：s = "abc3[cd]xyz"
输出："abccdcdcdxyz"

提示：

	• 1

	• s 由小写英文字母、数字和方括号 ''[]'' 组成

	• s 保证是一个 有效 的输入。

	• s 中所有整数的取值范围为 [1, 300]','[{"input":"s = \"3[a]2[bc]\"","output":"\"aaabcbc\"","explanation":""},{"input":"s = \"3[a2[c]]\"","output":"\"accaccacc\"","explanation":""},{"input":"s = \"2[abc]3[cd]ef\"","output":"\"abcabccdcdcdef\"","explanation":""},{"input":"s = \"abc3[cd]xyz\"","output":"\"abccdcdcdxyz\"","explanation":""}]'::jsonb,'"3[a]2[bc]"
"3[a2[c]]"
"2[abc]3[cd]ef"',ARRAY['栈','递归','字符串']::text[],'{"java":"class Solution {\n    public String decodeString(String s) {\n        \n    }\n}"}'::jsonb,'{"java":"import java.io.*;\nimport java.util.*;\n\npublic class Main {\n    public static void main(String[] args) throws Exception {\n        Scanner scanner = new Scanner(System.in);\n        // 每个参数占一行；数组、矩阵等复合参数使用 JSON 外观。\n        // 可用 nextInt()/next() 读取空白分隔数据，或 nextLine() 读取整行。\n        // TODO: 解析输入并输出答案。\n        scanner.close();\n    }\n}\n"}'::jsonb),
('codetop',63,'129',1555,'求根到叶子节点数字之和','sum-root-to-leaf-numbers','中等',NULL,100,'2026-04-21T16:00:00Z',FALSE,'https://leetcode.cn/problems/sum-root-to-leaf-numbers/','给你一个二叉树的根节点 root ，树中每个节点都存放有一个 0 到 9 之间的数字。

每条从根节点到叶节点的路径都代表一个数字：

	• 例如，从根节点到叶节点的路径 1 -> 2 -> 3 表示数字 123 。

计算从根节点到叶节点生成的 所有数字之和 。

叶节点 是指没有子节点的节点。

 

示例 1：

输入：root = [1,2,3]
输出：25
解释：
从根到叶子节点路径 1->2 代表数字 12
从根到叶子节点路径 1->3 代表数字 13
因此，数字总和 = 12 + 13 = 25

示例 2：

输入：root = [4,9,0,5,1]
输出：1026
解释：
从根到叶子节点路径 4->9->5 代表数字 495
从根到叶子节点路径 4->9->1 代表数字 491
从根到叶子节点路径 4->0 代表数字 40
因此，数字总和 = 495 + 491 + 40 = 1026

 

提示：

	• 树中节点的数目在范围 [1, 1000] 内

	• 0

	• 树的深度不超过 10','[{"input":"root = [1,2,3]","output":"25","explanation":"从根到叶子节点路径 1->2 代表数字 12\n从根到叶子节点路径 1->3 代表数字 13\n因此，数字总和 = 12 + 13 = 25"},{"input":"root = [4,9,0,5,1]","output":"1026","explanation":"从根到叶子节点路径 4->9->5 代表数字 495\n从根到叶子节点路径 4->9->1 代表数字 491\n从根到叶子节点路径 4->0 代表数字 40\n因此，数字总和 = 495 + 491 + 40 = 1026"}]'::jsonb,'[1,2,3]
[4,9,0,5,1]',ARRAY['树','深度优先搜索','二叉树']::text[],'{"java":"/**\n * Definition for a binary tree node.\n * public class TreeNode {\n *     int val;\n *     TreeNode left;\n *     TreeNode right;\n *     TreeNode() {}\n *     TreeNode(int val) { this.val = val; }\n *     TreeNode(int val, TreeNode left, TreeNode right) {\n *         this.val = val;\n *         this.left = left;\n *         this.right = right;\n *     }\n * }\n */\nclass Solution {\n    public int sumNumbers(TreeNode root) {\n        \n    }\n}"}'::jsonb,'{"java":"import java.io.*;\nimport java.util.*;\n\npublic class Main {\n    public static void main(String[] args) throws Exception {\n        Scanner scanner = new Scanner(System.in);\n        // 每个参数占一行；数组、矩阵等复合参数使用 JSON 外观。\n        // 可用 nextInt()/next() 读取空白分隔数据，或 nextLine() 读取整行。\n        // TODO: 解析输入并输出答案。\n        scanner.close();\n    }\n}\n"}'::jsonb),
('codetop',64,'155',1529,'最小栈','min-stack','简单',NULL,99,'2026-04-13T18:21:52.312000Z',TRUE,'https://leetcode.cn/problems/min-stack/','设计一个支持 push ，pop ，top 操作，并能在常数时间内检索到最小元素的栈。

实现 MinStack 类:

	• MinStack() 初始化堆栈对象。

	• void push(int value) 将元素 value 推入堆栈。

	• void pop() 删除堆栈顶部的元素。

	• int top() 获取堆栈顶部的元素。

	• int getMin() 获取堆栈中的最小元素。

示例 1:

输入：
["MinStack","push","push","push","getMin","pop","top","getMin"]
[[],[-2],[0],[-3],[],[],[],[]]

输出：
[null,null,null,null,-3,null,0,-2]

解释：
MinStack minStack = new MinStack();
minStack.push(-2);
minStack.push(0);
minStack.push(-3);
minStack.getMin();   --> 返回 -3.
minStack.pop();
minStack.top();      --> 返回 0.
minStack.getMin();   --> 返回 -2.

提示：

	• -231 31 - 1

	• pop、top 和 getMin 操作总是在 非空栈 上调用

	• push, pop, top, and getMin最多被调用 3 * 104 次','[{"input":"[\"MinStack\",\"push\",\"push\",\"push\",\"getMin\",\"pop\",\"top\",\"getMin\"]\n[[],[-2],[0],[-3],[],[],[],[]]","output":"[null,null,null,null,-3,null,0,-2]","explanation":"MinStack minStack = new MinStack();\nminStack.push(-2);\nminStack.push(0);\nminStack.push(-3);\nminStack.getMin();   --> 返回 -3.\nminStack.pop();\nminStack.top();      --> 返回 0.\nminStack.getMin();   --> 返回 -2."}]'::jsonb,'["MinStack","push","push","push","getMin","pop","top","getMin"]
[[],[-2],[0],[-3],[],[],[],[]]',ARRAY['栈','设计']::text[],'{"java":"class MinStack {\n\n    public MinStack() {\n        \n    }\n    \n    public void push(int value) {\n        \n    }\n    \n    public void pop() {\n        \n    }\n    \n    public int top() {\n        \n    }\n    \n    public int getMin() {\n        \n    }\n}\n\n/**\n * Your MinStack object will be instantiated and called as such:\n * MinStack obj = new MinStack();\n * obj.push(value);\n * obj.pop();\n * int param_3 = obj.top();\n * int param_4 = obj.getMin();\n */"}'::jsonb,'{"java":"import java.io.*;\nimport java.util.*;\n\npublic class Main {\n    public static void main(String[] args) throws Exception {\n        Scanner scanner = new Scanner(System.in);\n        // 每个参数占一行；数组、矩阵等复合参数使用 JSON 外观。\n        // 可用 nextInt()/next() 读取空白分隔数据，或 nextLine() 读取整行。\n        // TODO: 解析输入并输出答案。\n        scanner.close();\n    }\n}\n"}'::jsonb),
('codetop',65,'101',1583,'对称二叉树','symmetric-tree','简单',NULL,97,'2026-07-12T16:00:00Z',TRUE,'https://leetcode.cn/problems/symmetric-tree/','给你一个二叉树的根节点 root ， 检查它是否轴对称。

示例 1：

输入：root = [1,2,2,3,4,4,3]
输出：true

示例 2：

输入：root = [1,2,2,null,3,null,3]
输出：false

提示：

	• 树中节点数目在范围 [1, 1000] 内

	• -100

进阶：你可以运用递归和迭代两种方法解决这个问题吗？','[{"input":"root = [1,2,2,3,4,4,3]","output":"true","explanation":""},{"input":"root = [1,2,2,null,3,null,3]","output":"false","explanation":""}]'::jsonb,'[1,2,2,3,4,4,3]
[1,2,2,null,3,null,3]',ARRAY['树','深度优先搜索','广度优先搜索','二叉树']::text[],'{"java":"/**\n * Definition for a binary tree node.\n * public class TreeNode {\n *     int val;\n *     TreeNode left;\n *     TreeNode right;\n *     TreeNode() {}\n *     TreeNode(int val) { this.val = val; }\n *     TreeNode(int val, TreeNode left, TreeNode right) {\n *         this.val = val;\n *         this.left = left;\n *         this.right = right;\n *     }\n * }\n */\nclass Solution {\n    public boolean isSymmetric(TreeNode root) {\n        \n    }\n}"}'::jsonb,'{"java":"import java.io.*;\nimport java.util.*;\n\npublic class Main {\n    public static void main(String[] args) throws Exception {\n        Scanner scanner = new Scanner(System.in);\n        // 每个参数占一行；数组、矩阵等复合参数使用 JSON 外观。\n        // 可用 nextInt()/next() 读取空白分隔数据，或 nextLine() 读取整行。\n        // TODO: 解析输入并输出答案。\n        scanner.close();\n    }\n}\n"}'::jsonb),
('codetop',66,'64',1620,'最小路径和','minimum-path-sum','中等',NULL,96,'2026-08-16T16:00:00Z',TRUE,'https://leetcode.cn/problems/minimum-path-sum/','给定一个包含非负整数的 m x n 网格 grid ，请找出一条从左上角到右下角的路径，使得路径上的数字总和为最小。

说明：每次只能向下或者向右移动一步。

示例 1：

输入：grid = [[1,3,1],[1,5,1],[4,2,1]]
输出：7
解释：因为路径 1→3→1→1→1 的总和最小。

示例 2：

输入：grid = [[1,2,3],[4,5,6]]
输出：12

提示：

	• m == grid.length

	• n == grid[i].length

	• 1

	• 0','[{"input":"grid = [[1,3,1],[1,5,1],[4,2,1]]","output":"7","explanation":"因为路径 1→3→1→1→1 的总和最小。"},{"input":"grid = [[1,2,3],[4,5,6]]","output":"12","explanation":""}]'::jsonb,'[[1,3,1],[1,5,1],[4,2,1]]
[[1,2,3],[4,5,6]]',ARRAY['数组','动态规划','矩阵']::text[],'{"java":"class Solution {\n    public int minPathSum(int[][] grid) {\n        \n    }\n}"}'::jsonb,'{"java":"import java.io.*;\nimport java.util.*;\n\npublic class Main {\n    public static void main(String[] args) throws Exception {\n        Scanner scanner = new Scanner(System.in);\n        // 每个参数占一行；数组、矩阵等复合参数使用 JSON 外观。\n        // 可用 nextInt()/next() 读取空白分隔数据，或 nextLine() 读取整行。\n        // TODO: 解析输入并输出答案。\n        scanner.close();\n    }\n}\n"}'::jsonb),
('codetop',67,'470',821,'用 Rand7() 实现 Rand10()','implement-rand10-using-rand7','中等',NULL,96,'2026-07-21T14:15:33.233000Z',FALSE,'https://leetcode.cn/problems/implement-rand10-using-rand7/','给定方法 rand7 可生成 [1,7] 范围内的均匀随机整数，试写一个方法 rand10 生成 [1,10] 范围内的均匀随机整数。

你只能调用 rand7() 且不能调用其他方法。请不要使用系统的 Math.random() 方法。

每个测试用例将有一个内部参数 n，即你实现的函数 rand10() 在测试时将被调用的次数。请注意，这不是传递给 rand10() 的参数。

示例 1:

输入: 1
输出: [2]

示例 2:

输入: 2
输出: [2,8]

示例 3:

输入: 3
输出: [3,8,10]

提示:

	• 1 5

进阶:

	• rand7()调用次数的 期望值 是多少 ?

	• 你能否尽量少调用 rand7() ?','[{"input":"1","output":"[2]","explanation":""},{"input":"2","output":"[2,8]","explanation":""},{"input":"3","output":"[3,8,10]","explanation":""}]'::jsonb,'1
2
3',ARRAY['数学','拒绝采样','概率与统计','随机化']::text[],'{"java":"/**\n * The rand7() API is already defined in the parent class SolBase.\n * public int rand7();\n * @return a random integer in the range 1 to 7\n */\nclass Solution extends SolBase {\n    public int rand10() {\n        \n    }\n}"}'::jsonb,'{"java":"import java.io.*;\nimport java.util.*;\n\npublic class Main {\n    public static void main(String[] args) throws Exception {\n        Scanner scanner = new Scanner(System.in);\n        // 每个参数占一行；数组、矩阵等复合参数使用 JSON 外观。\n        // 可用 nextInt()/next() 读取空白分隔数据，或 nextLine() 读取整行。\n        // TODO: 解析输入并输出答案。\n        scanner.close();\n    }\n}\n"}'::jsonb),
('codetop',68,'39',1645,'组合总和','combination-sum','中等',NULL,96,'2026-05-26T16:00:00Z',TRUE,'https://leetcode.cn/problems/combination-sum/','给你一个 无重复元素 的整数数组 candidates 和一个目标整数 target ，找出 candidates 中可以使数字和为目标数 target 的 所有 不同组合 ，并以列表形式返回。你可以按 任意顺序 返回这些组合。

candidates 中的 同一个 数字可以 无限制重复被选取 。如果至少一个数字的被选数量不同，则两种组合是不同的。

对于给定的输入，保证和为 target 的不同组合数少于 150 个。

示例 1：

输入：candidates = [2,3,6,7], target = 7
输出：[[2,2,3],[7]]
解释：
2 和 3 可以形成一组候选，2 + 2 + 3 = 7 。注意 2 可以使用多次。
7 也是一个候选， 7 = 7 。
仅有这两种组合。

示例 2：

输入: candidates = [2,3,5], target = 8
输出: [[2,2,2,2],[2,3,3],[3,5]]

示例 3：

输入: candidates = [2], target = 1
输出: []

提示：

	• 1

	• 2

	• candidates 的所有元素 互不相同

	• 1','[{"input":"candidates = [2,3,6,7], target = 7","output":"[[2,2,3],[7]]","explanation":"2 和 3 可以形成一组候选，2 + 2 + 3 = 7 。注意 2 可以使用多次。\n7 也是一个候选， 7 = 7 。\n仅有这两种组合。"},{"input":"candidates = [2,3,5], target = 8","output":"[[2,2,2,2],[2,3,3],[3,5]]","explanation":""},{"input":"candidates = [2], target = 1","output":"[]","explanation":""}]'::jsonb,'[2,3,6,7]
7
[2,3,5]
8
[2]
1',ARRAY['数组','回溯']::text[],'{"java":"class Solution {\n    public List<List<Integer>> combinationSum(int[] candidates, int target) {\n        \n    }\n}"}'::jsonb,'{"java":"import java.io.*;\nimport java.util.*;\n\npublic class Main {\n    public static void main(String[] args) throws Exception {\n        Scanner scanner = new Scanner(System.in);\n        // 每个参数占一行；数组、矩阵等复合参数使用 JSON 外观。\n        // 可用 nextInt()/next() 读取空白分隔数据，或 nextLine() 读取整行。\n        // TODO: 解析输入并输出答案。\n        scanner.close();\n    }\n}\n"}'::jsonb),
('codetop',69,'695',1011,'岛屿的最大面积','max-area-of-island','中等',NULL,94,'2026-06-23T08:33:02.367000Z',FALSE,'https://leetcode.cn/problems/max-area-of-island/','给你一个大小为 m x n 的二进制矩阵 grid 。

岛屿 是由一些相邻的 1 (代表土地) 构成的组合，这里的「相邻」要求两个 1 必须在 水平或者竖直的四个方向上 相邻。你可以假设 grid 的四个边缘都被 0（代表水）包围着。

岛屿的面积是岛上值为 1 的单元格的数目。

计算并返回 grid 中最大的岛屿面积。如果没有岛屿，则返回面积为 0 。

示例 1：

输入：grid = [[0,0,1,0,0,0,0,1,0,0,0,0,0],[0,0,0,0,0,0,0,1,1,1,0,0,0],[0,1,1,0,1,0,0,0,0,0,0,0,0],[0,1,0,0,1,1,0,0,1,0,1,0,0],[0,1,0,0,1,1,0,0,1,1,1,0,0],[0,0,0,0,0,0,0,0,0,0,1,0,0],[0,0,0,0,0,0,0,1,1,1,0,0,0],[0,0,0,0,0,0,0,1,1,0,0,0,0]]
输出：6
解释：答案不应该是 11 ，因为岛屿只能包含水平或垂直这四个方向上的 1 。

示例 2：

输入：grid = [[0,0,0,0,0,0,0,0]]
输出：0

提示：

	• m == grid.length

	• n == grid[i].length

	• 1

	• grid[i][j] 为 0 或 1','[{"input":"grid = [[0,0,1,0,0,0,0,1,0,0,0,0,0],[0,0,0,0,0,0,0,1,1,1,0,0,0],[0,1,1,0,1,0,0,0,0,0,0,0,0],[0,1,0,0,1,1,0,0,1,0,1,0,0],[0,1,0,0,1,1,0,0,1,1,1,0,0],[0,0,0,0,0,0,0,0,0,0,1,0,0],[0,0,0,0,0,0,0,1,1,1,0,0,0],[0,0,0,0,0,0,0,1,1,0,0,0,0]]","output":"6","explanation":"答案不应该是 11 ，因为岛屿只能包含水平或垂直这四个方向上的 1 。"},{"input":"grid = [[0,0,0,0,0,0,0,0]]","output":"0","explanation":""}]'::jsonb,'[[0,0,1,0,0,0,0,1,0,0,0,0,0],[0,0,0,0,0,0,0,1,1,1,0,0,0],[0,1,1,0,1,0,0,0,0,0,0,0,0],[0,1,0,0,1,1,0,0,1,0,1,0,0],[0,1,0,0,1,1,0,0,1,1,1,0,0],[0,0,0,0,0,0,0,0,0,0,1,0,0],[0,0,0,0,0,0,0,1,1,1,0,0,0],[0,0,0,0,0,0,0,1,1,0,0,0,0]]
[[0,0,0,0,0,0,0,0]]',ARRAY['深度优先搜索','广度优先搜索','并查集','数组','矩阵']::text[],'{"java":"class Solution {\n    public int maxAreaOfIsland(int[][] grid) {\n        \n    }\n}"}'::jsonb,'{"java":"import java.io.*;\nimport java.util.*;\n\npublic class Main {\n    public static void main(String[] args) throws Exception {\n        Scanner scanner = new Scanner(System.in);\n        // 每个参数占一行；数组、矩阵等复合参数使用 JSON 外观。\n        // 可用 nextInt()/next() 读取空白分隔数据，或 nextLine() 读取整行。\n        // TODO: 解析输入并输出答案。\n        scanner.close();\n    }\n}\n"}'::jsonb),
('codetop',70,'128',1556,'最长连续序列','longest-consecutive-sequence','中等',NULL,93,'2026-06-30T16:00:00Z',TRUE,'https://leetcode.cn/problems/longest-consecutive-sequence/','给定一个未排序的整数数组 nums ，找出数字连续的最长序列（不要求序列元素在原数组中连续）的长度。

请你设计并实现时间复杂度为 O(n) 的算法解决此问题。

示例 1：

输入：nums = [100,4,200,1,3,2]
输出：4
解释：最长数字连续序列是 [1, 2, 3, 4]。它的长度为 4。

示例 2：

输入：nums = [0,3,7,2,5,8,4,6,0,1]
输出：9

示例 3：

输入：nums = [1,0,1,2]
输出：3

提示：

	• 0 5

	• -109 9','[{"input":"nums = [100,4,200,1,3,2]","output":"4","explanation":"最长数字连续序列是 [1, 2, 3, 4]。它的长度为 4。"},{"input":"nums = [0,3,7,2,5,8,4,6,0,1]","output":"9","explanation":""},{"input":"nums = [1,0,1,2]","output":"3","explanation":""}]'::jsonb,'[100,4,200,1,3,2]
[0,3,7,2,5,8,4,6,0,1]
[1,0,1,2]',ARRAY['并查集','数组','哈希表']::text[],'{"java":"class Solution {\n    public int longestConsecutive(int[] nums) {\n        \n    }\n}"}'::jsonb,'{"java":"import java.io.*;\nimport java.util.*;\n\npublic class Main {\n    public static void main(String[] args) throws Exception {\n        Scanner scanner = new Scanner(System.in);\n        // 每个参数占一行；数组、矩阵等复合参数使用 JSON 外观。\n        // 可用 nextInt()/next() 读取空白分隔数据，或 nextLine() 读取整行。\n        // TODO: 解析输入并输出答案。\n        scanner.close();\n    }\n}\n"}'::jsonb),
('codetop',71,'122',1562,'买卖股票的最佳时机 II','best-time-to-buy-and-sell-stock-ii','简单',NULL,91,'2026-06-04T08:39:02.595000Z',FALSE,'https://leetcode.cn/problems/best-time-to-buy-and-sell-stock-ii/','给你一个整数数组 prices ，其中 prices[i] 表示某支股票第 i 天的价格。

在每一天，你可以决定是否购买和/或出售股票。你在任何时候 最多 只能持有 一股 股票。然而，你可以在 同一天 多次买卖该股票，但要确保你持有的股票不超过一股。

返回 你能获得的 最大 利润 。

示例 1：

输入：prices = [7,1,5,3,6,4]
输出：7
解释：在第 2 天（股票价格 = 1）的时候买入，在第 3 天（股票价格 = 5）的时候卖出, 这笔交易所能获得利润 = 5 - 1 = 4。
随后，在第 4 天（股票价格 = 3）的时候买入，在第 5 天（股票价格 = 6）的时候卖出, 这笔交易所能获得利润 = 6 - 3 = 3。
最大总利润为 4 + 3 = 7 。

示例 2：

输入：prices = [1,2,3,4,5]
输出：4
解释：在第 1 天（股票价格 = 1）的时候买入，在第 5 天 （股票价格 = 5）的时候卖出, 这笔交易所能获得利润 = 5 - 1 = 4。
最大总利润为 4 。

示例 3：

输入：prices = [7,6,4,3,1]
输出：0
解释：在这种情况下, 交易无法获得正利润，所以不参与交易可以获得最大利润，最大利润为 0。

提示：

	• 1 4

	• 0 4','[{"input":"prices = [7,1,5,3,6,4]","output":"7","explanation":"在第 2 天（股票价格 = 1）的时候买入，在第 3 天（股票价格 = 5）的时候卖出, 这笔交易所能获得利润 = 5 - 1 = 4。\n随后，在第 4 天（股票价格 = 3）的时候买入，在第 5 天（股票价格 = 6）的时候卖出, 这笔交易所能获得利润 = 6 - 3 = 3。\n最大总利润为 4 + 3 = 7 。"},{"input":"prices = [1,2,3,4,5]","output":"4","explanation":"在第 1 天（股票价格 = 1）的时候买入，在第 5 天 （股票价格 = 5）的时候卖出, 这笔交易所能获得利润 = 5 - 1 = 4。\n最大总利润为 4 。"},{"input":"prices = [7,6,4,3,1]","output":"0","explanation":"在这种情况下, 交易无法获得正利润，所以不参与交易可以获得最大利润，最大利润为 0。"}]'::jsonb,'[7,1,5,3,6,4]
[1,2,3,4,5]
[7,6,4,3,1]',ARRAY['贪心','数组','动态规划']::text[],'{"java":"class Solution {\n    public int maxProfit(int[] prices) {\n        \n    }\n}"}'::jsonb,'{"java":"import java.io.*;\nimport java.util.*;\n\npublic class Main {\n    public static void main(String[] args) throws Exception {\n        Scanner scanner = new Scanner(System.in);\n        // 每个参数占一行；数组、矩阵等复合参数使用 JSON 外观。\n        // 可用 nextInt()/next() 读取空白分隔数据，或 nextLine() 读取整行。\n        // TODO: 解析输入并输出答案。\n        scanner.close();\n    }\n}\n"}'::jsonb),
('codetop',72,'104',1580,'二叉树的最大深度','maximum-depth-of-binary-tree','简单',NULL,91,'2026-05-07T16:00:00Z',TRUE,'https://leetcode.cn/problems/maximum-depth-of-binary-tree/','给定一个二叉树 root ，返回其最大深度。

二叉树的 最大深度 是指从根节点到最远叶子节点的最长路径上的节点数。

示例 1：

输入：root = [3,9,20,null,null,15,7]
输出：3

示例 2：

输入：root = [1,null,2]
输出：2

提示：

	• 树中节点的数量在 [0, 104] 区间内。

	• -100','[{"input":"root = [3,9,20,null,null,15,7]","output":"3","explanation":""},{"input":"root = [1,null,2]","output":"2","explanation":""}]'::jsonb,'[3,9,20,null,null,15,7]
[1,null,2]',ARRAY['树','深度优先搜索','广度优先搜索','二叉树']::text[],'{"java":"/**\n * Definition for a binary tree node.\n * public class TreeNode {\n *     int val;\n *     TreeNode left;\n *     TreeNode right;\n *     TreeNode() {}\n *     TreeNode(int val) { this.val = val; }\n *     TreeNode(int val, TreeNode left, TreeNode right) {\n *         this.val = val;\n *         this.left = left;\n *         this.right = right;\n *     }\n * }\n */\nclass Solution {\n    public int maxDepth(TreeNode root) {\n        \n    }\n}"}'::jsonb,'{"java":"import java.io.*;\nimport java.util.*;\n\npublic class Main {\n    public static void main(String[] args) throws Exception {\n        Scanner scanner = new Scanner(System.in);\n        // 每个参数占一行；数组、矩阵等复合参数使用 JSON 外观。\n        // 可用 nextInt()/next() 读取空白分隔数据，或 nextLine() 读取整行。\n        // TODO: 解析输入并输出答案。\n        scanner.close();\n    }\n}\n"}'::jsonb),
('codetop',73,'110',1574,'平衡二叉树','balanced-binary-tree','简单',NULL,88,'2026-08-06T02:51:00.755000Z',FALSE,'https://leetcode.cn/problems/balanced-binary-tree/','给定一个二叉树，判断它是否是 平衡二叉树

示例 1：

输入：root = [3,9,20,null,null,15,7]
输出：true

示例 2：

输入：root = [1,2,2,3,3,null,null,4,4]
输出：false

示例 3：

输入：root = []
输出：true

提示：

	• 树中的节点数在范围 [0, 5000] 内

	• -104 4','[{"input":"root = [3,9,20,null,null,15,7]","output":"true","explanation":""},{"input":"root = [1,2,2,3,3,null,null,4,4]","output":"false","explanation":""},{"input":"root = []","output":"true","explanation":""}]'::jsonb,'[3,9,20,null,null,15,7]
[1,2,2,3,3,null,null,4,4]
[]',ARRAY['树','深度优先搜索','二叉树']::text[],'{"java":"/**\n * Definition for a binary tree node.\n * public class TreeNode {\n *     int val;\n *     TreeNode left;\n *     TreeNode right;\n *     TreeNode() {}\n *     TreeNode(int val) { this.val = val; }\n *     TreeNode(int val, TreeNode left, TreeNode right) {\n *         this.val = val;\n *         this.left = left;\n *         this.right = right;\n *     }\n * }\n */\nclass Solution {\n    public boolean isBalanced(TreeNode root) {\n        \n    }\n}"}'::jsonb,'{"java":"import java.io.*;\nimport java.util.*;\n\npublic class Main {\n    public static void main(String[] args) throws Exception {\n        Scanner scanner = new Scanner(System.in);\n        // 每个参数占一行；数组、矩阵等复合参数使用 JSON 外观。\n        // 可用 nextInt()/next() 读取空白分隔数据，或 nextLine() 读取整行。\n        // TODO: 解析输入并输出答案。\n        scanner.close();\n    }\n}\n"}'::jsonb),
('codetop',74,'221',1463,'最大正方形','maximal-square','中等',NULL,88,'2026-04-17T12:25:48.296000Z',FALSE,'https://leetcode.cn/problems/maximal-square/','在一个由 ''0'' 和 ''1'' 组成的二维矩阵内，找到只包含 ''1'' 的最大正方形，并返回其面积。

 

示例 1：

输入：matrix = [["1","0","1","0","0"],["1","0","1","1","1"],["1","1","1","1","1"],["1","0","0","1","0"]]
输出：4

示例 2：

输入：matrix = [["0","1"],["1","0"]]
输出：1

示例 3：

输入：matrix = [["0"]]
输出：0

 

提示：

	• m == matrix.length

	• n == matrix[i].length

	• 1

	• matrix[i][j] 为 ''0'' 或 ''1''','[{"input":"matrix = [[\"1\",\"0\",\"1\",\"0\",\"0\"],[\"1\",\"0\",\"1\",\"1\",\"1\"],[\"1\",\"1\",\"1\",\"1\",\"1\"],[\"1\",\"0\",\"0\",\"1\",\"0\"]]","output":"4","explanation":""},{"input":"matrix = [[\"0\",\"1\"],[\"1\",\"0\"]]","output":"1","explanation":""},{"input":"matrix = [[\"0\"]]","output":"0","explanation":""}]'::jsonb,'[["1","0","1","0","0"],["1","0","1","1","1"],["1","1","1","1","1"],["1","0","0","1","0"]]
[["0","1"],["1","0"]]
[["0"]]',ARRAY['数组','动态规划','矩阵']::text[],'{"java":"class Solution {\n    public int maximalSquare(char[][] matrix) {\n        \n    }\n}"}'::jsonb,'{"java":"import java.io.*;\nimport java.util.*;\n\npublic class Main {\n    public static void main(String[] args) throws Exception {\n        Scanner scanner = new Scanner(System.in);\n        // 每个参数占一行；数组、矩阵等复合参数使用 JSON 外观。\n        // 可用 nextInt()/next() 读取空白分隔数据，或 nextLine() 读取整行。\n        // TODO: 解析输入并输出答案。\n        scanner.close();\n    }\n}\n"}'::jsonb),
('codetop',75,'234',1450,'回文链表','palindrome-linked-list','简单',NULL,86,'2026-05-21T16:00:00Z',TRUE,'https://leetcode.cn/problems/palindrome-linked-list/','给你一个单链表的头节点 head ，请你判断该链表是否为回文链表。如果是，返回 true ；否则，返回 false 。

示例 1：

输入：head = [1,2,2,1]
输出：true

示例 2：

输入：head = [1,2]
输出：false

提示：

	• 链表中节点数目在范围[1, 105] 内

	• 0

进阶：你能否用 O(n) 时间复杂度和 O(1) 空间复杂度解决此题？','[{"input":"head = [1,2,2,1]","output":"true","explanation":""},{"input":"head = [1,2]","output":"false","explanation":""}]'::jsonb,'[1,2,2,1]
[1,2]',ARRAY['栈','递归','链表','双指针']::text[],'{"java":"/**\n * Definition for singly-linked list.\n * public class ListNode {\n *     int val;\n *     ListNode next;\n *     ListNode() {}\n *     ListNode(int val) { this.val = val; }\n *     ListNode(int val, ListNode next) { this.val = val; this.next = next; }\n * }\n */\nclass Solution {\n    public boolean isPalindrome(ListNode head) {\n        \n    }\n}"}'::jsonb,'{"java":"import java.io.*;\nimport java.util.*;\n\npublic class Main {\n    public static void main(String[] args) throws Exception {\n        Scanner scanner = new Scanner(System.in);\n        // 每个参数占一行；数组、矩阵等复合参数使用 JSON 外观。\n        // 可用 nextInt()/next() 读取空白分隔数据，或 nextLine() 读取整行。\n        // TODO: 解析输入并输出答案。\n        scanner.close();\n    }\n}\n"}'::jsonb),
('codetop',76,'48',1636,'旋转图像','rotate-image','中等',NULL,85,'2026-08-19T21:33:49.990000Z',TRUE,'https://leetcode.cn/problems/rotate-image/','给定一个 n × n 的二维矩阵 matrix 表示一个图像。请你将图像顺时针旋转 90 度。

你必须在 原地 旋转图像，这意味着你需要直接修改输入的二维矩阵。请不要 使用另一个矩阵来旋转图像。

示例 1：

输入：matrix = [[1,2,3],[4,5,6],[7,8,9]]
输出：[[7,4,1],[8,5,2],[9,6,3]]

示例 2：

输入：matrix = [[5,1,9,11],[2,4,8,10],[13,3,6,7],[15,14,12,16]]
输出：[[15,13,2,5],[14,3,4,1],[12,6,8,9],[16,7,10,11]]

提示：

	• n == matrix.length == matrix[i].length

	• 1

	• -1000','[{"input":"matrix = [[1,2,3],[4,5,6],[7,8,9]]","output":"[[7,4,1],[8,5,2],[9,6,3]]","explanation":""},{"input":"matrix = [[5,1,9,11],[2,4,8,10],[13,3,6,7],[15,14,12,16]]","output":"[[15,13,2,5],[14,3,4,1],[12,6,8,9],[16,7,10,11]]","explanation":""}]'::jsonb,'[[1,2,3],[4,5,6],[7,8,9]]
[[5,1,9,11],[2,4,8,10],[13,3,6,7],[15,14,12,16]]',ARRAY['数组','数学','矩阵']::text[],'{"java":"class Solution {\n    public void rotate(int[][] matrix) {\n        \n    }\n}"}'::jsonb,'{"java":"import java.io.*;\nimport java.util.*;\n\npublic class Main {\n    public static void main(String[] args) throws Exception {\n        Scanner scanner = new Scanner(System.in);\n        // 每个参数占一行；数组、矩阵等复合参数使用 JSON 外观。\n        // 可用 nextInt()/next() 读取空白分隔数据，或 nextLine() 读取整行。\n        // TODO: 解析输入并输出答案。\n        scanner.close();\n    }\n}\n"}'::jsonb),
('codetop',77,'240',1444,'搜索二维矩阵 II','search-a-2d-matrix-ii','中等',NULL,85,'2026-07-21T14:51:21.558000Z',TRUE,'https://leetcode.cn/problems/search-a-2d-matrix-ii/','编写一个高效的算法来搜索 m x n 矩阵 matrix 中的一个目标值 target 。该矩阵具有以下特性：

	• 每行的元素从左到右升序排列。

	• 每列的元素从上到下升序排列。

示例 1：

输入：matrix = [[1,4,7,11,15],[2,5,8,12,19],[3,6,9,16,22],[10,13,14,17,24],[18,21,23,26,30]], target = 5
输出：true

示例 2：

输入：matrix = [[1,4,7,11,15],[2,5,8,12,19],[3,6,9,16,22],[10,13,14,17,24],[18,21,23,26,30]], target = 20
输出：false

提示：

	• m == matrix.length

	• n == matrix[i].length

	• 1

	• -109 9

	• 每行的所有元素从左到右升序排列

	• 每列的所有元素从上到下升序排列

	• -109 9','[{"input":"matrix = [[1,4,7,11,15],[2,5,8,12,19],[3,6,9,16,22],[10,13,14,17,24],[18,21,23,26,30]], target = 5","output":"true","explanation":""},{"input":"matrix = [[1,4,7,11,15],[2,5,8,12,19],[3,6,9,16,22],[10,13,14,17,24],[18,21,23,26,30]], target = 20","output":"false","explanation":""}]'::jsonb,'[[1,4,7,11,15],[2,5,8,12,19],[3,6,9,16,22],[10,13,14,17,24],[18,21,23,26,30]]
5
[[1,4,7,11,15],[2,5,8,12,19],[3,6,9,16,22],[10,13,14,17,24],[18,21,23,26,30]]
20',ARRAY['数组','二分查找','分治','矩阵']::text[],'{"java":"class Solution {\n    public boolean searchMatrix(int[][] matrix, int target) {\n        \n    }\n}"}'::jsonb,'{"java":"import java.io.*;\nimport java.util.*;\n\npublic class Main {\n    public static void main(String[] args) throws Exception {\n        Scanner scanner = new Scanner(System.in);\n        // 每个参数占一行；数组、矩阵等复合参数使用 JSON 外观。\n        // 可用 nextInt()/next() 读取空白分隔数据，或 nextLine() 读取整行。\n        // TODO: 解析输入并输出答案。\n        scanner.close();\n    }\n}\n"}'::jsonb),
('codetop',78,'152',1532,'乘积最大子数组','maximum-product-subarray','中等',NULL,85,'2026-05-27T16:00:00Z',TRUE,'https://leetcode.cn/problems/maximum-product-subarray/','给你一个整数数组 nums ，请你找出数组中乘积最大的非空连续 子数组（该子数组中至少包含一个数字），并返回该子数组所对应的乘积。

测试用例的答案是一个 32-位 整数。

请注意，一个只包含一个元素的数组的乘积是这个元素的值。

示例 1:

输入: nums = [2,3,-2,4]
输出: 6
解释: 子数组 [2,3] 有最大乘积 6。

示例 2:

输入: nums = [-2,0,-1]
输出: 0
解释: 结果不能为 2, 因为 [-2,-1] 不是子数组。

提示:

	• 1 4

	• -10

	• nums 的任何子数组的乘积都 保证 是一个 32-位 整数','[{"input":"nums = [2,3,-2,4]","output":"6","explanation":"子数组 [2,3] 有最大乘积 6。"},{"input":"nums = [-2,0,-1]","output":"0","explanation":"结果不能为 2, 因为 [-2,-1] 不是子数组。"}]'::jsonb,'[2,3,-2,4]
[-2,0,-1]',ARRAY['数组','动态规划']::text[],'{"java":"class Solution {\n    public int maxProduct(int[] nums) {\n        \n    }\n}"}'::jsonb,'{"java":"import java.io.*;\nimport java.util.*;\n\npublic class Main {\n    public static void main(String[] args) throws Exception {\n        Scanner scanner = new Scanner(System.in);\n        // 每个参数占一行；数组、矩阵等复合参数使用 JSON 外观。\n        // 可用 nextInt()/next() 读取空白分隔数据，或 nextLine() 读取整行。\n        // TODO: 解析输入并输出答案。\n        scanner.close();\n    }\n}\n"}'::jsonb),
('codetop',79,'179',1505,'最大数','largest-number','中等',NULL,84,'2026-08-05T08:15:29.366000Z',FALSE,'https://leetcode.cn/problems/largest-number/','给定一组非负整数 nums，重新排列每个数的顺序（每个数不可拆分）使之组成一个最大的整数。

注意：输出结果可能非常大，所以你需要返回一个字符串而不是整数。

示例 1：

输入：nums = [10,2]
输出："210"

示例 2：

输入：nums = [3,30,34,5,9]
输出："9534330"

提示：

	• 1

	• 0 9','[{"input":"nums = [10,2]","output":"\"210\"","explanation":""},{"input":"nums = [3,30,34,5,9]","output":"\"9534330\"","explanation":""}]'::jsonb,'[10,2]
[3,30,34,5,9]',ARRAY['贪心','数组','字符串','排序']::text[],'{"java":"class Solution {\n    public String largestNumber(int[] nums) {\n        \n    }\n}"}'::jsonb,'{"java":"import java.io.*;\nimport java.util.*;\n\npublic class Main {\n    public static void main(String[] args) throws Exception {\n        Scanner scanner = new Scanner(System.in);\n        // 每个参数占一行；数组、矩阵等复合参数使用 JSON 外观。\n        // 可用 nextInt()/next() 读取空白分隔数据，或 nextLine() 读取整行。\n        // TODO: 解析输入并输出答案。\n        scanner.close();\n    }\n}\n"}'::jsonb),
('codetop',80,'662',1044,'二叉树最大宽度','maximum-width-of-binary-tree','中等',NULL,84,'2026-07-17T16:00:00Z',FALSE,'https://leetcode.cn/problems/maximum-width-of-binary-tree/','给你一棵二叉树的根节点 root ，返回树的 最大宽度 。

树的 最大宽度 是所有层中最大的 宽度 。

每一层的 宽度 被定义为该层最左和最右的非空节点（即，两个端点）之间的长度。将这个二叉树视作与满二叉树结构相同，两端点间会出现一些延伸到这一层的 null 节点，这些 null 节点也计入长度。

题目数据保证答案将会在  32 位 带符号整数范围内。

示例 1：

输入：root = [1,3,2,5,3,null,9]
输出：4
解释：最大宽度出现在树的第 3 层，宽度为 4 (5,3,null,9) 。

示例 2：

输入：root = [1,3,2,5,null,null,9,6,null,7]
输出：7
解释：最大宽度出现在树的第 4 层，宽度为 7 (6,null,null,null,null,null,7) 。

示例 3：

输入：root = [1,3,2,5]
输出：2
解释：最大宽度出现在树的第 2 层，宽度为 2 (3,2) 。

提示：

	• 树中节点的数目范围是 [1, 3000]

	• -100','[{"input":"root = [1,3,2,5,3,null,9]","output":"4","explanation":"最大宽度出现在树的第 3 层，宽度为 4 (5,3,null,9) 。"},{"input":"root = [1,3,2,5,null,null,9,6,null,7]","output":"7","explanation":"最大宽度出现在树的第 4 层，宽度为 7 (6,null,null,null,null,null,7) 。"},{"input":"root = [1,3,2,5]","output":"2","explanation":"最大宽度出现在树的第 2 层，宽度为 2 (3,2) 。"}]'::jsonb,'[1,3,2,5,3,null,9]
[1,3,2,5,null,null,9,6,null,7]
[1,3,2,5]',ARRAY['树','深度优先搜索','广度优先搜索','二叉树']::text[],'{"java":"/**\n * Definition for a binary tree node.\n * public class TreeNode {\n *     int val;\n *     TreeNode left;\n *     TreeNode right;\n *     TreeNode() {}\n *     TreeNode(int val) { this.val = val; }\n *     TreeNode(int val, TreeNode left, TreeNode right) {\n *         this.val = val;\n *         this.left = left;\n *         this.right = right;\n *     }\n * }\n */\nclass Solution {\n    public int widthOfBinaryTree(TreeNode root) {\n        \n    }\n}"}'::jsonb,'{"java":"import java.io.*;\nimport java.util.*;\n\npublic class Main {\n    public static void main(String[] args) throws Exception {\n        Scanner scanner = new Scanner(System.in);\n        // 每个参数占一行；数组、矩阵等复合参数使用 JSON 外观。\n        // 可用 nextInt()/next() 读取空白分隔数据，或 nextLine() 读取整行。\n        // TODO: 解析输入并输出答案。\n        scanner.close();\n    }\n}\n"}'::jsonb),
('codetop',81,'14',1670,'最长公共前缀','longest-common-prefix','简单',NULL,84,'2026-06-11T16:00:00Z',FALSE,'https://leetcode.cn/problems/longest-common-prefix/','编写一个函数来查找字符串数组中的最长公共前缀。

如果不存在公共前缀，返回空字符串 ""。

示例 1：

输入：strs = ["flower","flow","flight"]
输出："fl"

示例 2：

输入：strs = ["dog","racecar","car"]
输出：""
解释：输入不存在公共前缀。

提示：

	• 1

	• 0

	• strs[i] 如果非空，则仅由小写英文字母组成','[{"input":"strs = [\"flower\",\"flow\",\"flight\"]","output":"\"fl\"","explanation":""},{"input":"strs = [\"dog\",\"racecar\",\"car\"]","output":"\"\"","explanation":"输入不存在公共前缀。"}]'::jsonb,'["flower","flow","flight"]
["dog","racecar","car"]',ARRAY['字典树','数组','字符串']::text[],'{"java":"class Solution {\n    public String longestCommonPrefix(String[] strs) {\n        \n    }\n}"}'::jsonb,'{"java":"import java.io.*;\nimport java.util.*;\n\npublic class Main {\n    public static void main(String[] args) throws Exception {\n        Scanner scanner = new Scanner(System.in);\n        // 每个参数占一行；数组、矩阵等复合参数使用 JSON 外观。\n        // 可用 nextInt()/next() 读取空白分隔数据，或 nextLine() 读取整行。\n        // TODO: 解析输入并输出答案。\n        scanner.close();\n    }\n}\n"}'::jsonb),
('codetop',82,'98',1586,'验证二叉搜索树','validate-binary-search-tree','中等',NULL,84,'2026-04-20T14:17:50.588000Z',TRUE,'https://leetcode.cn/problems/validate-binary-search-tree/','给你一个二叉树的根节点 root ，判断其是否是一个有效的二叉搜索树。

有效 二叉搜索树定义如下：

	• 节点的左子树只包含 严格小于 当前节点的数。

	• 节点的右子树只包含 严格大于 当前节点的数。

	• 所有左子树和右子树自身必须也是二叉搜索树。

示例 1：

输入：root = [2,1,3]
输出：true

示例 2：

输入：root = [5,1,4,null,null,3,6]
输出：false
解释：根节点的值是 5 ，但是右子节点的值是 4 。

提示：

	• 树中节点数目范围在[1, 104] 内

	• -231 31 - 1','[{"input":"root = [2,1,3]","output":"true","explanation":""},{"input":"root = [5,1,4,null,null,3,6]","output":"false","explanation":"根节点的值是 5 ，但是右子节点的值是 4 。"}]'::jsonb,'[2,1,3]
[5,1,4,null,null,3,6]',ARRAY['树','深度优先搜索','二叉搜索树','二叉树']::text[],'{"java":"/**\n * Definition for a binary tree node.\n * public class TreeNode {\n *     int val;\n *     TreeNode left;\n *     TreeNode right;\n *     TreeNode() {}\n *     TreeNode(int val) { this.val = val; }\n *     TreeNode(int val, TreeNode left, TreeNode right) {\n *         this.val = val;\n *         this.left = left;\n *         this.right = right;\n *     }\n * }\n */\nclass Solution {\n    public boolean isValidBST(TreeNode root) {\n        \n    }\n}"}'::jsonb,'{"java":"import java.io.*;\nimport java.util.*;\n\npublic class Main {\n    public static void main(String[] args) throws Exception {\n        Scanner scanner = new Scanner(System.in);\n        // 每个参数占一行；数组、矩阵等复合参数使用 JSON 外观。\n        // 可用 nextInt()/next() 读取空白分隔数据，或 nextLine() 读取整行。\n        // TODO: 解析输入并输出答案。\n        scanner.close();\n    }\n}\n"}'::jsonb),
('codetop',83,'144',1540,'二叉树的前序遍历','binary-tree-preorder-traversal','简单',NULL,84,'2025-04-17T16:00:00Z',FALSE,'https://leetcode.cn/problems/binary-tree-preorder-traversal/','给你二叉树的根节点 root ，返回它节点值的 前序 遍历。

示例 1：

输入：root = [1,null,2,3]

输出：[1,2,3]

解释：

示例 2：

输入：root = [1,2,3,4,5,null,8,null,null,6,7,9]

输出：[1,2,4,5,6,7,3,8,9]

解释：

示例 3：

输入：root = []

输出：[]

示例 4：

输入：root = [1]

输出：[1]

提示：

	• 树中节点数目在范围 [0, 100] 内

	• -100

进阶：递归算法很简单，你可以通过迭代算法完成吗？','[{"input":"root = [1,null,2,3]","output":"[1,2,3]","explanation":""},{"input":"root = [1,2,3,4,5,null,8,null,null,6,7,9]","output":"[1,2,4,5,6,7,3,8,9]","explanation":""},{"input":"root = []","output":"[]","explanation":""},{"input":"root = [1]","output":"[1]","explanation":""}]'::jsonb,'[1,null,2,3]
[1,2,3,4,5,null,8,null,null,6,7,9]
[]
[1]',ARRAY['栈','树','深度优先搜索','二叉树']::text[],'{"java":"/**\n * Definition for a binary tree node.\n * public class TreeNode {\n *     int val;\n *     TreeNode left;\n *     TreeNode right;\n *     TreeNode() {}\n *     TreeNode(int val) { this.val = val; }\n *     TreeNode(int val, TreeNode left, TreeNode right) {\n *         this.val = val;\n *         this.left = left;\n *         this.right = right;\n *     }\n * }\n */\nclass Solution {\n    public List<Integer> preorderTraversal(TreeNode root) {\n        \n    }\n}"}'::jsonb,'{"java":"import java.io.*;\nimport java.util.*;\n\npublic class Main {\n    public static void main(String[] args) throws Exception {\n        Scanner scanner = new Scanner(System.in);\n        // 每个参数占一行；数组、矩阵等复合参数使用 JSON 外观。\n        // 可用 nextInt()/next() 读取空白分隔数据，或 nextLine() 读取整行。\n        // TODO: 解析输入并输出答案。\n        scanner.close();\n    }\n}\n"}'::jsonb),
('codetop',84,'543',1156,'二叉树的直径','diameter-of-binary-tree','简单',NULL,82,'2026-08-03T08:06:11.471000Z',TRUE,'https://leetcode.cn/problems/diameter-of-binary-tree/','给你一棵二叉树的根节点，返回该树的 直径 。

二叉树的 直径 是指树中任意两个节点之间最长路径的 长度 。这条路径可能经过也可能不经过根节点 root 。

两节点之间路径的 长度 由它们之间边数表示。

示例 1：

输入：root = [1,2,3,4,5]
输出：3
解释：3 ，取路径 [4,2,1,3] 或 [5,2,1,3] 的长度。

示例 2：

输入：root = [1,2]
输出：1

提示：

	• 树中节点数目在范围 [1, 104] 内

	• -100','[{"input":"root = [1,2,3,4,5]","output":"3","explanation":"3 ，取路径 [4,2,1,3] 或 [5,2,1,3] 的长度。"},{"input":"root = [1,2]","output":"1","explanation":""}]'::jsonb,'[1,2,3,4,5]
[1,2]',ARRAY['树','深度优先搜索','二叉树','dp-on-trees']::text[],'{"java":"/**\n * Definition for a binary tree node.\n * public class TreeNode {\n *     int val;\n *     TreeNode left;\n *     TreeNode right;\n *     TreeNode() {}\n *     TreeNode(int val) { this.val = val; }\n *     TreeNode(int val, TreeNode left, TreeNode right) {\n *         this.val = val;\n *         this.left = left;\n *         this.right = right;\n *     }\n * }\n */\nclass Solution {\n    public int diameterOfBinaryTree(TreeNode root) {\n        \n    }\n}"}'::jsonb,'{"java":"import java.io.*;\nimport java.util.*;\n\npublic class Main {\n    public static void main(String[] args) throws Exception {\n        Scanner scanner = new Scanner(System.in);\n        // 每个参数占一行；数组、矩阵等复合参数使用 JSON 外观。\n        // 可用 nextInt()/next() 读取空白分隔数据，或 nextLine() 读取整行。\n        // TODO: 解析输入并输出答案。\n        scanner.close();\n    }\n}\n"}'::jsonb),
('codetop',85,'560',1142,'和为K的子数组','subarray-sum-equals-k','中等',NULL,80,'2026-08-17T13:18:08.395000Z',TRUE,'https://leetcode.cn/problems/subarray-sum-equals-k/','给你一个整数数组 nums 和一个整数 k ，请你统计并返回 该数组中和为 k 的子数组的个数 。

子数组是数组中元素的连续非空序列。

示例 1：

输入：nums = [1,1,1], k = 2
输出：2

示例 2：

输入：nums = [1,2,3], k = 3
输出：2

提示：

	• 1 4

	• -1000

	• -107 7','[{"input":"nums = [1,1,1], k = 2","output":"2","explanation":""},{"input":"nums = [1,2,3], k = 3","output":"2","explanation":""}]'::jsonb,'[1,1,1]
2
[1,2,3]
3',ARRAY['数组','哈希表','前缀和']::text[],'{"java":"class Solution {\n    public int subarraySum(int[] nums, int k) {\n        \n    }\n}"}'::jsonb,'{"java":"import java.io.*;\nimport java.util.*;\n\npublic class Main {\n    public static void main(String[] args) throws Exception {\n        Scanner scanner = new Scanner(System.in);\n        // 每个参数占一行；数组、矩阵等复合参数使用 JSON 外观。\n        // 可用 nextInt()/next() 读取空白分隔数据，或 nextLine() 读取整行。\n        // TODO: 解析输入并输出答案。\n        scanner.close();\n    }\n}\n"}'::jsonb),
('codetop',86,'162',1522,'寻找峰值','find-peak-element','中等',NULL,80,'2026-04-19T08:22:26.581000Z',FALSE,'https://leetcode.cn/problems/find-peak-element/','峰值元素是指其值严格大于左右相邻值的元素。

给你一个整数数组 nums，找到峰值元素并返回其索引。数组可能包含多个峰值，在这种情况下，返回 任何一个峰值 所在位置即可。

你可以假设 nums[-1] = nums[n] = -∞ 。

你必须实现时间复杂度为 O(log n) 的算法来解决此问题。

示例 1：

输入：nums = [1,2,3,1]
输出：2
解释：3 是峰值元素，你的函数应该返回其索引 2。

示例 2：

输入：nums = [1,2,1,3,5,6,4]
输出：1 或 5
解释：你的函数可以返回索引 1，其峰值元素为 2；
     或者返回索引 5， 其峰值元素为 6。

提示：

	• 1

	• -231 31 - 1

	• 对于所有有效的 i 都有 nums[i] != nums[i + 1]','[{"input":"nums = [1,2,3,1]","output":"2","explanation":"3 是峰值元素，你的函数应该返回其索引 2。"},{"input":"nums = [1,2,1,3,5,6,4]","output":"1 或 5","explanation":"你的函数可以返回索引 1，其峰值元素为 2；\n     或者返回索引 5， 其峰值元素为 6。"}]'::jsonb,'[1,2,3,1]
[1,2,1,3,5,6,4]',ARRAY['数组','二分查找']::text[],'{"java":"class Solution {\n    public int findPeakElement(int[] nums) {\n        \n    }\n}"}'::jsonb,'{"java":"import java.io.*;\nimport java.util.*;\n\npublic class Main {\n    public static void main(String[] args) throws Exception {\n        Scanner scanner = new Scanner(System.in);\n        // 每个参数占一行；数组、矩阵等复合参数使用 JSON 外观。\n        // 可用 nextInt()/next() 读取空白分隔数据，或 nextLine() 读取整行。\n        // TODO: 解析输入并输出答案。\n        scanner.close();\n    }\n}\n"}'::jsonb),
('codetop',87,'113',1571,'路径总和 II','path-sum-ii','中等',NULL,78,'2026-07-24T05:27:46.332000Z',FALSE,'https://leetcode.cn/problems/path-sum-ii/','给你二叉树的根节点 root 和一个整数目标和 targetSum ，找出所有 从根节点到叶子节点 路径总和等于给定目标和的路径。

叶子节点 是指没有子节点的节点。

 

示例 1：

输入：root = [5,4,8,11,null,13,4,7,2,null,null,5,1], targetSum = 22
输出：[[5,4,11,2],[5,8,4,5]]

示例 2：

输入：root = [1,2,3], targetSum = 5
输出：[]

示例 3：

输入：root = [1,2], targetSum = 0
输出：[]

 

提示：

	• 树中节点总数在范围 [0, 5000] 内

	• -1000

	• -1000','[{"input":"root = [5,4,8,11,null,13,4,7,2,null,null,5,1], targetSum = 22","output":"[[5,4,11,2],[5,8,4,5]]","explanation":""},{"input":"root = [1,2,3], targetSum = 5","output":"[]","explanation":""},{"input":"root = [1,2], targetSum = 0","output":"[]","explanation":""}]'::jsonb,'[5,4,8,11,null,13,4,7,2,null,null,5,1]
22
[1,2,3]
5
[1,2]
0',ARRAY['树','深度优先搜索','回溯','二叉树']::text[],'{"java":"/**\n * Definition for a binary tree node.\n * public class TreeNode {\n *     int val;\n *     TreeNode left;\n *     TreeNode right;\n *     TreeNode() {}\n *     TreeNode(int val) { this.val = val; }\n *     TreeNode(int val, TreeNode left, TreeNode right) {\n *         this.val = val;\n *         this.left = left;\n *         this.right = right;\n *     }\n * }\n */\nclass Solution {\n    public List<List<Integer>> pathSum(TreeNode root, int targetSum) {\n        \n    }\n}"}'::jsonb,'{"java":"import java.io.*;\nimport java.util.*;\n\npublic class Main {\n    public static void main(String[] args) throws Exception {\n        Scanner scanner = new Scanner(System.in);\n        // 每个参数占一行；数组、矩阵等复合参数使用 JSON 外观。\n        // 可用 nextInt()/next() 读取空白分隔数据，或 nextLine() 读取整行。\n        // TODO: 解析输入并输出答案。\n        scanner.close();\n    }\n}\n"}'::jsonb),
('codetop',88,'62',1622,'不同路径','unique-paths','中等',NULL,78,'2026-06-01T14:32:33.655000Z',TRUE,'https://leetcode.cn/problems/unique-paths/','一个机器人位于一个 m x n 网格的左上角 （起始点在下图中标记为 “Start” ）。

机器人每次只能向下或者向右移动一步。机器人试图达到网格的右下角（在下图中标记为 “Finish” ）。

问总共有多少条不同的路径？

示例 1：

输入：m = 3, n = 7
输出：28

示例 2：

输入：m = 3, n = 2
输出：3
解释：
从左上角开始，总共有 3 条路径可以到达右下角。
1. 向右 -> 向下 -> 向下
2. 向下 -> 向下 -> 向右
3. 向下 -> 向右 -> 向下

示例 3：

输入：m = 7, n = 3
输出：28

示例 4：

输入：m = 3, n = 3
输出：6

提示：

	• 1

	• 题目数据保证答案小于等于 2 * 109','[{"input":"m = 3, n = 7","output":"28","explanation":""},{"input":"m = 3, n = 2","output":"3","explanation":"从左上角开始，总共有 3 条路径可以到达右下角。\n1. 向右 -> 向下 -> 向下\n2. 向下 -> 向下 -> 向右\n3. 向下 -> 向右 -> 向下"},{"input":"m = 7, n = 3","output":"28","explanation":""},{"input":"m = 3, n = 3","output":"6","explanation":""}]'::jsonb,'3
7
3
2',ARRAY['数学','动态规划','组合数学']::text[],'{"java":"class Solution {\n    public int uniquePaths(int m, int n) {\n        \n    }\n}"}'::jsonb,'{"java":"import java.io.*;\nimport java.util.*;\n\npublic class Main {\n    public static void main(String[] args) throws Exception {\n        Scanner scanner = new Scanner(System.in);\n        // 每个参数占一行；数组、矩阵等复合参数使用 JSON 外观。\n        // 可用 nextInt()/next() 读取空白分隔数据，或 nextLine() 读取整行。\n        // TODO: 解析输入并输出答案。\n        scanner.close();\n    }\n}\n"}'::jsonb),
('codetop',89,'198',1486,'打家劫舍','house-robber','中等',NULL,75,'2026-07-28T09:34:39.923000Z',TRUE,'https://leetcode.cn/problems/house-robber/','你是一个专业的小偷，计划偷窃沿街的房屋。每间房内都藏有一定的现金，影响你偷窃的唯一制约因素就是相邻的房屋装有相互连通的防盗系统，如果两间相邻的房屋在同一晚上被小偷闯入，系统会自动报警。

给定一个代表每个房屋存放金额的非负整数数组，计算你 不触动警报装置的情况下 ，一夜之内能够偷窃到的最高金额。

 

示例 1：

输入：[1,2,3,1]
输出：4
解释：偷窃 1 号房屋 (金额 = 1) ，然后偷窃 3 号房屋 (金额 = 3)。
     偷窃到的最高金额 = 1 + 3 = 4 。

示例 2：

输入：[2,7,9,3,1]
输出：12
解释：偷窃 1 号房屋 (金额 = 2), 偷窃 3 号房屋 (金额 = 9)，接着偷窃 5 号房屋 (金额 = 1)。
     偷窃到的最高金额 = 2 + 9 + 1 = 12 。

 

提示：

	• 1

	• 0','[{"input":"[1,2,3,1]","output":"4","explanation":"偷窃 1 号房屋 (金额 = 1) ，然后偷窃 3 号房屋 (金额 = 3)。\n     偷窃到的最高金额 = 1 + 3 = 4 。"},{"input":"[2,7,9,3,1]","output":"12","explanation":"偷窃 1 号房屋 (金额 = 2), 偷窃 3 号房屋 (金额 = 9)，接着偷窃 5 号房屋 (金额 = 1)。\n     偷窃到的最高金额 = 2 + 9 + 1 = 12 。"}]'::jsonb,'[1,2,3,1]
[2,7,9,3,1]',ARRAY['数组','动态规划']::text[],'{"java":"class Solution {\n    public int rob(int[] nums) {\n        \n    }\n}"}'::jsonb,'{"java":"import java.io.*;\nimport java.util.*;\n\npublic class Main {\n    public static void main(String[] args) throws Exception {\n        Scanner scanner = new Scanner(System.in);\n        // 每个参数占一行；数组、矩阵等复合参数使用 JSON 外观。\n        // 可用 nextInt()/next() 读取空白分隔数据，或 nextLine() 读取整行。\n        // TODO: 解析输入并输出答案。\n        scanner.close();\n    }\n}\n"}'::jsonb),
('codetop',90,'209',1475,'长度最小的子数组','minimum-size-subarray-sum','中等',NULL,74,'2026-07-24T12:19:57.759000Z',FALSE,'https://leetcode.cn/problems/minimum-size-subarray-sum/','给定一个含有 n 个正整数的数组和一个正整数 target 。

找出该数组中满足其总和大于等于 target 的长度最小的 子数组 [numsl, numsl+1, ..., numsr-1, numsr] ，并返回其长度。如果不存在符合条件的子数组，返回 0 。

示例 1：

输入：target = 7, nums = [2,3,1,2,4,3]
输出：2
解释：子数组 [4,3] 是该条件下的长度最小的子数组。

示例 2：

输入：target = 4, nums = [1,4,4]
输出：1

示例 3：

输入：target = 11, nums = [1,1,1,1,1,1,1,1]
输出：0

提示：

	• 1 9

	• 1 5

	• 1 4

进阶：

	• 如果你已经实现 O(n) 时间复杂度的解法, 请尝试设计一个 O(n log(n)) 时间复杂度的解法。','[{"input":"target = 7, nums = [2,3,1,2,4,3]","output":"2","explanation":"子数组 [4,3] 是该条件下的长度最小的子数组。"},{"input":"target = 4, nums = [1,4,4]","output":"1","explanation":""},{"input":"target = 11, nums = [1,1,1,1,1,1,1,1]","output":"0","explanation":""}]'::jsonb,'7
[2,3,1,2,4,3]
4
[1,4,4]
11
[1,1,1,1,1,1,1,1]',ARRAY['数组','二分查找','前缀和','滑动窗口']::text[],'{"java":"class Solution {\n    public int minSubArrayLen(int target, int[] nums) {\n        \n    }\n}"}'::jsonb,'{"java":"import java.io.*;\nimport java.util.*;\n\npublic class Main {\n    public static void main(String[] args) throws Exception {\n        Scanner scanner = new Scanner(System.in);\n        // 每个参数占一行；数组、矩阵等复合参数使用 JSON 外观。\n        // 可用 nextInt()/next() 读取空白分隔数据，或 nextLine() 读取整行。\n        // TODO: 解析输入并输出答案。\n        scanner.close();\n    }\n}\n"}'::jsonb),
('codetop',91,'24',1660,'两两交换链表中的节点','swap-nodes-in-pairs','中等',NULL,73,'2026-06-10T16:00:00Z',TRUE,'https://leetcode.cn/problems/swap-nodes-in-pairs/','给你一个链表，两两交换其中相邻的节点，并返回交换后链表的头节点。你必须在不修改节点内部的值的情况下完成本题（即，只能进行节点交换）。

示例 1：

输入：head = [1,2,3,4]
输出：[2,1,4,3]

示例 2：

输入：head = []
输出：[]

示例 3：

输入：head = [1]
输出：[1]

提示：

	• 链表中节点的数目在范围 [0, 100] 内

	• 0','[{"input":"head = [1,2,3,4]","output":"[2,1,4,3]","explanation":""},{"input":"head = []","output":"[]","explanation":""},{"input":"head = [1]","output":"[1]","explanation":""}]'::jsonb,'[1,2,3,4]
[]
[1]
[1,2,3]',ARRAY['递归','链表']::text[],'{"java":"/**\n * Definition for singly-linked list.\n * public class ListNode {\n *     int val;\n *     ListNode next;\n *     ListNode() {}\n *     ListNode(int val) { this.val = val; }\n *     ListNode(int val, ListNode next) { this.val = val; this.next = next; }\n * }\n */\nclass Solution {\n    public ListNode swapPairs(ListNode head) {\n        \n    }\n}"}'::jsonb,'{"java":"import java.io.*;\nimport java.util.*;\n\npublic class Main {\n    public static void main(String[] args) throws Exception {\n        Scanner scanner = new Scanner(System.in);\n        // 每个参数占一行；数组、矩阵等复合参数使用 JSON 外观。\n        // 可用 nextInt()/next() 读取空白分隔数据，或 nextLine() 读取整行。\n        // TODO: 解析输入并输出答案。\n        scanner.close();\n    }\n}\n"}'::jsonb),
('codetop',92,'112',1572,'路径总和','path-sum','简单',NULL,72,'2026-04-14T07:00:00Z',FALSE,'https://leetcode.cn/problems/path-sum/','给你二叉树的根节点 root 和一个表示目标和的整数 targetSum 。判断该树中是否存在 根节点到叶子节点 的路径，这条路径上所有节点值相加等于目标和 targetSum 。如果存在，返回 true ；否则，返回 false 。

叶子节点 是指没有子节点的节点。

示例 1：

输入：root = [5,4,8,11,null,13,4,7,2,null,null,null,1], targetSum = 22
输出：true
解释：等于目标和的根节点到叶节点路径如上图所示。

示例 2：

输入：root = [1,2,3], targetSum = 5
输出：false
解释：树中存在两条根节点到叶子节点的路径：
(1 --> 2): 和为 3
(1 --> 3): 和为 4
不存在 sum = 5 的根节点到叶子节点的路径。

示例 3：

输入：root = [], targetSum = 0
输出：false
解释：由于树是空的，所以不存在根节点到叶子节点的路径。

提示：

	• 树中节点的数目在范围 [0, 5000] 内

	• -1000

	• -1000','[{"input":"root = [5,4,8,11,null,13,4,7,2,null,null,null,1], targetSum = 22","output":"true","explanation":"等于目标和的根节点到叶节点路径如上图所示。"},{"input":"root = [1,2,3], targetSum = 5","output":"false","explanation":"树中存在两条根节点到叶子节点的路径：\n(1 --> 2): 和为 3\n(1 --> 3): 和为 4\n不存在 sum = 5 的根节点到叶子节点的路径。"},{"input":"root = [], targetSum = 0","output":"false","explanation":"由于树是空的，所以不存在根节点到叶子节点的路径。"}]'::jsonb,'[5,4,8,11,null,13,4,7,2,null,null,null,1]
22
[1,2,3]
5
[]
0',ARRAY['树','深度优先搜索','广度优先搜索','二叉树']::text[],'{"java":"/**\n * Definition for a binary tree node.\n * public class TreeNode {\n *     int val;\n *     TreeNode left;\n *     TreeNode right;\n *     TreeNode() {}\n *     TreeNode(int val) { this.val = val; }\n *     TreeNode(int val, TreeNode left, TreeNode right) {\n *         this.val = val;\n *         this.left = left;\n *         this.right = right;\n *     }\n * }\n */\nclass Solution {\n    public boolean hasPathSum(TreeNode root, int targetSum) {\n        \n    }\n}"}'::jsonb,'{"java":"import java.io.*;\nimport java.util.*;\n\npublic class Main {\n    public static void main(String[] args) throws Exception {\n        Scanner scanner = new Scanner(System.in);\n        // 每个参数占一行；数组、矩阵等复合参数使用 JSON 外观。\n        // 可用 nextInt()/next() 读取空白分隔数据，或 nextLine() 读取整行。\n        // TODO: 解析输入并输出答案。\n        scanner.close();\n    }\n}\n"}'::jsonb),
('codetop',93,'83',1601,'删除排序链表中的重复元素','remove-duplicates-from-sorted-list','简单',NULL,69,'2026-04-23T07:25:30.367000Z',FALSE,'https://leetcode.cn/problems/remove-duplicates-from-sorted-list/','给定一个已排序的链表的头 head ， 删除所有重复的元素，使每个元素只出现一次 。返回 已排序的链表 。

示例 1：

输入：head = [1,1,2]
输出：[1,2]

示例 2：

输入：head = [1,1,2,3,3]
输出：[1,2,3]

提示：

	• 链表中节点数目在范围 [0, 300] 内

	• -100

	• 题目数据保证链表已经按升序 排列','[{"input":"head = [1,1,2]","output":"[1,2]","explanation":""},{"input":"head = [1,1,2,3,3]","output":"[1,2,3]","explanation":""}]'::jsonb,'[1,1,2]
[1,1,2,3,3]',ARRAY['链表']::text[],'{"java":"/**\n * Definition for singly-linked list.\n * public class ListNode {\n *     int val;\n *     ListNode next;\n *     ListNode() {}\n *     ListNode(int val) { this.val = val; }\n *     ListNode(int val, ListNode next) { this.val = val; this.next = next; }\n * }\n */\nclass Solution {\n    public ListNode deleteDuplicates(ListNode head) {\n        \n    }\n}"}'::jsonb,'{"java":"import java.io.*;\nimport java.util.*;\n\npublic class Main {\n    public static void main(String[] args) throws Exception {\n        Scanner scanner = new Scanner(System.in);\n        // 每个参数占一行；数组、矩阵等复合参数使用 JSON 外观。\n        // 可用 nextInt()/next() 读取空白分隔数据，或 nextLine() 读取整行。\n        // TODO: 解析输入并输出答案。\n        scanner.close();\n    }\n}\n"}'::jsonb),
('codetop',94,'139',1545,'单词拆分','word-break','中等',NULL,69,'2026-04-07T16:00:00Z',TRUE,'https://leetcode.cn/problems/word-break/','给你一个字符串 s 和一个字符串列表 wordDict 作为字典。如果可以利用字典中出现的一个或多个单词拼接出 s 则返回 true。

注意：不要求字典中出现的单词全部都使用，并且字典中的单词可以重复使用。

示例 1：

输入: s = "leetcode", wordDict = ["leet", "code"]
输出: true
解释: 返回 true 因为 "leetcode" 可以由 "leet" 和 "code" 拼接成。

示例 2：

输入: s = "applepenapple", wordDict = ["apple", "pen"]
输出: true
解释: 返回 true 因为 "applepenapple" 可以由 "apple" "pen" "apple" 拼接成。
     注意，你可以重复使用字典中的单词。

示例 3：

输入: s = "catsandog", wordDict = ["cats", "dog", "sand", "and", "cat"]
输出: false

提示：

	• 1

	• 1

	• 1

	• s 和 wordDict[i] 仅由小写英文字母组成

	• wordDict 中的所有字符串 互不相同','[{"input":"s = \"leetcode\", wordDict = [\"leet\", \"code\"]","output":"true","explanation":"返回 true 因为 \"leetcode\" 可以由 \"leet\" 和 \"code\" 拼接成。"},{"input":"s = \"applepenapple\", wordDict = [\"apple\", \"pen\"]","output":"true","explanation":"返回 true 因为 \"applepenapple\" 可以由 \"apple\" \"pen\" \"apple\" 拼接成。\n     注意，你可以重复使用字典中的单词。"},{"input":"s = \"catsandog\", wordDict = [\"cats\", \"dog\", \"sand\", \"and\", \"cat\"]","output":"false","explanation":""}]'::jsonb,'"leetcode"
["leet","code"]
"applepenapple"
["apple","pen"]
"catsandog"
["cats","dog","sand","and","cat"]',ARRAY['字典树','记忆化','数组','哈希表','字符串','动态规划','brute-force-search']::text[],'{"java":"class Solution {\n    public boolean wordBreak(String s, List<String> wordDict) {\n        \n    }\n}"}'::jsonb,'{"java":"import java.io.*;\nimport java.util.*;\n\npublic class Main {\n    public static void main(String[] args) throws Exception {\n        Scanner scanner = new Scanner(System.in);\n        // 每个参数占一行；数组、矩阵等复合参数使用 JSON 外观。\n        // 可用 nextInt()/next() 读取空白分隔数据，或 nextLine() 读取整行。\n        // TODO: 解析输入并输出答案。\n        scanner.close();\n    }\n}\n"}'::jsonb),
('codetop',95,'227',1457,'基本计算器 II','basic-calculator-ii','中等',NULL,69,'2026-03-30T12:10:45.661000Z',FALSE,'https://leetcode.cn/problems/basic-calculator-ii/','给你一个字符串表达式 s ，请你实现一个基本计算器来计算并返回它的值。

整数除法仅保留整数部分。

你可以假设给定的表达式总是有效的。所有中间结果将在 [-231, 231 - 1] 的范围内。

注意：不允许使用任何将字符串作为数学表达式计算的内置函数，比如 eval() 。

示例 1：

输入：s = "3+2*2"
输出：7

示例 2：

输入：s = " 3/2 "
输出：1

示例 3：

输入：s = " 3+5 / 2 "
输出：5

提示：

	• 1 5

	• s 由整数和算符 (''+'', ''-'', ''*'', ''/'') 组成，中间由一些空格隔开

	• s 表示一个有效表达式

	• 表达式中的所有整数都是非负整数，且在范围 [0, 231 - 1] 内

	• 题目数据 保证 答案是一个 32-bit 整数','[{"input":"s = \"3+2*2\"","output":"7","explanation":""},{"input":"s = \" 3/2 \"","output":"1","explanation":""},{"input":"s = \" 3+5 / 2 \"","output":"5","explanation":""}]'::jsonb,'"3+2*2"
" 3/2 "
" 3+5 / 2 "',ARRAY['栈','数学','字符串']::text[],'{"java":"class Solution {\n    public int calculate(String s) {\n        \n    }\n}"}'::jsonb,'{"java":"import java.io.*;\nimport java.util.*;\n\npublic class Main {\n    public static void main(String[] args) throws Exception {\n        Scanner scanner = new Scanner(System.in);\n        // 每个参数占一行；数组、矩阵等复合参数使用 JSON 外观。\n        // 可用 nextInt()/next() 读取空白分隔数据，或 nextLine() 读取整行。\n        // TODO: 解析输入并输出答案。\n        scanner.close();\n    }\n}\n"}'::jsonb),
('codetop',96,'718',999,'最长重复子数组','maximum-length-of-repeated-subarray','中等',NULL,68,'2026-05-26T16:00:00Z',FALSE,'https://leetcode.cn/problems/maximum-length-of-repeated-subarray/','给两个整数数组 nums1 和 nums2 ，返回 两个数组中 公共的 、长度最长的子数组的长度 。

示例 1：

输入：nums1 = [1,2,3,2,1], nums2 = [3,2,1,4,7]
输出：3
解释：长度最长的公共子数组是 [3,2,1] 。

示例 2：

输入：nums1 = [0,0,0,0,0], nums2 = [0,0,0,0,0]
输出：5

提示：

	• 1

	• 0','[{"input":"nums1 = [1,2,3,2,1], nums2 = [3,2,1,4,7]","output":"3","explanation":"长度最长的公共子数组是 [3,2,1] 。"},{"input":"nums1 = [0,0,0,0,0], nums2 = [0,0,0,0,0]","output":"5","explanation":""}]'::jsonb,'[1,2,3,2,1]
[3,2,1,4,7]
[0,0,0,0,0]
[0,0,0,0,0]',ARRAY['数组','二分查找','动态规划','滑动窗口','哈希函数','滚动哈希']::text[],'{"java":"class Solution {\n    public int findLength(int[] nums1, int[] nums2) {\n        \n    }\n}"}'::jsonb,'{"java":"import java.io.*;\nimport java.util.*;\n\npublic class Main {\n    public static void main(String[] args) throws Exception {\n        Scanner scanner = new Scanner(System.in);\n        // 每个参数占一行；数组、矩阵等复合参数使用 JSON 外观。\n        // 可用 nextInt()/next() 读取空白分隔数据，或 nextLine() 读取整行。\n        // TODO: 解析输入并输出答案。\n        scanner.close();\n    }\n}\n"}'::jsonb),
('codetop',97,'226',1458,'翻转二叉树','invert-binary-tree','简单',NULL,68,'2026-03-29T16:00:00Z',TRUE,'https://leetcode.cn/problems/invert-binary-tree/','给你一棵二叉树的根节点 root ，翻转这棵二叉树，并返回其根节点。

示例 1：

输入：root = [4,2,7,1,3,6,9]
输出：[4,7,2,9,6,3,1]

示例 2：

输入：root = [2,1,3]
输出：[2,3,1]

示例 3：

输入：root = []
输出：[]

提示：

	• 树中节点数目范围在 [0, 100] 内

	• -100','[{"input":"root = [4,2,7,1,3,6,9]","output":"[4,7,2,9,6,3,1]","explanation":""},{"input":"root = [2,1,3]","output":"[2,3,1]","explanation":""},{"input":"root = []","output":"[]","explanation":""}]'::jsonb,'[4,2,7,1,3,6,9]
[2,1,3]
[]',ARRAY['树','深度优先搜索','广度优先搜索','二叉树']::text[],'{"java":"/**\n * Definition for a binary tree node.\n * public class TreeNode {\n *     int val;\n *     TreeNode left;\n *     TreeNode right;\n *     TreeNode() {}\n *     TreeNode(int val) { this.val = val; }\n *     TreeNode(int val, TreeNode left, TreeNode right) {\n *         this.val = val;\n *         this.left = left;\n *         this.right = right;\n *     }\n * }\n */\nclass Solution {\n    public TreeNode invertTree(TreeNode root) {\n        \n    }\n}"}'::jsonb,'{"java":"import java.io.*;\nimport java.util.*;\n\npublic class Main {\n    public static void main(String[] args) throws Exception {\n        Scanner scanner = new Scanner(System.in);\n        // 每个参数占一行；数组、矩阵等复合参数使用 JSON 外观。\n        // 可用 nextInt()/next() 读取空白分隔数据，或 nextLine() 读取整行。\n        // TODO: 解析输入并输出答案。\n        scanner.close();\n    }\n}\n"}'::jsonb),
('codetop',98,'169',1515,'多数元素','majority-element','简单',NULL,68,'2026-03-18T16:00:00Z',TRUE,'https://leetcode.cn/problems/majority-element/','给定一个大小为 n 的数组 nums ，返回其中的多数元素。多数元素是指在数组中出现次数 大于 ⌊ n/2 ⌋ 的元素。

你可以假设数组是非空的，并且给定的数组总是存在多数元素。

示例 1：

输入：nums = [3,2,3]
输出：3

示例 2：

输入：nums = [2,2,1,1,1,2,2]
输出：2

提示：

	• n == nums.length

	• 1 4

	• -109 9

	• 输入保证数组中一定有一个多数元素。

进阶：尝试设计时间复杂度为 O(n)、空间复杂度为 O(1) 的算法解决此问题。','[{"input":"nums = [3,2,3]","output":"3","explanation":""},{"input":"nums = [2,2,1,1,1,2,2]","output":"2","explanation":""}]'::jsonb,'[3,2,3]
[2,2,1,1,1,2,2]',ARRAY['数组','哈希表','分治','计数','排序','boyer-moore-majority-vote-algorithm']::text[],'{"java":"class Solution {\n    public int majorityElement(int[] nums) {\n        \n    }\n}"}'::jsonb,'{"java":"import java.io.*;\nimport java.util.*;\n\npublic class Main {\n    public static void main(String[] args) throws Exception {\n        Scanner scanner = new Scanner(System.in);\n        // 每个参数占一行；数组、矩阵等复合参数使用 JSON 外观。\n        // 可用 nextInt()/next() 读取空白分隔数据，或 nextLine() 读取整行。\n        // TODO: 解析输入并输出答案。\n        scanner.close();\n    }\n}\n"}'::jsonb),
('codetop',99,'207',1477,'课程表','course-schedule','中等',NULL,67,'2026-07-08T16:00:00Z',TRUE,'https://leetcode.cn/problems/course-schedule/','你这个学期必须选修 numCourses 门课程，记为 0 到 numCourses - 1 。

在选修某些课程之前需要一些先修课程。 先修课程按数组 prerequisites 给出，其中 prerequisites[i] = [ai, bi] ，表示如果要学习课程 ai 则 必须 先学习课程  bi 。

	• 例如，先修课程对 [0, 1] 表示：想要学习课程 0 ，你需要先完成课程 1 。

请你判断是否可能完成所有课程的学习？如果可以，返回 true ；否则，返回 false 。

示例 1：

输入：numCourses = 2, prerequisites = [[1,0]]
输出：true
解释：总共有 2 门课程。学习课程 1 之前，你需要完成课程 0 。这是可能的。

示例 2：

输入：numCourses = 2, prerequisites = [[1,0],[0,1]]
输出：false
解释：总共有 2 门课程。学习课程 1 之前，你需要先完成​课程 0 ；并且学习课程 0 之前，你还应先完成课程 1 。这是不可能的。

提示：

	• 1

	• 0

	• prerequisites[i].length == 2

	• 0 i, bi

	• prerequisites[i] 中的所有课程对 互不相同','[{"input":"numCourses = 2, prerequisites = [[1,0]]","output":"true","explanation":"总共有 2 门课程。学习课程 1 之前，你需要完成课程 0 。这是可能的。"},{"input":"numCourses = 2, prerequisites = [[1,0],[0,1]]","output":"false","explanation":"总共有 2 门课程。学习课程 1 之前，你需要先完成​课程 0 ；并且学习课程 0 之前，你还应先完成课程 1 。这是不可能的。"}]'::jsonb,'2
[[1,0]]
2
[[1,0],[0,1]]',ARRAY['深度优先搜索','广度优先搜索','图','拓扑排序','directed-acyclic-graph']::text[],'{"java":"class Solution {\n    public boolean canFinish(int numCourses, int[][] prerequisites) {\n        \n    }\n}"}'::jsonb,'{"java":"import java.io.*;\nimport java.util.*;\n\npublic class Main {\n    public static void main(String[] args) throws Exception {\n        Scanner scanner = new Scanner(System.in);\n        // 每个参数占一行；数组、矩阵等复合参数使用 JSON 外观。\n        // 可用 nextInt()/next() 读取空白分隔数据，或 nextLine() 读取整行。\n        // TODO: 解析输入并输出答案。\n        scanner.close();\n    }\n}\n"}'::jsonb),
('codetop',100,'283',1401,'移动零','move-zeroes','简单',NULL,67,'2026-03-23T07:29:58.019000Z',TRUE,'https://leetcode.cn/problems/move-zeroes/','给定一个数组 nums，编写一个函数将所有 0 移动到数组的末尾，同时保持非零元素的相对顺序。

请注意 ，必须在不复制数组的情况下原地对数组进行操作。

示例 1:

输入: nums = [0,1,0,3,12]
输出: [1,3,12,0,0]

示例 2:

输入: nums = [0]
输出: [0]

提示:

	• 1 4

	• -231 31 - 1

进阶：你能尽量减少完成的操作次数吗？','[{"input":"nums = [0,1,0,3,12]","output":"[1,3,12,0,0]","explanation":""},{"input":"nums = [0]","output":"[0]","explanation":""}]'::jsonb,'[0,1,0,3,12]
[0]',ARRAY['数组','双指针']::text[],'{"java":"class Solution {\n    public void moveZeroes(int[] nums) {\n        \n    }\n}"}'::jsonb,'{"java":"import java.io.*;\nimport java.util.*;\n\npublic class Main {\n    public static void main(String[] args) throws Exception {\n        Scanner scanner = new Scanner(System.in);\n        // 每个参数占一行；数组、矩阵等复合参数使用 JSON 外观。\n        // 可用 nextInt()/next() 读取空白分隔数据，或 nextLine() 读取整行。\n        // TODO: 解析输入并输出答案。\n        scanner.close();\n    }\n}\n"}'::jsonb),
('hot100',1,'1',NULL,'两数之和','two-sum','简单','哈希',NULL,NULL,TRUE,'https://leetcode.cn/problems/two-sum/','给定一个整数数组 nums 和一个整数目标值 target，请你在该数组中找出 和为目标值 target  的那 两个 整数，并返回它们的数组下标。

你可以假设每种输入只会对应一个答案，并且你不能使用两次相同的元素。

你可以按任意顺序返回答案。

示例 1：

输入：nums = [2,7,11,15], target = 9
输出：[0,1]
解释：因为 nums[0] + nums[1] == 9 ，返回 [0, 1] 。

示例 2：

输入：nums = [3,2,4], target = 6
输出：[1,2]

示例 3：

输入：nums = [3,3], target = 6
输出：[0,1]

提示：

	• 2 4

	• -109 9

	• -109 9

	• 只会存在一个有效答案

进阶：你可以想出一个时间复杂度小于 O(n2) 的算法吗？','[{"input":"nums = [2,7,11,15], target = 9","output":"[0,1]","explanation":"因为 nums[0] + nums[1] == 9 ，返回 [0, 1] 。"},{"input":"nums = [3,2,4], target = 6","output":"[1,2]","explanation":""},{"input":"nums = [3,3], target = 6","output":"[0,1]","explanation":""}]'::jsonb,'[2,7,11,15]
9
[3,2,4]
6
[3,3]
6',ARRAY['数组','哈希表']::text[],'{"java":"class Solution {\n    public int[] twoSum(int[] nums, int target) {\n        \n    }\n}"}'::jsonb,'{"java":"import java.io.*;\nimport java.util.*;\n\npublic class Main {\n    public static void main(String[] args) throws Exception {\n        Scanner scanner = new Scanner(System.in);\n        // 每个参数占一行；数组、矩阵等复合参数使用 JSON 外观。\n        // 可用 nextInt()/next() 读取空白分隔数据，或 nextLine() 读取整行。\n        // TODO: 解析输入并输出答案。\n        scanner.close();\n    }\n}\n"}'::jsonb),
('hot100',2,'49',NULL,'字母异位词分组','group-anagrams','中等','哈希',NULL,NULL,FALSE,'https://leetcode.cn/problems/group-anagrams/','给你一个字符串数组，请你将 字母异位词 组合在一起。可以按任意顺序返回结果列表。

示例 1:

输入: strs = ["eat", "tea", "tan", "ate", "nat", "bat"]

输出: [["bat"],["nat","tan"],["ate","eat","tea"]]

解释：

	• 在 strs 中没有字符串可以通过重新排列来形成 "bat"。

	• 字符串 "nat" 和 "tan" 是字母异位词，因为它们可以重新排列以形成彼此。

	• 字符串 "ate" ，"eat" 和 "tea" 是字母异位词，因为它们可以重新排列以形成彼此。

示例 2:

输入: strs = [""]

输出: [[""]]

示例 3:

输入: strs = ["a"]

输出: [["a"]]

提示：

	• 1 4

	• 0

	• strs[i] 仅包含小写字母','[{"input":"strs = [\"eat\", \"tea\", \"tan\", \"ate\", \"nat\", \"bat\"]","output":"[[\"bat\"],[\"nat\",\"tan\"],[\"ate\",\"eat\",\"tea\"]]","explanation":"• 在 strs 中没有字符串可以通过重新排列来形成 \"bat\"。\n\n\t• 字符串 \"nat\" 和 \"tan\" 是字母异位词，因为它们可以重新排列以形成彼此。\n\n\t• 字符串 \"ate\" ，\"eat\" 和 \"tea\" 是字母异位词，因为它们可以重新排列以形成彼此。"},{"input":"strs = [\"\"]","output":"[[\"\"]]","explanation":""},{"input":"strs = [\"a\"]","output":"[[\"a\"]]","explanation":""}]'::jsonb,'["eat","tea","tan","ate","nat","bat"]
[""]
["a"]',ARRAY['数组','哈希表','字符串','排序']::text[],'{"java":"class Solution {\n    public List<List<String>> groupAnagrams(String[] strs) {\n        \n    }\n}"}'::jsonb,'{"java":"import java.io.*;\nimport java.util.*;\n\npublic class Main {\n    public static void main(String[] args) throws Exception {\n        Scanner scanner = new Scanner(System.in);\n        // 每个参数占一行；数组、矩阵等复合参数使用 JSON 外观。\n        // 可用 nextInt()/next() 读取空白分隔数据，或 nextLine() 读取整行。\n        // TODO: 解析输入并输出答案。\n        scanner.close();\n    }\n}\n"}'::jsonb),
('hot100',3,'128',NULL,'最长连续序列','longest-consecutive-sequence','中等','哈希',NULL,NULL,TRUE,'https://leetcode.cn/problems/longest-consecutive-sequence/','给定一个未排序的整数数组 nums ，找出数字连续的最长序列（不要求序列元素在原数组中连续）的长度。

请你设计并实现时间复杂度为 O(n) 的算法解决此问题。

示例 1：

输入：nums = [100,4,200,1,3,2]
输出：4
解释：最长数字连续序列是 [1, 2, 3, 4]。它的长度为 4。

示例 2：

输入：nums = [0,3,7,2,5,8,4,6,0,1]
输出：9

示例 3：

输入：nums = [1,0,1,2]
输出：3

提示：

	• 0 5

	• -109 9','[{"input":"nums = [100,4,200,1,3,2]","output":"4","explanation":"最长数字连续序列是 [1, 2, 3, 4]。它的长度为 4。"},{"input":"nums = [0,3,7,2,5,8,4,6,0,1]","output":"9","explanation":""},{"input":"nums = [1,0,1,2]","output":"3","explanation":""}]'::jsonb,'[100,4,200,1,3,2]
[0,3,7,2,5,8,4,6,0,1]
[1,0,1,2]',ARRAY['并查集','数组','哈希表']::text[],'{"java":"class Solution {\n    public int longestConsecutive(int[] nums) {\n        \n    }\n}"}'::jsonb,'{"java":"import java.io.*;\nimport java.util.*;\n\npublic class Main {\n    public static void main(String[] args) throws Exception {\n        Scanner scanner = new Scanner(System.in);\n        // 每个参数占一行；数组、矩阵等复合参数使用 JSON 外观。\n        // 可用 nextInt()/next() 读取空白分隔数据，或 nextLine() 读取整行。\n        // TODO: 解析输入并输出答案。\n        scanner.close();\n    }\n}\n"}'::jsonb),
('hot100',4,'283',NULL,'移动零','move-zeroes','简单','双指针',NULL,NULL,TRUE,'https://leetcode.cn/problems/move-zeroes/','给定一个数组 nums，编写一个函数将所有 0 移动到数组的末尾，同时保持非零元素的相对顺序。

请注意 ，必须在不复制数组的情况下原地对数组进行操作。

示例 1:

输入: nums = [0,1,0,3,12]
输出: [1,3,12,0,0]

示例 2:

输入: nums = [0]
输出: [0]

提示:

	• 1 4

	• -231 31 - 1

进阶：你能尽量减少完成的操作次数吗？','[{"input":"nums = [0,1,0,3,12]","output":"[1,3,12,0,0]","explanation":""},{"input":"nums = [0]","output":"[0]","explanation":""}]'::jsonb,'[0,1,0,3,12]
[0]',ARRAY['数组','双指针']::text[],'{"java":"class Solution {\n    public void moveZeroes(int[] nums) {\n        \n    }\n}"}'::jsonb,'{"java":"import java.io.*;\nimport java.util.*;\n\npublic class Main {\n    public static void main(String[] args) throws Exception {\n        Scanner scanner = new Scanner(System.in);\n        // 每个参数占一行；数组、矩阵等复合参数使用 JSON 外观。\n        // 可用 nextInt()/next() 读取空白分隔数据，或 nextLine() 读取整行。\n        // TODO: 解析输入并输出答案。\n        scanner.close();\n    }\n}\n"}'::jsonb),
('hot100',5,'11',NULL,'盛最多水的容器','container-with-most-water','中等','双指针',NULL,NULL,FALSE,'https://leetcode.cn/problems/container-with-most-water/','给定一个长度为 n 的整数数组 height 。有 n 条垂线，第 i 条线的两个端点是 (i, 0) 和 (i, height[i]) 。

找出其中的两条线，使得它们与 x 轴共同构成的容器可以容纳最多的水。

返回容器可以储存的最大水量。

说明：你不能倾斜容器。

示例 1：

输入：[1,8,6,2,5,4,8,3,7]
输出：49
解释：图中垂直线代表输入数组 [1,8,6,2,5,4,8,3,7]。在此情况下，容器能够容纳水（表示为蓝色部分）的最大值为 49。

示例 2：

输入：height = [1,1]
输出：1

提示：

	• n == height.length

	• 2 5

	• 0 4','[{"input":"[1,8,6,2,5,4,8,3,7]","output":"49","explanation":"图中垂直线代表输入数组 [1,8,6,2,5,4,8,3,7]。在此情况下，容器能够容纳水（表示为蓝色部分）的最大值为 49。"},{"input":"height = [1,1]","output":"1","explanation":""}]'::jsonb,'[1,8,6,2,5,4,8,3,7]
[1,1]',ARRAY['贪心','数组','双指针']::text[],'{"java":"class Solution {\n    public int maxArea(int[] height) {\n        \n    }\n}"}'::jsonb,'{"java":"import java.io.*;\nimport java.util.*;\n\npublic class Main {\n    public static void main(String[] args) throws Exception {\n        Scanner scanner = new Scanner(System.in);\n        // 每个参数占一行；数组、矩阵等复合参数使用 JSON 外观。\n        // 可用 nextInt()/next() 读取空白分隔数据，或 nextLine() 读取整行。\n        // TODO: 解析输入并输出答案。\n        scanner.close();\n    }\n}\n"}'::jsonb),
('hot100',6,'15',NULL,'三数之和','3sum','中等','双指针',NULL,NULL,TRUE,'https://leetcode.cn/problems/3sum/','给你一个整数数组 nums ，判断是否存在三元组 [nums[i], nums[j], nums[k]] 满足 i != j、i != k 且 j != k ，同时还满足 nums[i] + nums[j] + nums[k] == 0 。请你返回所有和为 0 且不重复的三元组。

注意：答案中不可以包含重复的三元组。

示例 1：

输入：nums = [-1,0,1,2,-1,-4]
输出：[[-1,-1,2],[-1,0,1]]
解释：
nums[0] + nums[1] + nums[2] = (-1) + 0 + 1 = 0 。
nums[1] + nums[2] + nums[4] = 0 + 1 + (-1) = 0 。
nums[0] + nums[3] + nums[4] = (-1) + 2 + (-1) = 0 。
不同的三元组是 [-1,0,1] 和 [-1,-1,2] 。
注意，输出的顺序和三元组的顺序并不重要。

示例 2：

输入：nums = [0,1,1]
输出：[]
解释：唯一可能的三元组和不为 0 。

示例 3：

输入：nums = [0,0,0]
输出：[[0,0,0]]
解释：唯一可能的三元组和为 0 。

提示：

	• 3

	• -105 5','[{"input":"nums = [-1,0,1,2,-1,-4]","output":"[[-1,-1,2],[-1,0,1]]","explanation":"nums[0] + nums[1] + nums[2] = (-1) + 0 + 1 = 0 。\nnums[1] + nums[2] + nums[4] = 0 + 1 + (-1) = 0 。\nnums[0] + nums[3] + nums[4] = (-1) + 2 + (-1) = 0 。\n不同的三元组是 [-1,0,1] 和 [-1,-1,2] 。\n注意，输出的顺序和三元组的顺序并不重要。"},{"input":"nums = [0,1,1]","output":"[]","explanation":"唯一可能的三元组和不为 0 。"},{"input":"nums = [0,0,0]","output":"[[0,0,0]]","explanation":"唯一可能的三元组和为 0 。"}]'::jsonb,'[-1,0,1,2,-1,-4]
[0,1,1]
[0,0,0]',ARRAY['数组','双指针','排序']::text[],'{"java":"class Solution {\n    public List<List<Integer>> threeSum(int[] nums) {\n        \n    }\n}"}'::jsonb,'{"java":"import java.io.*;\nimport java.util.*;\n\npublic class Main {\n    public static void main(String[] args) throws Exception {\n        Scanner scanner = new Scanner(System.in);\n        // 每个参数占一行；数组、矩阵等复合参数使用 JSON 外观。\n        // 可用 nextInt()/next() 读取空白分隔数据，或 nextLine() 读取整行。\n        // TODO: 解析输入并输出答案。\n        scanner.close();\n    }\n}\n"}'::jsonb),
('hot100',7,'42',NULL,'接雨水','trapping-rain-water','困难','双指针',NULL,NULL,TRUE,'https://leetcode.cn/problems/trapping-rain-water/','给定 n 个非负整数表示每个宽度为 1 的柱子的高度图，计算按此排列的柱子，下雨之后能接多少雨水。

示例 1：

输入：height = [0,1,0,2,1,0,1,3,2,1,2,1]
输出：6
解释：上面是由数组 [0,1,0,2,1,0,1,3,2,1,2,1] 表示的高度图，在这种情况下，可以接 6 个单位的雨水（蓝色部分表示雨水）。

示例 2：

输入：height = [4,2,0,3,2,5]
输出：9

提示：

	• n == height.length

	• 1 4

	• 0 5','[{"input":"height = [0,1,0,2,1,0,1,3,2,1,2,1]","output":"6","explanation":"上面是由数组 [0,1,0,2,1,0,1,3,2,1,2,1] 表示的高度图，在这种情况下，可以接 6 个单位的雨水（蓝色部分表示雨水）。"},{"input":"height = [4,2,0,3,2,5]","output":"9","explanation":""}]'::jsonb,'[0,1,0,2,1,0,1,3,2,1,2,1]
[4,2,0,3,2,5]',ARRAY['栈','数组','双指针','动态规划','单调栈']::text[],'{"java":"class Solution {\n    public int trap(int[] height) {\n        \n    }\n}"}'::jsonb,'{"java":"import java.io.*;\nimport java.util.*;\n\npublic class Main {\n    public static void main(String[] args) throws Exception {\n        Scanner scanner = new Scanner(System.in);\n        // 每个参数占一行；数组、矩阵等复合参数使用 JSON 外观。\n        // 可用 nextInt()/next() 读取空白分隔数据，或 nextLine() 读取整行。\n        // TODO: 解析输入并输出答案。\n        scanner.close();\n    }\n}\n"}'::jsonb),
('hot100',8,'3',NULL,'无重复字符的最长子串','longest-substring-without-repeating-characters','中等','滑动窗口',NULL,NULL,TRUE,'https://leetcode.cn/problems/longest-substring-without-repeating-characters/','给定一个字符串 s ，请你找出其中不含有重复字符的 最长 子串 的长度。

示例 1:

输入: s = "abcabcbb"
输出: 3
解释: 因为无重复字符的最长子串是 "abc"，所以其长度为 3。注意 "bca" 和 "cab" 也是正确答案。

示例 2:

输入: s = "bbbbb"
输出: 1
解释: 因为无重复字符的最长子串是 "b"，所以其长度为 1。

示例 3:

输入: s = "pwwkew"
输出: 3
解释: 因为无重复字符的最长子串是 "wke"，所以其长度为 3。
     请注意，你的答案必须是 子串 的长度，"pwke" 是一个子序列，不是子串。

提示：

	• 0 5

	• s 由英文字母、数字、符号和空格组成','[{"input":"s = \"abcabcbb\"","output":"3","explanation":"因为无重复字符的最长子串是 \"abc\"，所以其长度为 3。注意 \"bca\" 和 \"cab\" 也是正确答案。"},{"input":"s = \"bbbbb\"","output":"1","explanation":"因为无重复字符的最长子串是 \"b\"，所以其长度为 1。"},{"input":"s = \"pwwkew\"","output":"3","explanation":"因为无重复字符的最长子串是 \"wke\"，所以其长度为 3。\n     请注意，你的答案必须是 子串 的长度，\"pwke\" 是一个子序列，不是子串。"}]'::jsonb,'"abcabcbb"
"bbbbb"
"pwwkew"',ARRAY['哈希表','字符串','滑动窗口']::text[],'{"java":"class Solution {\n    public int lengthOfLongestSubstring(String s) {\n        \n    }\n}"}'::jsonb,'{"java":"import java.io.*;\nimport java.util.*;\n\npublic class Main {\n    public static void main(String[] args) throws Exception {\n        Scanner scanner = new Scanner(System.in);\n        // 每个参数占一行；数组、矩阵等复合参数使用 JSON 外观。\n        // 可用 nextInt()/next() 读取空白分隔数据，或 nextLine() 读取整行。\n        // TODO: 解析输入并输出答案。\n        scanner.close();\n    }\n}\n"}'::jsonb),
('hot100',9,'438',NULL,'找到字符串中所有字母异位词','find-all-anagrams-in-a-string','中等','滑动窗口',NULL,NULL,FALSE,'https://leetcode.cn/problems/find-all-anagrams-in-a-string/','给定两个字符串 s 和 p，找到 s 中所有 p 的 异位词 的子串，返回这些子串的起始索引。不考虑答案输出的顺序。

示例 1:

输入: s = "cbaebabacd", p = "abc"
输出: [0,6]
解释:
起始索引等于 0 的子串是 "cba", 它是 "abc" 的异位词。
起始索引等于 6 的子串是 "bac", 它是 "abc" 的异位词。

 示例 2:

输入: s = "abab", p = "ab"
输出: [0,1,2]
解释:
起始索引等于 0 的子串是 "ab", 它是 "ab" 的异位词。
起始索引等于 1 的子串是 "ba", 它是 "ab" 的异位词。
起始索引等于 2 的子串是 "ab", 它是 "ab" 的异位词。

提示:

	• 1 4

	• s 和 p 仅包含小写字母','[{"input":"s = \"cbaebabacd\", p = \"abc\"","output":"[0,6]","explanation":"起始索引等于 0 的子串是 \"cba\", 它是 \"abc\" 的异位词。\n起始索引等于 6 的子串是 \"bac\", 它是 \"abc\" 的异位词。"},{"input":"s = \"abab\", p = \"ab\"","output":"[0,1,2]","explanation":"起始索引等于 0 的子串是 \"ab\", 它是 \"ab\" 的异位词。\n起始索引等于 1 的子串是 \"ba\", 它是 \"ab\" 的异位词。\n起始索引等于 2 的子串是 \"ab\", 它是 \"ab\" 的异位词。"}]'::jsonb,'"cbaebabacd"
"abc"
"abab"
"ab"',ARRAY['哈希表','字符串','滑动窗口']::text[],'{"java":"class Solution {\n    public List<Integer> findAnagrams(String s, String p) {\n        \n    }\n}"}'::jsonb,'{"java":"import java.io.*;\nimport java.util.*;\n\npublic class Main {\n    public static void main(String[] args) throws Exception {\n        Scanner scanner = new Scanner(System.in);\n        // 每个参数占一行；数组、矩阵等复合参数使用 JSON 外观。\n        // 可用 nextInt()/next() 读取空白分隔数据，或 nextLine() 读取整行。\n        // TODO: 解析输入并输出答案。\n        scanner.close();\n    }\n}\n"}'::jsonb),
('hot100',10,'560',NULL,'和为 K 的子数组','subarray-sum-equals-k','中等','子串',NULL,NULL,TRUE,'https://leetcode.cn/problems/subarray-sum-equals-k/','给你一个整数数组 nums 和一个整数 k ，请你统计并返回 该数组中和为 k 的子数组的个数 。

子数组是数组中元素的连续非空序列。

示例 1：

输入：nums = [1,1,1], k = 2
输出：2

示例 2：

输入：nums = [1,2,3], k = 3
输出：2

提示：

	• 1 4

	• -1000

	• -107 7','[{"input":"nums = [1,1,1], k = 2","output":"2","explanation":""},{"input":"nums = [1,2,3], k = 3","output":"2","explanation":""}]'::jsonb,'[1,1,1]
2
[1,2,3]
3',ARRAY['数组','哈希表','前缀和']::text[],'{"java":"class Solution {\n    public int subarraySum(int[] nums, int k) {\n        \n    }\n}"}'::jsonb,'{"java":"import java.io.*;\nimport java.util.*;\n\npublic class Main {\n    public static void main(String[] args) throws Exception {\n        Scanner scanner = new Scanner(System.in);\n        // 每个参数占一行；数组、矩阵等复合参数使用 JSON 外观。\n        // 可用 nextInt()/next() 读取空白分隔数据，或 nextLine() 读取整行。\n        // TODO: 解析输入并输出答案。\n        scanner.close();\n    }\n}\n"}'::jsonb),
('hot100',11,'239',NULL,'滑动窗口最大值','sliding-window-maximum','困难','子串',NULL,NULL,TRUE,'https://leetcode.cn/problems/sliding-window-maximum/','给你一个整数数组 nums，有一个大小为 k 的滑动窗口从数组的最左侧移动到数组的最右侧。你只可以看到在滑动窗口内的 k 个数字。滑动窗口每次只向右移动一位。

返回 滑动窗口中的最大值 。

示例 1：

输入：nums = [1,3,-1,-3,5,3,6,7], k = 3
输出：[3,3,5,5,6,7]
解释：
滑动窗口的位置                最大值
---------------               -----
[1  3  -1] -3  5  3  6  7       3
 1 [3  -1  -3] 5  3  6  7       3
 1  3 [-1  -3  5] 3  6  7       5
 1  3  -1 [-3  5  3] 6  7       5
 1  3  -1  -3 [5  3  6] 7       6
 1  3  -1  -3  5 [3  6  7]      7

示例 2：

输入：nums = [1], k = 1
输出：[1]

提示：

	• 1 5

	• -104 4

	• 1','[{"input":"nums = [1,3,-1,-3,5,3,6,7], k = 3","output":"[3,3,5,5,6,7]","explanation":"滑动窗口的位置                最大值\n---------------               -----\n[1  3  -1] -3  5  3  6  7       3\n 1 [3  -1  -3] 5  3  6  7       3\n 1  3 [-1  -3  5] 3  6  7       5\n 1  3  -1 [-3  5  3] 6  7       5\n 1  3  -1  -3 [5  3  6] 7       6\n 1  3  -1  -3  5 [3  6  7]      7"},{"input":"nums = [1], k = 1","output":"[1]","explanation":""}]'::jsonb,'[1,3,-1,-3,5,3,6,7]
3
[1]
1',ARRAY['队列','数组','滑动窗口','单调队列','堆（优先队列）','range-minimum-maximum-query']::text[],'{"java":"class Solution {\n    public int[] maxSlidingWindow(int[] nums, int k) {\n        \n    }\n}"}'::jsonb,'{"java":"import java.io.*;\nimport java.util.*;\n\npublic class Main {\n    public static void main(String[] args) throws Exception {\n        Scanner scanner = new Scanner(System.in);\n        // 每个参数占一行；数组、矩阵等复合参数使用 JSON 外观。\n        // 可用 nextInt()/next() 读取空白分隔数据，或 nextLine() 读取整行。\n        // TODO: 解析输入并输出答案。\n        scanner.close();\n    }\n}\n"}'::jsonb),
('hot100',12,'76',NULL,'最小覆盖子串','minimum-window-substring','困难','子串',NULL,NULL,TRUE,'https://leetcode.cn/problems/minimum-window-substring/','给定两个字符串 s 和 t，长度分别是 m 和 n，返回 s 中的 最短窗口 子串，使得该子串包含 t 中的每一个字符（包括重复字符）。如果没有这样的子串，返回空字符串 ""。

测试用例保证答案唯一。

示例 1：

输入：s = "ADOBECODEBANC", t = "ABC"
输出："BANC"
解释：最小覆盖子串 "BANC" 包含来自字符串 t 的 ''A''、''B'' 和 ''C''。

示例 2：

输入：s = "a", t = "a"
输出："a"
解释：整个字符串 s 是最小覆盖子串。

示例 3:

输入: s = "a", t = "aa"
输出: ""
解释: t 中两个字符 ''a'' 均应包含在 s 的子串中，
因此没有符合条件的子字符串，返回空字符串。

提示：

	• m == s.length

	• n == t.length

	• 1 5

	• s 和 t 由英文字母组成

进阶：你能设计一个在 O(m + n) 时间内解决此问题的算法吗？','[{"input":"s = \"ADOBECODEBANC\", t = \"ABC\"","output":"\"BANC\"","explanation":"最小覆盖子串 \"BANC\" 包含来自字符串 t 的 ''A''、''B'' 和 ''C''。"},{"input":"s = \"a\", t = \"a\"","output":"\"a\"","explanation":"整个字符串 s 是最小覆盖子串。"},{"input":"s = \"a\", t = \"aa\"","output":"\"\"","explanation":"t 中两个字符 ''a'' 均应包含在 s 的子串中，\n因此没有符合条件的子字符串，返回空字符串。"}]'::jsonb,'"ADOBECODEBANC"
"ABC"
"a"
"a"
"a"
"aa"',ARRAY['哈希表','字符串','滑动窗口']::text[],'{"java":"class Solution {\n    public String minWindow(String s, String t) {\n        \n    }\n}"}'::jsonb,'{"java":"import java.io.*;\nimport java.util.*;\n\npublic class Main {\n    public static void main(String[] args) throws Exception {\n        Scanner scanner = new Scanner(System.in);\n        // 每个参数占一行；数组、矩阵等复合参数使用 JSON 外观。\n        // 可用 nextInt()/next() 读取空白分隔数据，或 nextLine() 读取整行。\n        // TODO: 解析输入并输出答案。\n        scanner.close();\n    }\n}\n"}'::jsonb),
('hot100',13,'53',NULL,'最大子数组和','maximum-subarray','中等','普通数组',NULL,NULL,TRUE,'https://leetcode.cn/problems/maximum-subarray/','给你一个整数数组 nums ，请你找出一个具有最大和的连续子数组（子数组最少包含一个元素），返回其最大和。

子数组 是数组中的一个连续部分。

示例 1：

输入：nums = [-2,1,-3,4,-1,2,1,-5,4]
输出：6
解释：连续子数组 [4,-1,2,1] 的和最大，为 6 。

示例 2：

输入：nums = [1]
输出：1

示例 3：

输入：nums = [5,4,-1,7,8]
输出：23

提示：

	• 1 5

	• -104 4

进阶：如果你已经实现复杂度为 O(n) 的解法，尝试使用更为精妙的 分治法 求解。','[{"input":"nums = [-2,1,-3,4,-1,2,1,-5,4]","output":"6","explanation":"连续子数组 [4,-1,2,1] 的和最大，为 6 。"},{"input":"nums = [1]","output":"1","explanation":""},{"input":"nums = [5,4,-1,7,8]","output":"23","explanation":""}]'::jsonb,'[-2,1,-3,4,-1,2,1,-5,4]
[1]
[5,4,-1,7,8]',ARRAY['数组','分治','动态规划']::text[],'{"java":"class Solution {\n    public int maxSubArray(int[] nums) {\n        \n    }\n}"}'::jsonb,'{"java":"import java.io.*;\nimport java.util.*;\n\npublic class Main {\n    public static void main(String[] args) throws Exception {\n        Scanner scanner = new Scanner(System.in);\n        // 每个参数占一行；数组、矩阵等复合参数使用 JSON 外观。\n        // 可用 nextInt()/next() 读取空白分隔数据，或 nextLine() 读取整行。\n        // TODO: 解析输入并输出答案。\n        scanner.close();\n    }\n}\n"}'::jsonb),
('hot100',14,'56',NULL,'合并区间','merge-intervals','中等','普通数组',NULL,NULL,TRUE,'https://leetcode.cn/problems/merge-intervals/','以数组 intervals 表示若干个区间的集合，其中单个区间为 intervals[i] = [starti, endi] 。请你合并所有重叠的区间，并返回 一个不重叠的区间数组，该数组需恰好覆盖输入中的所有区间 。

示例 1：

输入：intervals = [[1,3],[2,6],[8,10],[15,18]]
输出：[[1,6],[8,10],[15,18]]
解释：区间 [1,3] 和 [2,6] 重叠, 将它们合并为 [1,6].

示例 2：

输入：intervals = [[1,4],[4,5]]
输出：[[1,5]]
解释：区间 [1,4] 和 [4,5] 可被视为重叠区间。

示例 3：

输入：intervals = [[4,7],[1,4]]
输出：[[1,7]]
解释：区间 [1,4] 和 [4,7] 可被视为重叠区间。

提示：

	• 1 4

	• intervals[i].length == 2

	• 0 i i 4','[{"input":"intervals = [[1,3],[2,6],[8,10],[15,18]]","output":"[[1,6],[8,10],[15,18]]","explanation":"区间 [1,3] 和 [2,6] 重叠, 将它们合并为 [1,6]."},{"input":"intervals = [[1,4],[4,5]]","output":"[[1,5]]","explanation":"区间 [1,4] 和 [4,5] 可被视为重叠区间。"},{"input":"intervals = [[4,7],[1,4]]","output":"[[1,7]]","explanation":"区间 [1,4] 和 [4,7] 可被视为重叠区间。"}]'::jsonb,'[[1,3],[2,6],[8,10],[15,18]]
[[1,4],[4,5]]
[[4,7],[1,4]]',ARRAY['数组','排序','quicksort']::text[],'{"java":"class Solution {\n    public int[][] merge(int[][] intervals) {\n        \n    }\n}"}'::jsonb,'{"java":"import java.io.*;\nimport java.util.*;\n\npublic class Main {\n    public static void main(String[] args) throws Exception {\n        Scanner scanner = new Scanner(System.in);\n        // 每个参数占一行；数组、矩阵等复合参数使用 JSON 外观。\n        // 可用 nextInt()/next() 读取空白分隔数据，或 nextLine() 读取整行。\n        // TODO: 解析输入并输出答案。\n        scanner.close();\n    }\n}\n"}'::jsonb),
('hot100',15,'189',NULL,'轮转数组','rotate-array','中等','普通数组',NULL,NULL,FALSE,'https://leetcode.cn/problems/rotate-array/','给定一个整数数组 nums，将数组中的元素向右轮转 k 个位置，其中 k 是非负数。

示例 1:

输入: nums = [1,2,3,4,5,6,7], k = 3
输出: [5,6,7,1,2,3,4]
解释:
向右轮转 1 步: [7,1,2,3,4,5,6]
向右轮转 2 步: [6,7,1,2,3,4,5]
向右轮转 3 步: [5,6,7,1,2,3,4]

示例 2:

输入：nums = [-1,-100,3,99], k = 2
输出：[3,99,-1,-100]
解释:
向右轮转 1 步: [99,-1,-100,3]
向右轮转 2 步: [3,99,-1,-100]

提示：

	• 1 5

	• -231 31 - 1

	• 0 5

进阶：

	• 尽可能想出更多的解决方案，至少有 三种 不同的方法可以解决这个问题。

	• 你可以使用空间复杂度为 O(1) 的 原地 算法解决这个问题吗？','[{"input":"nums = [1,2,3,4,5,6,7], k = 3","output":"[5,6,7,1,2,3,4]","explanation":"向右轮转 1 步: [7,1,2,3,4,5,6]\n向右轮转 2 步: [6,7,1,2,3,4,5]\n向右轮转 3 步: [5,6,7,1,2,3,4]"},{"input":"nums = [-1,-100,3,99], k = 2","output":"[3,99,-1,-100]","explanation":"向右轮转 1 步: [99,-1,-100,3]\n向右轮转 2 步: [3,99,-1,-100]"}]'::jsonb,'[1,2,3,4,5,6,7]
3
[-1,-100,3,99]
2',ARRAY['数组','数学','双指针']::text[],'{"java":"class Solution {\n    public void rotate(int[] nums, int k) {\n        \n    }\n}"}'::jsonb,'{"java":"import java.io.*;\nimport java.util.*;\n\npublic class Main {\n    public static void main(String[] args) throws Exception {\n        Scanner scanner = new Scanner(System.in);\n        // 每个参数占一行；数组、矩阵等复合参数使用 JSON 外观。\n        // 可用 nextInt()/next() 读取空白分隔数据，或 nextLine() 读取整行。\n        // TODO: 解析输入并输出答案。\n        scanner.close();\n    }\n}\n"}'::jsonb),
('hot100',16,'238',NULL,'除了自身以外数组的乘积','product-of-array-except-self','中等','普通数组',NULL,NULL,FALSE,'https://leetcode.cn/problems/product-of-array-except-self/','给你一个整数数组 nums，返回 数组 answer ，其中 answer[i] 等于 nums 中除了 nums[i] 之外其余各元素的乘积 。

题目数据 保证 数组 nums之中任意元素的全部前缀元素和后缀的乘积都在  32 位 整数范围内。

请 不要使用除法，且在 O(n) 时间复杂度内完成此题。

示例 1:

输入: nums = [1,2,3,4]
输出: [24,12,8,6]

示例 2:

输入: nums = [-1,1,0,-3,3]
输出: [0,0,9,0,0]

提示：

	• 2 5

	• -30

	• 输入 保证 数组 answer[i] 在  32 位 整数范围内

进阶：你可以在 O(1) 的额外空间复杂度内完成这个题目吗？（ 出于对空间复杂度分析的目的，输出数组 不被视为 额外空间。）','[{"input":"nums = [1,2,3,4]","output":"[24,12,8,6]","explanation":""},{"input":"nums = [-1,1,0,-3,3]","output":"[0,0,9,0,0]","explanation":""}]'::jsonb,'[1,2,3,4]
[-1,1,0,-3,3]',ARRAY['数组','前缀和']::text[],'{"java":"class Solution {\n    public int[] productExceptSelf(int[] nums) {\n        \n    }\n}"}'::jsonb,'{"java":"import java.io.*;\nimport java.util.*;\n\npublic class Main {\n    public static void main(String[] args) throws Exception {\n        Scanner scanner = new Scanner(System.in);\n        // 每个参数占一行；数组、矩阵等复合参数使用 JSON 外观。\n        // 可用 nextInt()/next() 读取空白分隔数据，或 nextLine() 读取整行。\n        // TODO: 解析输入并输出答案。\n        scanner.close();\n    }\n}\n"}'::jsonb),
('hot100',17,'41',NULL,'缺失的第一个正数','first-missing-positive','困难','普通数组',NULL,NULL,TRUE,'https://leetcode.cn/problems/first-missing-positive/','给你一个未排序的整数数组 nums ，请你找出其中没有出现的最小的正整数。

请你实现时间复杂度为 O(n) 并且只使用常数级别额外空间的解决方案。

示例 1：

输入：nums = [1,2,0]
输出：3
解释：范围 [1,2] 中的数字都在数组中。

示例 2：

输入：nums = [3,4,-1,1]
输出：2
解释：1 在数组中，但 2 没有。

示例 3：

输入：nums = [7,8,9,11,12]
输出：1
解释：最小的正数 1 没有出现。

提示：

	• 1 5

	• -231 31 - 1','[{"input":"nums = [1,2,0]","output":"3","explanation":"范围 [1,2] 中的数字都在数组中。"},{"input":"nums = [3,4,-1,1]","output":"2","explanation":"1 在数组中，但 2 没有。"},{"input":"nums = [7,8,9,11,12]","output":"1","explanation":"最小的正数 1 没有出现。"}]'::jsonb,'[1,2,0]
[3,4,-1,1]
[7,8,9,11,12]',ARRAY['数组','哈希表']::text[],'{"java":"class Solution {\n    public int firstMissingPositive(int[] nums) {\n        \n    }\n}"}'::jsonb,'{"java":"import java.io.*;\nimport java.util.*;\n\npublic class Main {\n    public static void main(String[] args) throws Exception {\n        Scanner scanner = new Scanner(System.in);\n        // 每个参数占一行；数组、矩阵等复合参数使用 JSON 外观。\n        // 可用 nextInt()/next() 读取空白分隔数据，或 nextLine() 读取整行。\n        // TODO: 解析输入并输出答案。\n        scanner.close();\n    }\n}\n"}'::jsonb),
('hot100',18,'73',NULL,'矩阵置零','set-matrix-zeroes','中等','矩阵',NULL,NULL,FALSE,'https://leetcode.cn/problems/set-matrix-zeroes/','给定一个 m x n 的矩阵，如果一个元素为 0 ，则将其所在行和列的所有元素都设为 0 。请使用 原地 算法。

示例 1：

输入：matrix = [[1,1,1],[1,0,1],[1,1,1]]
输出：[[1,0,1],[0,0,0],[1,0,1]]

示例 2：

输入：matrix = [[0,1,2,0],[3,4,5,2],[1,3,1,5]]
输出：[[0,0,0,0],[0,4,5,0],[0,3,1,0]]

提示：

	• m == matrix.length

	• n == matrix[0].length

	• 1

	• -231 31 - 1

进阶：

	• 一个直观的解决方案是使用  O(mn) 的额外空间，但这并不是一个好的解决方案。

	• 一个简单的改进方案是使用 O(m + n) 的额外空间，但这仍然不是最好的解决方案。

	• 你能想出一个仅使用常量空间的解决方案吗？','[{"input":"matrix = [[1,1,1],[1,0,1],[1,1,1]]","output":"[[1,0,1],[0,0,0],[1,0,1]]","explanation":""},{"input":"matrix = [[0,1,2,0],[3,4,5,2],[1,3,1,5]]","output":"[[0,0,0,0],[0,4,5,0],[0,3,1,0]]","explanation":""}]'::jsonb,'[[1,1,1],[1,0,1],[1,1,1]]
[[0,1,2,0],[3,4,5,2],[1,3,1,5]]',ARRAY['数组','哈希表','矩阵']::text[],'{"java":"class Solution {\n    public void setZeroes(int[][] matrix) {\n        \n    }\n}"}'::jsonb,'{"java":"import java.io.*;\nimport java.util.*;\n\npublic class Main {\n    public static void main(String[] args) throws Exception {\n        Scanner scanner = new Scanner(System.in);\n        // 每个参数占一行；数组、矩阵等复合参数使用 JSON 外观。\n        // 可用 nextInt()/next() 读取空白分隔数据，或 nextLine() 读取整行。\n        // TODO: 解析输入并输出答案。\n        scanner.close();\n    }\n}\n"}'::jsonb),
('hot100',19,'54',NULL,'螺旋矩阵','spiral-matrix','中等','矩阵',NULL,NULL,TRUE,'https://leetcode.cn/problems/spiral-matrix/','给你一个 m 行 n 列的矩阵 matrix ，请按照 顺时针螺旋顺序 ，返回矩阵中的所有元素。

 

示例 1：

输入：matrix = [[1,2,3],[4,5,6],[7,8,9]]
输出：[1,2,3,6,9,8,7,4,5]

示例 2：

输入：matrix = [[1,2,3,4],[5,6,7,8],[9,10,11,12]]
输出：[1,2,3,4,8,12,11,10,9,5,6,7]

 

提示：

	• m == matrix.length

	• n == matrix[i].length

	• 1

	• -100','[{"input":"matrix = [[1,2,3],[4,5,6],[7,8,9]]","output":"[1,2,3,6,9,8,7,4,5]","explanation":""},{"input":"matrix = [[1,2,3,4],[5,6,7,8],[9,10,11,12]]","output":"[1,2,3,4,8,12,11,10,9,5,6,7]","explanation":""}]'::jsonb,'[[1,2,3],[4,5,6],[7,8,9]]
[[1,2,3,4],[5,6,7,8],[9,10,11,12]]',ARRAY['数组','矩阵','模拟']::text[],'{"java":"class Solution {\n    public List<Integer> spiralOrder(int[][] matrix) {\n        \n    }\n}"}'::jsonb,'{"java":"import java.io.*;\nimport java.util.*;\n\npublic class Main {\n    public static void main(String[] args) throws Exception {\n        Scanner scanner = new Scanner(System.in);\n        // 每个参数占一行；数组、矩阵等复合参数使用 JSON 外观。\n        // 可用 nextInt()/next() 读取空白分隔数据，或 nextLine() 读取整行。\n        // TODO: 解析输入并输出答案。\n        scanner.close();\n    }\n}\n"}'::jsonb),
('hot100',20,'48',NULL,'旋转图像','rotate-image','中等','矩阵',NULL,NULL,TRUE,'https://leetcode.cn/problems/rotate-image/','给定一个 n × n 的二维矩阵 matrix 表示一个图像。请你将图像顺时针旋转 90 度。

你必须在 原地 旋转图像，这意味着你需要直接修改输入的二维矩阵。请不要 使用另一个矩阵来旋转图像。

示例 1：

输入：matrix = [[1,2,3],[4,5,6],[7,8,9]]
输出：[[7,4,1],[8,5,2],[9,6,3]]

示例 2：

输入：matrix = [[5,1,9,11],[2,4,8,10],[13,3,6,7],[15,14,12,16]]
输出：[[15,13,2,5],[14,3,4,1],[12,6,8,9],[16,7,10,11]]

提示：

	• n == matrix.length == matrix[i].length

	• 1

	• -1000','[{"input":"matrix = [[1,2,3],[4,5,6],[7,8,9]]","output":"[[7,4,1],[8,5,2],[9,6,3]]","explanation":""},{"input":"matrix = [[5,1,9,11],[2,4,8,10],[13,3,6,7],[15,14,12,16]]","output":"[[15,13,2,5],[14,3,4,1],[12,6,8,9],[16,7,10,11]]","explanation":""}]'::jsonb,'[[1,2,3],[4,5,6],[7,8,9]]
[[5,1,9,11],[2,4,8,10],[13,3,6,7],[15,14,12,16]]',ARRAY['数组','数学','矩阵']::text[],'{"java":"class Solution {\n    public void rotate(int[][] matrix) {\n        \n    }\n}"}'::jsonb,'{"java":"import java.io.*;\nimport java.util.*;\n\npublic class Main {\n    public static void main(String[] args) throws Exception {\n        Scanner scanner = new Scanner(System.in);\n        // 每个参数占一行；数组、矩阵等复合参数使用 JSON 外观。\n        // 可用 nextInt()/next() 读取空白分隔数据，或 nextLine() 读取整行。\n        // TODO: 解析输入并输出答案。\n        scanner.close();\n    }\n}\n"}'::jsonb),
('hot100',21,'240',NULL,'搜索二维矩阵 II','search-a-2d-matrix-ii','中等','矩阵',NULL,NULL,TRUE,'https://leetcode.cn/problems/search-a-2d-matrix-ii/','编写一个高效的算法来搜索 m x n 矩阵 matrix 中的一个目标值 target 。该矩阵具有以下特性：

	• 每行的元素从左到右升序排列。

	• 每列的元素从上到下升序排列。

示例 1：

输入：matrix = [[1,4,7,11,15],[2,5,8,12,19],[3,6,9,16,22],[10,13,14,17,24],[18,21,23,26,30]], target = 5
输出：true

示例 2：

输入：matrix = [[1,4,7,11,15],[2,5,8,12,19],[3,6,9,16,22],[10,13,14,17,24],[18,21,23,26,30]], target = 20
输出：false

提示：

	• m == matrix.length

	• n == matrix[i].length

	• 1

	• -109 9

	• 每行的所有元素从左到右升序排列

	• 每列的所有元素从上到下升序排列

	• -109 9','[{"input":"matrix = [[1,4,7,11,15],[2,5,8,12,19],[3,6,9,16,22],[10,13,14,17,24],[18,21,23,26,30]], target = 5","output":"true","explanation":""},{"input":"matrix = [[1,4,7,11,15],[2,5,8,12,19],[3,6,9,16,22],[10,13,14,17,24],[18,21,23,26,30]], target = 20","output":"false","explanation":""}]'::jsonb,'[[1,4,7,11,15],[2,5,8,12,19],[3,6,9,16,22],[10,13,14,17,24],[18,21,23,26,30]]
5
[[1,4,7,11,15],[2,5,8,12,19],[3,6,9,16,22],[10,13,14,17,24],[18,21,23,26,30]]
20',ARRAY['数组','二分查找','分治','矩阵']::text[],'{"java":"class Solution {\n    public boolean searchMatrix(int[][] matrix, int target) {\n        \n    }\n}"}'::jsonb,'{"java":"import java.io.*;\nimport java.util.*;\n\npublic class Main {\n    public static void main(String[] args) throws Exception {\n        Scanner scanner = new Scanner(System.in);\n        // 每个参数占一行；数组、矩阵等复合参数使用 JSON 外观。\n        // 可用 nextInt()/next() 读取空白分隔数据，或 nextLine() 读取整行。\n        // TODO: 解析输入并输出答案。\n        scanner.close();\n    }\n}\n"}'::jsonb),
('hot100',22,'160',NULL,'相交链表','intersection-of-two-linked-lists','简单','链表',NULL,NULL,TRUE,'https://leetcode.cn/problems/intersection-of-two-linked-lists/','给你两个单链表的头节点 headA 和 headB ，请你找出并返回两个单链表相交的起始节点。如果两个链表不存在相交节点，返回 null 。

图示两个链表在节点 c1 开始相交：

题目数据 保证 整个链式结构中不存在环。

注意，函数返回结果后，链表必须 保持其原始结构 。

自定义评测：

评测系统 的输入如下（你设计的程序 不适用 此输入）：

	• intersectVal - 相交的起始节点的值。如果不存在相交节点，这一值为 0

	• listA - 第一个链表

	• listB - 第二个链表

	• skipA - 在 listA 中（从头节点开始）跳到交叉节点的节点数

	• skipB - 在 listB 中（从头节点开始）跳到交叉节点的节点数

评测系统将根据这些输入创建链式数据结构，并将两个头节点 headA 和 headB 传递给你的程序。如果程序能够正确返回相交节点，那么你的解决方案将被 视作正确答案 。

示例 1：

输入：intersectVal = 8, listA = [4,1,8,4,5], listB = [5,6,1,8,4,5], skipA = 2, skipB = 3
输出：Intersected at ''8''
解释：相交节点的值为 8 （注意，如果两个链表相交则不能为 0）。
从各自的表头开始算起，链表 A 为 [4,1,8,4,5]，链表 B 为 [5,6,1,8,4,5]。
在 A 中，相交节点前有 2 个节点；在 B 中，相交节点前有 3 个节点。
— 请注意相交节点的值不为 1，因为在链表 A 和链表 B 之中值为 1 的节点 (A 中第二个节点和 B 中第三个节点) 是不同的节点。换句话说，它们在内存中指向两个不同的位置，而链表 A 和链表 B 中值为 8 的节点 (A 中第三个节点，B 中第四个节点) 在内存中指向相同的位置。

示例 2：

输入：intersectVal = 2, listA = [1,9,1,2,4], listB = [3,2,4], skipA = 3, skipB = 1
输出：Intersected at ''2''
解释：相交节点的值为 2 （注意，如果两个链表相交则不能为 0）。
从各自的表头开始算起，链表 A 为 [1,9,1,2,4]，链表 B 为 [3,2,4]。
在 A 中，相交节点前有 3 个节点；在 B 中，相交节点前有 1 个节点。

示例 3：

输入：intersectVal = 0, listA = [2,6,4], listB = [1,5], skipA = 3, skipB = 2
输出：No intersection
解释：从各自的表头开始算起，链表 A 为 [2,6,4]，链表 B 为 [1,5]。
由于这两个链表不相交，所以 intersectVal 必须为 0，而 skipA 和 skipB 可以是任意值。
这两个链表不相交，因此返回 null 。

提示：

	• listA 中节点数目为 m

	• listB 中节点数目为 n

	• 1 4

	• 1 5

	• 0

	• 0

	• 如果 listA 和 listB 没有交点，intersectVal 为 0

	• 如果 listA 和 listB 有交点，intersectVal == listA[skipA] == listB[skipB]

进阶：你能否设计一个时间复杂度 O(m + n) 、仅用 O(1) 内存的解决方案？','[{"input":"intersectVal = 8, listA = [4,1,8,4,5], listB = [5,6,1,8,4,5], skipA = 2, skipB = 3","output":"Intersected at ''8''","explanation":"相交节点的值为 8 （注意，如果两个链表相交则不能为 0）。\n从各自的表头开始算起，链表 A 为 [4,1,8,4,5]，链表 B 为 [5,6,1,8,4,5]。\n在 A 中，相交节点前有 2 个节点；在 B 中，相交节点前有 3 个节点。\n— 请注意相交节点的值不为 1，因为在链表 A 和链表 B 之中值为 1 的节点 (A 中第二个节点和 B 中第三个节点) 是不同的节点。换句话说，它们在内存中指向两个不同的位置，而链表 A 和链表 B 中值为 8 的节点 (A 中第三个节点，B 中第四个节点) 在内存中指向相同的位置。"},{"input":"intersectVal = 2, listA = [1,9,1,2,4], listB = [3,2,4], skipA = 3, skipB = 1","output":"Intersected at ''2''","explanation":"相交节点的值为 2 （注意，如果两个链表相交则不能为 0）。\n从各自的表头开始算起，链表 A 为 [1,9,1,2,4]，链表 B 为 [3,2,4]。\n在 A 中，相交节点前有 3 个节点；在 B 中，相交节点前有 1 个节点。"},{"input":"intersectVal = 0, listA = [2,6,4], listB = [1,5], skipA = 3, skipB = 2","output":"No intersection","explanation":"从各自的表头开始算起，链表 A 为 [2,6,4]，链表 B 为 [1,5]。\n由于这两个链表不相交，所以 intersectVal 必须为 0，而 skipA 和 skipB 可以是任意值。\n这两个链表不相交，因此返回 null 。"}]'::jsonb,'8
[4,1,8,4,5]
[5,6,1,8,4,5]
2
3
2
[1,9,1,2,4]
[3,2,4]
3
1
0
[2,6,4]
[1,5]
3
2',ARRAY['哈希表','链表','双指针']::text[],'{"java":"/**\n * Definition for singly-linked list.\n * public class ListNode {\n *     int val;\n *     ListNode next;\n *     ListNode(int x) {\n *         val = x;\n *         next = null;\n *     }\n * }\n */\npublic class Solution {\n    public ListNode getIntersectionNode(ListNode headA, ListNode headB) {\n        \n    }\n}"}'::jsonb,'{"java":"import java.io.*;\nimport java.util.*;\n\npublic class Main {\n    public static void main(String[] args) throws Exception {\n        Scanner scanner = new Scanner(System.in);\n        // 每个参数占一行；数组、矩阵等复合参数使用 JSON 外观。\n        // 可用 nextInt()/next() 读取空白分隔数据，或 nextLine() 读取整行。\n        // TODO: 解析输入并输出答案。\n        scanner.close();\n    }\n}\n"}'::jsonb),
('hot100',23,'206',NULL,'反转链表','reverse-linked-list','简单','链表',NULL,NULL,TRUE,'https://leetcode.cn/problems/reverse-linked-list/','给你单链表的头节点 head ，请你反转链表，并返回反转后的链表。

 

示例 1：

输入：head = [1,2,3,4,5]
输出：[5,4,3,2,1]

示例 2：

输入：head = [1,2]
输出：[2,1]

示例 3：

输入：head = []
输出：[]

 

提示：

	• 链表中节点的数目范围是 [0, 5000]

	• -5000

 

进阶：链表可以选用迭代或递归方式完成反转。你能否用两种方法解决这道题？','[{"input":"head = [1,2,3,4,5]","output":"[5,4,3,2,1]","explanation":""},{"input":"head = [1,2]","output":"[2,1]","explanation":""},{"input":"head = []","output":"[]","explanation":""}]'::jsonb,'[1,2,3,4,5]
[1,2]
[]',ARRAY['递归','链表']::text[],'{"java":"/**\n * Definition for singly-linked list.\n * public class ListNode {\n *     int val;\n *     ListNode next;\n *     ListNode() {}\n *     ListNode(int val) { this.val = val; }\n *     ListNode(int val, ListNode next) { this.val = val; this.next = next; }\n * }\n */\nclass Solution {\n    public ListNode reverseList(ListNode head) {\n        \n    }\n}"}'::jsonb,'{"java":"import java.io.*;\nimport java.util.*;\n\npublic class Main {\n    public static void main(String[] args) throws Exception {\n        Scanner scanner = new Scanner(System.in);\n        // 每个参数占一行；数组、矩阵等复合参数使用 JSON 外观。\n        // 可用 nextInt()/next() 读取空白分隔数据，或 nextLine() 读取整行。\n        // TODO: 解析输入并输出答案。\n        scanner.close();\n    }\n}\n"}'::jsonb),
('hot100',24,'234',NULL,'回文链表','palindrome-linked-list','简单','链表',NULL,NULL,TRUE,'https://leetcode.cn/problems/palindrome-linked-list/','给你一个单链表的头节点 head ，请你判断该链表是否为回文链表。如果是，返回 true ；否则，返回 false 。

示例 1：

输入：head = [1,2,2,1]
输出：true

示例 2：

输入：head = [1,2]
输出：false

提示：

	• 链表中节点数目在范围[1, 105] 内

	• 0

进阶：你能否用 O(n) 时间复杂度和 O(1) 空间复杂度解决此题？','[{"input":"head = [1,2,2,1]","output":"true","explanation":""},{"input":"head = [1,2]","output":"false","explanation":""}]'::jsonb,'[1,2,2,1]
[1,2]',ARRAY['栈','递归','链表','双指针']::text[],'{"java":"/**\n * Definition for singly-linked list.\n * public class ListNode {\n *     int val;\n *     ListNode next;\n *     ListNode() {}\n *     ListNode(int val) { this.val = val; }\n *     ListNode(int val, ListNode next) { this.val = val; this.next = next; }\n * }\n */\nclass Solution {\n    public boolean isPalindrome(ListNode head) {\n        \n    }\n}"}'::jsonb,'{"java":"import java.io.*;\nimport java.util.*;\n\npublic class Main {\n    public static void main(String[] args) throws Exception {\n        Scanner scanner = new Scanner(System.in);\n        // 每个参数占一行；数组、矩阵等复合参数使用 JSON 外观。\n        // 可用 nextInt()/next() 读取空白分隔数据，或 nextLine() 读取整行。\n        // TODO: 解析输入并输出答案。\n        scanner.close();\n    }\n}\n"}'::jsonb),
('hot100',25,'141',NULL,'环形链表','linked-list-cycle','简单','链表',NULL,NULL,TRUE,'https://leetcode.cn/problems/linked-list-cycle/','给你一个链表的头节点 head ，判断链表中是否有环。

如果链表中有某个节点，可以通过连续跟踪 next 指针再次到达，则链表中存在环。 为了表示给定链表中的环，评测系统内部使用整数 pos 来表示链表尾连接到链表中的位置（索引从 0 开始）。注意：pos 不作为参数进行传递 。仅仅是为了标识链表的实际情况。

如果链表中存在环 ，则返回 true 。 否则，返回 false 。

示例 1：

输入：head = [3,2,0,-4], pos = 1
输出：true
解释：链表中有一个环，其尾部连接到第二个节点。

示例 2：

输入：head = [1,2], pos = 0
输出：true
解释：链表中有一个环，其尾部连接到第一个节点。

示例 3：

输入：head = [1], pos = -1
输出：false
解释：链表中没有环。

提示：

	• 链表中节点的数目范围是 [0, 104]

	• -105 5

	• pos 为 -1 或者链表中的一个 有效索引 。

进阶：你能用 O(1)（即，常量）内存解决此问题吗？','[{"input":"head = [3,2,0,-4], pos = 1","output":"true","explanation":"链表中有一个环，其尾部连接到第二个节点。"},{"input":"head = [1,2], pos = 0","output":"true","explanation":"链表中有一个环，其尾部连接到第一个节点。"},{"input":"head = [1], pos = -1","output":"false","explanation":"链表中没有环。"}]'::jsonb,'[3,2,0,-4]
1
[1,2]
0
[1]
-1',ARRAY['哈希表','链表','双指针','floyds-cycle-finding-algorithm']::text[],'{"java":"/**\n * Definition for singly-linked list.\n * class ListNode {\n *     int val;\n *     ListNode next;\n *     ListNode(int x) {\n *         val = x;\n *         next = null;\n *     }\n * }\n */\npublic class Solution {\n    public boolean hasCycle(ListNode head) {\n        \n    }\n}"}'::jsonb,'{"java":"import java.io.*;\nimport java.util.*;\n\npublic class Main {\n    public static void main(String[] args) throws Exception {\n        Scanner scanner = new Scanner(System.in);\n        // 每个参数占一行；数组、矩阵等复合参数使用 JSON 外观。\n        // 可用 nextInt()/next() 读取空白分隔数据，或 nextLine() 读取整行。\n        // TODO: 解析输入并输出答案。\n        scanner.close();\n    }\n}\n"}'::jsonb),
('hot100',26,'142',NULL,'环形链表 II','linked-list-cycle-ii','中等','链表',NULL,NULL,TRUE,'https://leetcode.cn/problems/linked-list-cycle-ii/','给定一个链表的头节点  head ，返回链表开始入环的第一个节点。 如果链表无环，则返回 null。

如果链表中有某个节点，可以通过连续跟踪 next 指针再次到达，则链表中存在环。 为了表示给定链表中的环，评测系统内部使用整数 pos 来表示链表尾连接到链表中的位置（索引从 0 开始）。如果 pos 是 -1，则在该链表中没有环。注意：pos 不作为参数进行传递，仅仅是为了标识链表的实际情况。

不允许修改 链表。

示例 1：

输入：head = [3,2,0,-4], pos = 1
输出：返回索引为 1 的链表节点
解释：链表中有一个环，其尾部连接到第二个节点。

示例 2：

输入：head = [1,2], pos = 0
输出：返回索引为 0 的链表节点
解释：链表中有一个环，其尾部连接到第一个节点。

示例 3：

输入：head = [1], pos = -1
输出：返回 null
解释：链表中没有环。

提示：

	• 链表中节点的数目范围在范围 [0, 104] 内

	• -105 5

	• pos 的值为 -1 或者链表中的一个有效索引

进阶：你是否可以使用 O(1) 空间解决此题？','[{"input":"head = [3,2,0,-4], pos = 1","output":"返回索引为 1 的链表节点","explanation":"链表中有一个环，其尾部连接到第二个节点。"},{"input":"head = [1,2], pos = 0","output":"返回索引为 0 的链表节点","explanation":"链表中有一个环，其尾部连接到第一个节点。"},{"input":"head = [1], pos = -1","output":"返回 null","explanation":"链表中没有环。"}]'::jsonb,'[3,2,0,-4]
1
[1,2]
0
[1]
-1',ARRAY['哈希表','链表','双指针','floyds-cycle-finding-algorithm']::text[],'{"java":"/**\n * Definition for singly-linked list.\n * class ListNode {\n *     int val;\n *     ListNode next;\n *     ListNode(int x) {\n *         val = x;\n *         next = null;\n *     }\n * }\n */\npublic class Solution {\n    public ListNode detectCycle(ListNode head) {\n        \n    }\n}"}'::jsonb,'{"java":"import java.io.*;\nimport java.util.*;\n\npublic class Main {\n    public static void main(String[] args) throws Exception {\n        Scanner scanner = new Scanner(System.in);\n        // 每个参数占一行；数组、矩阵等复合参数使用 JSON 外观。\n        // 可用 nextInt()/next() 读取空白分隔数据，或 nextLine() 读取整行。\n        // TODO: 解析输入并输出答案。\n        scanner.close();\n    }\n}\n"}'::jsonb),
('hot100',27,'21',NULL,'合并两个有序链表','merge-two-sorted-lists','简单','链表',NULL,NULL,TRUE,'https://leetcode.cn/problems/merge-two-sorted-lists/','将两个升序链表合并为一个新的 升序 链表并返回。新链表是通过拼接给定的两个链表的所有节点组成的。 

 

示例 1：

输入：l1 = [1,2,4], l2 = [1,3,4]
输出：[1,1,2,3,4,4]

示例 2：

输入：l1 = [], l2 = []
输出：[]

示例 3：

输入：l1 = [], l2 = [0]
输出：[0]

 

提示：

	• 两个链表的节点数目范围是 [0, 50]

	• -100

	• l1 和 l2 均按 非递减顺序 排列','[{"input":"l1 = [1,2,4], l2 = [1,3,4]","output":"[1,1,2,3,4,4]","explanation":""},{"input":"l1 = [], l2 = []","output":"[]","explanation":""},{"input":"l1 = [], l2 = [0]","output":"[0]","explanation":""}]'::jsonb,'[1,2,4]
[1,3,4]
[]
[]
[]
[0]',ARRAY['递归','链表']::text[],'{"java":"/**\n * Definition for singly-linked list.\n * public class ListNode {\n *     int val;\n *     ListNode next;\n *     ListNode() {}\n *     ListNode(int val) { this.val = val; }\n *     ListNode(int val, ListNode next) { this.val = val; this.next = next; }\n * }\n */\nclass Solution {\n    public ListNode mergeTwoLists(ListNode list1, ListNode list2) {\n        \n    }\n}"}'::jsonb,'{"java":"import java.io.*;\nimport java.util.*;\n\npublic class Main {\n    public static void main(String[] args) throws Exception {\n        Scanner scanner = new Scanner(System.in);\n        // 每个参数占一行；数组、矩阵等复合参数使用 JSON 外观。\n        // 可用 nextInt()/next() 读取空白分隔数据，或 nextLine() 读取整行。\n        // TODO: 解析输入并输出答案。\n        scanner.close();\n    }\n}\n"}'::jsonb),
('hot100',28,'2',NULL,'两数相加','add-two-numbers','中等','链表',NULL,NULL,TRUE,'https://leetcode.cn/problems/add-two-numbers/','给你两个 非空 的链表，表示两个非负的整数。它们每位数字都是按照 逆序 的方式存储的，并且每个节点只能存储 一位 数字。

请你将两个数相加，并以相同形式返回一个表示和的链表。

你可以假设除了数字 0 之外，这两个数都不会以 0 开头。

示例 1：

输入：l1 = [2,4,3], l2 = [5,6,4]
输出：[7,0,8]
解释：342 + 465 = 807.

示例 2：

输入：l1 = [0], l2 = [0]
输出：[0]

示例 3：

输入：l1 = [9,9,9,9,9,9,9], l2 = [9,9,9,9]
输出：[8,9,9,9,0,0,0,1]

提示：

	• 每个链表中的节点数在范围 [1, 100] 内

	• 0

	• 题目数据保证列表表示的数字不含前导零','[{"input":"l1 = [2,4,3], l2 = [5,6,4]","output":"[7,0,8]","explanation":"342 + 465 = 807."},{"input":"l1 = [0], l2 = [0]","output":"[0]","explanation":""},{"input":"l1 = [9,9,9,9,9,9,9], l2 = [9,9,9,9]","output":"[8,9,9,9,0,0,0,1]","explanation":""}]'::jsonb,'[2,4,3]
[5,6,4]
[0]
[0]
[9,9,9,9,9,9,9]
[9,9,9,9]',ARRAY['递归','链表','数学']::text[],'{"java":"/**\n * Definition for singly-linked list.\n * public class ListNode {\n *     int val;\n *     ListNode next;\n *     ListNode() {}\n *     ListNode(int val) { this.val = val; }\n *     ListNode(int val, ListNode next) { this.val = val; this.next = next; }\n * }\n */\nclass Solution {\n    public ListNode addTwoNumbers(ListNode l1, ListNode l2) {\n        \n    }\n}"}'::jsonb,'{"java":"import java.io.*;\nimport java.util.*;\n\npublic class Main {\n    public static void main(String[] args) throws Exception {\n        Scanner scanner = new Scanner(System.in);\n        // 每个参数占一行；数组、矩阵等复合参数使用 JSON 外观。\n        // 可用 nextInt()/next() 读取空白分隔数据，或 nextLine() 读取整行。\n        // TODO: 解析输入并输出答案。\n        scanner.close();\n    }\n}\n"}'::jsonb),
('hot100',29,'19',NULL,'删除链表的倒数第 N 个结点','remove-nth-node-from-end-of-list','中等','链表',NULL,NULL,TRUE,'https://leetcode.cn/problems/remove-nth-node-from-end-of-list/','给你一个链表，删除链表的倒数第 n 个结点，并且返回链表的头结点。

示例 1：

输入：head = [1,2,3,4,5], n = 2
输出：[1,2,3,5]

示例 2：

输入：head = [1], n = 1
输出：[]

示例 3：

输入：head = [1,2], n = 1
输出：[1]

提示：

	• 链表中结点的数目为 sz

	• 1

	• 0

	• 1

进阶：你能尝试使用一趟扫描实现吗？','[{"input":"head = [1,2,3,4,5], n = 2","output":"[1,2,3,5]","explanation":""},{"input":"head = [1], n = 1","output":"[]","explanation":""},{"input":"head = [1,2], n = 1","output":"[1]","explanation":""}]'::jsonb,'[1,2,3,4,5]
2
[1]
1
[1,2]
1',ARRAY['链表','双指针']::text[],'{"java":"/**\n * Definition for singly-linked list.\n * public class ListNode {\n *     int val;\n *     ListNode next;\n *     ListNode() {}\n *     ListNode(int val) { this.val = val; }\n *     ListNode(int val, ListNode next) { this.val = val; this.next = next; }\n * }\n */\nclass Solution {\n    public ListNode removeNthFromEnd(ListNode head, int n) {\n        \n    }\n}"}'::jsonb,'{"java":"import java.io.*;\nimport java.util.*;\n\npublic class Main {\n    public static void main(String[] args) throws Exception {\n        Scanner scanner = new Scanner(System.in);\n        // 每个参数占一行；数组、矩阵等复合参数使用 JSON 外观。\n        // 可用 nextInt()/next() 读取空白分隔数据，或 nextLine() 读取整行。\n        // TODO: 解析输入并输出答案。\n        scanner.close();\n    }\n}\n"}'::jsonb),
('hot100',30,'24',NULL,'两两交换链表中的节点','swap-nodes-in-pairs','中等','链表',NULL,NULL,TRUE,'https://leetcode.cn/problems/swap-nodes-in-pairs/','给你一个链表，两两交换其中相邻的节点，并返回交换后链表的头节点。你必须在不修改节点内部的值的情况下完成本题（即，只能进行节点交换）。

示例 1：

输入：head = [1,2,3,4]
输出：[2,1,4,3]

示例 2：

输入：head = []
输出：[]

示例 3：

输入：head = [1]
输出：[1]

提示：

	• 链表中节点的数目在范围 [0, 100] 内

	• 0','[{"input":"head = [1,2,3,4]","output":"[2,1,4,3]","explanation":""},{"input":"head = []","output":"[]","explanation":""},{"input":"head = [1]","output":"[1]","explanation":""}]'::jsonb,'[1,2,3,4]
[]
[1]
[1,2,3]',ARRAY['递归','链表']::text[],'{"java":"/**\n * Definition for singly-linked list.\n * public class ListNode {\n *     int val;\n *     ListNode next;\n *     ListNode() {}\n *     ListNode(int val) { this.val = val; }\n *     ListNode(int val, ListNode next) { this.val = val; this.next = next; }\n * }\n */\nclass Solution {\n    public ListNode swapPairs(ListNode head) {\n        \n    }\n}"}'::jsonb,'{"java":"import java.io.*;\nimport java.util.*;\n\npublic class Main {\n    public static void main(String[] args) throws Exception {\n        Scanner scanner = new Scanner(System.in);\n        // 每个参数占一行；数组、矩阵等复合参数使用 JSON 外观。\n        // 可用 nextInt()/next() 读取空白分隔数据，或 nextLine() 读取整行。\n        // TODO: 解析输入并输出答案。\n        scanner.close();\n    }\n}\n"}'::jsonb),
('hot100',31,'25',NULL,'K 个一组翻转链表','reverse-nodes-in-k-group','困难','链表',NULL,NULL,TRUE,'https://leetcode.cn/problems/reverse-nodes-in-k-group/','给你链表的头节点 head ，每 k 个节点一组进行翻转，请你返回修改后的链表。

k 是一个正整数，它的值小于或等于链表的长度。如果节点总数不是 k 的整数倍，那么请将最后剩余的节点保持原有顺序。

你不能只是单纯的改变节点内部的值，而是需要实际进行节点交换。

示例 1：

输入：head = [1,2,3,4,5], k = 2
输出：[2,1,4,3,5]

示例 2：

输入：head = [1,2,3,4,5], k = 3
输出：[3,2,1,4,5]

提示：

	• 链表中的节点数目为 n

	• 1

	• 0

进阶：你可以设计一个只用 O(1) 额外内存空间的算法解决此问题吗？','[{"input":"head = [1,2,3,4,5], k = 2","output":"[2,1,4,3,5]","explanation":""},{"input":"head = [1,2,3,4,5], k = 3","output":"[3,2,1,4,5]","explanation":""}]'::jsonb,'[1,2,3,4,5]
2
[1,2,3,4,5]
3',ARRAY['递归','链表']::text[],'{"java":"/**\n * Definition for singly-linked list.\n * public class ListNode {\n *     int val;\n *     ListNode next;\n *     ListNode() {}\n *     ListNode(int val) { this.val = val; }\n *     ListNode(int val, ListNode next) { this.val = val; this.next = next; }\n * }\n */\nclass Solution {\n    public ListNode reverseKGroup(ListNode head, int k) {\n        \n    }\n}"}'::jsonb,'{"java":"import java.io.*;\nimport java.util.*;\n\npublic class Main {\n    public static void main(String[] args) throws Exception {\n        Scanner scanner = new Scanner(System.in);\n        // 每个参数占一行；数组、矩阵等复合参数使用 JSON 外观。\n        // 可用 nextInt()/next() 读取空白分隔数据，或 nextLine() 读取整行。\n        // TODO: 解析输入并输出答案。\n        scanner.close();\n    }\n}\n"}'::jsonb),
('hot100',32,'138',NULL,'随机链表的复制','copy-list-with-random-pointer','中等','链表',NULL,NULL,FALSE,'https://leetcode.cn/problems/copy-list-with-random-pointer/','给你一个长度为 n 的链表，每个节点包含一个额外增加的随机指针 random ，该指针可以指向链表中的任何节点或空节点。

构造这个链表的 深拷贝。 深拷贝应该正好由 n 个 全新 节点组成，其中每个新节点的值都设为其对应的原节点的值。新节点的 next 指针和 random 指针也都应指向复制链表中的新节点，并使原链表和复制链表中的这些指针能够表示相同的链表状态。复制链表中的指针都不应指向原链表中的节点 。

例如，如果原链表中有 X 和 Y 两个节点，其中 X.random --> Y 。那么在复制链表中对应的两个节点 x 和 y ，同样有 x.random --> y 。

返回复制链表的头节点。

用一个由 n 个节点组成的链表来表示输入/输出中的链表。每个节点用一个 [val, random_index] 表示：

	• val：一个表示 Node.val 的整数。

	• random_index：随机指针指向的节点索引（范围从 0 到 n-1）；如果不指向任何节点，则为  null 。

你的代码 只 接受原链表的头节点 head 作为传入参数。

示例 1：

输入：head = [[7,null],[13,0],[11,4],[10,2],[1,0]]
输出：[[7,null],[13,0],[11,4],[10,2],[1,0]]

示例 2：

输入：head = [[1,1],[2,1]]
输出：[[1,1],[2,1]]

示例 3：

输入：head = [[3,null],[3,0],[3,null]]
输出：[[3,null],[3,0],[3,null]]

提示：

	• 0

	• -104 4

	• Node.random 为 null 或指向链表中的节点。','[{"input":"head = [[7,null],[13,0],[11,4],[10,2],[1,0]]","output":"[[7,null],[13,0],[11,4],[10,2],[1,0]]","explanation":""},{"input":"head = [[1,1],[2,1]]","output":"[[1,1],[2,1]]","explanation":""},{"input":"head = [[3,null],[3,0],[3,null]]","output":"[[3,null],[3,0],[3,null]]","explanation":""}]'::jsonb,'[[7,null],[13,0],[11,4],[10,2],[1,0]]
[[1,1],[2,1]]
[[3,null],[3,0],[3,null]]',ARRAY['哈希表','链表']::text[],'{"java":"/*\n// Definition for a Node.\nclass Node {\n    int val;\n    Node next;\n    Node random;\n\n    public Node(int val) {\n        this.val = val;\n        this.next = null;\n        this.random = null;\n    }\n}\n*/\n\nclass Solution {\n    public Node copyRandomList(Node head) {\n        \n    }\n}"}'::jsonb,'{"java":"import java.io.*;\nimport java.util.*;\n\npublic class Main {\n    public static void main(String[] args) throws Exception {\n        Scanner scanner = new Scanner(System.in);\n        // 每个参数占一行；数组、矩阵等复合参数使用 JSON 外观。\n        // 可用 nextInt()/next() 读取空白分隔数据，或 nextLine() 读取整行。\n        // TODO: 解析输入并输出答案。\n        scanner.close();\n    }\n}\n"}'::jsonb),
('hot100',33,'148',NULL,'排序链表','sort-list','中等','链表',NULL,NULL,TRUE,'https://leetcode.cn/problems/sort-list/','给你链表的头结点 head ，请将其按 升序 排列并返回 排序后的链表 。

示例 1：

输入：head = [4,2,1,3]
输出：[1,2,3,4]

示例 2：

输入：head = [-1,5,3,4,0]
输出：[-1,0,3,4,5]

示例 3：

输入：head = []
输出：[]

提示：

	• 链表中节点的数目在范围 [0, 5 * 104] 内

	• -105 5

进阶：你可以在 O(n log n) 时间复杂度和常数级空间复杂度下，对链表进行排序吗？','[{"input":"head = [4,2,1,3]","output":"[1,2,3,4]","explanation":""},{"input":"head = [-1,5,3,4,0]","output":"[-1,0,3,4,5]","explanation":""},{"input":"head = []","output":"[]","explanation":""}]'::jsonb,'[4,2,1,3]
[-1,5,3,4,0]
[]',ARRAY['链表','双指针','分治','排序','归并排序']::text[],'{"java":"/**\n * Definition for singly-linked list.\n * public class ListNode {\n *     int val;\n *     ListNode next;\n *     ListNode() {}\n *     ListNode(int val) { this.val = val; }\n *     ListNode(int val, ListNode next) { this.val = val; this.next = next; }\n * }\n */\nclass Solution {\n    public ListNode sortList(ListNode head) {\n        \n    }\n}"}'::jsonb,'{"java":"import java.io.*;\nimport java.util.*;\n\npublic class Main {\n    public static void main(String[] args) throws Exception {\n        Scanner scanner = new Scanner(System.in);\n        // 每个参数占一行；数组、矩阵等复合参数使用 JSON 外观。\n        // 可用 nextInt()/next() 读取空白分隔数据，或 nextLine() 读取整行。\n        // TODO: 解析输入并输出答案。\n        scanner.close();\n    }\n}\n"}'::jsonb),
('hot100',34,'23',NULL,'合并 K 个升序链表','merge-k-sorted-lists','困难','链表',NULL,NULL,TRUE,'https://leetcode.cn/problems/merge-k-sorted-lists/','给你一个链表数组，每个链表都已经按升序排列。

请你将所有链表合并到一个升序链表中，返回合并后的链表。

示例 1：

输入：lists = [[1,4,5],[1,3,4],[2,6]]
输出：[1,1,2,3,4,4,5,6]
解释：链表数组如下：
[
  1->4->5,
  1->3->4,
  2->6
]
将它们合并到一个有序链表中得到。
1->1->2->3->4->4->5->6

示例 2：

输入：lists = []
输出：[]

示例 3：

输入：lists = [[]]
输出：[]

提示：

	• k == lists.length

	• 0

	• 0

	• -10^4

	• lists[i] 按 升序 排列

	• lists[i].length 的总和不超过 10^4','[{"input":"lists = [[1,4,5],[1,3,4],[2,6]]","output":"[1,1,2,3,4,4,5,6]","explanation":"链表数组如下：\n[\n  1->4->5,\n  1->3->4,\n  2->6\n]\n将它们合并到一个有序链表中得到。\n1->1->2->3->4->4->5->6"},{"input":"lists = []","output":"[]","explanation":""},{"input":"lists = [[]]","output":"[]","explanation":""}]'::jsonb,'[[1,4,5],[1,3,4],[2,6]]
[]
[[]]',ARRAY['链表','分治','堆（优先队列）','归并排序','tournament-sort']::text[],'{"java":"/**\n * Definition for singly-linked list.\n * public class ListNode {\n *     int val;\n *     ListNode next;\n *     ListNode() {}\n *     ListNode(int val) { this.val = val; }\n *     ListNode(int val, ListNode next) { this.val = val; this.next = next; }\n * }\n */\nclass Solution {\n    public ListNode mergeKLists(ListNode[] lists) {\n        \n    }\n}"}'::jsonb,'{"java":"import java.io.*;\nimport java.util.*;\n\npublic class Main {\n    public static void main(String[] args) throws Exception {\n        Scanner scanner = new Scanner(System.in);\n        // 每个参数占一行；数组、矩阵等复合参数使用 JSON 外观。\n        // 可用 nextInt()/next() 读取空白分隔数据，或 nextLine() 读取整行。\n        // TODO: 解析输入并输出答案。\n        scanner.close();\n    }\n}\n"}'::jsonb),
('hot100',35,'146',NULL,'LRU 缓存','lru-cache','中等','链表',NULL,NULL,TRUE,'https://leetcode.cn/problems/lru-cache/','请你设计并实现一个满足  LRU (最近最少使用) 缓存 约束的数据结构。

实现 LRUCache 类：

	• LRUCache(int capacity) 以 正整数 作为容量 capacity 初始化 LRU 缓存

	• int get(int key) 如果关键字 key 存在于缓存中，则返回关键字的值，否则返回 -1 。

	• void put(int key, int value) 如果关键字 key 已经存在，则变更其数据值 value ；如果不存在，则向缓存中插入该组 key-value 。如果插入操作导致关键字数量超过 capacity ，则应该 逐出 最久未使用的关键字。

函数 get 和 put 必须以 O(1) 的平均时间复杂度运行。

示例：

输入
["LRUCache", "put", "put", "get", "put", "get", "put", "get", "get", "get"]
[[2], [1, 1], [2, 2], [1], [3, 3], [2], [4, 4], [1], [3], [4]]
输出
[null, null, null, 1, null, -1, null, -1, 3, 4]

解释
LRUCache lRUCache = new LRUCache(2);
lRUCache.put(1, 1); // 缓存是 {1=1}
lRUCache.put(2, 2); // 缓存是 {1=1, 2=2}
lRUCache.get(1);    // 返回 1
lRUCache.put(3, 3); // 该操作会使得关键字 2 作废，缓存是 {1=1, 3=3}
lRUCache.get(2);    // 返回 -1 (未找到)
lRUCache.put(4, 4); // 该操作会使得关键字 1 作废，缓存是 {4=4, 3=3}
lRUCache.get(1);    // 返回 -1 (未找到)
lRUCache.get(3);    // 返回 3
lRUCache.get(4);    // 返回 4

提示：

	• 1

	• 0

	• 0 5

	• 最多调用 2 * 105 次 get 和 put','[{"input":"[\"LRUCache\", \"put\", \"put\", \"get\", \"put\", \"get\", \"put\", \"get\", \"get\", \"get\"]\n[[2], [1, 1], [2, 2], [1], [3, 3], [2], [4, 4], [1], [3], [4]]","output":"[null, null, null, 1, null, -1, null, -1, 3, 4]","explanation":"LRUCache lRUCache = new LRUCache(2);\nlRUCache.put(1, 1); // 缓存是 {1=1}\nlRUCache.put(2, 2); // 缓存是 {1=1, 2=2}\nlRUCache.get(1);    // 返回 1\nlRUCache.put(3, 3); // 该操作会使得关键字 2 作废，缓存是 {1=1, 3=3}\nlRUCache.get(2);    // 返回 -1 (未找到)\nlRUCache.put(4, 4); // 该操作会使得关键字 1 作废，缓存是 {4=4, 3=3}\nlRUCache.get(1);    // 返回 -1 (未找到)\nlRUCache.get(3);    // 返回 3\nlRUCache.get(4);    // 返回 4"}]'::jsonb,'["LRUCache","put","put","get","put","get","put","get","get","get"]
[[2],[1,1],[2,2],[1],[3,3],[2],[4,4],[1],[3],[4]]',ARRAY['设计','哈希表','链表','双向链表']::text[],'{"java":"class LRUCache {\n\n    public LRUCache(int capacity) {\n        \n    }\n    \n    public int get(int key) {\n        \n    }\n    \n    public void put(int key, int value) {\n        \n    }\n}\n\n/**\n * Your LRUCache object will be instantiated and called as such:\n * LRUCache obj = new LRUCache(capacity);\n * int param_1 = obj.get(key);\n * obj.put(key,value);\n */"}'::jsonb,'{"java":"import java.io.*;\nimport java.util.*;\n\npublic class Main {\n    public static void main(String[] args) throws Exception {\n        Scanner scanner = new Scanner(System.in);\n        // 每个参数占一行；数组、矩阵等复合参数使用 JSON 外观。\n        // 可用 nextInt()/next() 读取空白分隔数据，或 nextLine() 读取整行。\n        // TODO: 解析输入并输出答案。\n        scanner.close();\n    }\n}\n"}'::jsonb),
('hot100',36,'94',NULL,'二叉树的中序遍历','binary-tree-inorder-traversal','简单','二叉树',NULL,NULL,TRUE,'https://leetcode.cn/problems/binary-tree-inorder-traversal/','给定一个二叉树的根节点 root ，返回 它的 中序 遍历 。

示例 1：

输入：root = [1,null,2,3]
输出：[1,3,2]

示例 2：

输入：root = []
输出：[]

示例 3：

输入：root = [1]
输出：[1]

提示：

	• 树中节点数目在范围 [0, 100] 内

	• -100

进阶: 递归算法很简单，你可以通过迭代算法完成吗？','[{"input":"root = [1,null,2,3]","output":"[1,3,2]","explanation":""},{"input":"root = []","output":"[]","explanation":""},{"input":"root = [1]","output":"[1]","explanation":""}]'::jsonb,'[1,null,2,3]
[1,2,3,4,5,null,8,null,null,6,7,9]
[]
[1]',ARRAY['栈','树','深度优先搜索','二叉树']::text[],'{"java":"/**\n * Definition for a binary tree node.\n * public class TreeNode {\n *     int val;\n *     TreeNode left;\n *     TreeNode right;\n *     TreeNode() {}\n *     TreeNode(int val) { this.val = val; }\n *     TreeNode(int val, TreeNode left, TreeNode right) {\n *         this.val = val;\n *         this.left = left;\n *         this.right = right;\n *     }\n * }\n */\nclass Solution {\n    public List<Integer> inorderTraversal(TreeNode root) {\n        \n    }\n}"}'::jsonb,'{"java":"import java.io.*;\nimport java.util.*;\n\npublic class Main {\n    public static void main(String[] args) throws Exception {\n        Scanner scanner = new Scanner(System.in);\n        // 每个参数占一行；数组、矩阵等复合参数使用 JSON 外观。\n        // 可用 nextInt()/next() 读取空白分隔数据，或 nextLine() 读取整行。\n        // TODO: 解析输入并输出答案。\n        scanner.close();\n    }\n}\n"}'::jsonb),
('hot100',37,'104',NULL,'二叉树的最大深度','maximum-depth-of-binary-tree','简单','二叉树',NULL,NULL,TRUE,'https://leetcode.cn/problems/maximum-depth-of-binary-tree/','给定一个二叉树 root ，返回其最大深度。

二叉树的 最大深度 是指从根节点到最远叶子节点的最长路径上的节点数。

示例 1：

输入：root = [3,9,20,null,null,15,7]
输出：3

示例 2：

输入：root = [1,null,2]
输出：2

提示：

	• 树中节点的数量在 [0, 104] 区间内。

	• -100','[{"input":"root = [3,9,20,null,null,15,7]","output":"3","explanation":""},{"input":"root = [1,null,2]","output":"2","explanation":""}]'::jsonb,'[3,9,20,null,null,15,7]
[1,null,2]',ARRAY['树','深度优先搜索','广度优先搜索','二叉树']::text[],'{"java":"/**\n * Definition for a binary tree node.\n * public class TreeNode {\n *     int val;\n *     TreeNode left;\n *     TreeNode right;\n *     TreeNode() {}\n *     TreeNode(int val) { this.val = val; }\n *     TreeNode(int val, TreeNode left, TreeNode right) {\n *         this.val = val;\n *         this.left = left;\n *         this.right = right;\n *     }\n * }\n */\nclass Solution {\n    public int maxDepth(TreeNode root) {\n        \n    }\n}"}'::jsonb,'{"java":"import java.io.*;\nimport java.util.*;\n\npublic class Main {\n    public static void main(String[] args) throws Exception {\n        Scanner scanner = new Scanner(System.in);\n        // 每个参数占一行；数组、矩阵等复合参数使用 JSON 外观。\n        // 可用 nextInt()/next() 读取空白分隔数据，或 nextLine() 读取整行。\n        // TODO: 解析输入并输出答案。\n        scanner.close();\n    }\n}\n"}'::jsonb),
('hot100',38,'226',NULL,'翻转二叉树','invert-binary-tree','简单','二叉树',NULL,NULL,TRUE,'https://leetcode.cn/problems/invert-binary-tree/','给你一棵二叉树的根节点 root ，翻转这棵二叉树，并返回其根节点。

示例 1：

输入：root = [4,2,7,1,3,6,9]
输出：[4,7,2,9,6,3,1]

示例 2：

输入：root = [2,1,3]
输出：[2,3,1]

示例 3：

输入：root = []
输出：[]

提示：

	• 树中节点数目范围在 [0, 100] 内

	• -100','[{"input":"root = [4,2,7,1,3,6,9]","output":"[4,7,2,9,6,3,1]","explanation":""},{"input":"root = [2,1,3]","output":"[2,3,1]","explanation":""},{"input":"root = []","output":"[]","explanation":""}]'::jsonb,'[4,2,7,1,3,6,9]
[2,1,3]
[]',ARRAY['树','深度优先搜索','广度优先搜索','二叉树']::text[],'{"java":"/**\n * Definition for a binary tree node.\n * public class TreeNode {\n *     int val;\n *     TreeNode left;\n *     TreeNode right;\n *     TreeNode() {}\n *     TreeNode(int val) { this.val = val; }\n *     TreeNode(int val, TreeNode left, TreeNode right) {\n *         this.val = val;\n *         this.left = left;\n *         this.right = right;\n *     }\n * }\n */\nclass Solution {\n    public TreeNode invertTree(TreeNode root) {\n        \n    }\n}"}'::jsonb,'{"java":"import java.io.*;\nimport java.util.*;\n\npublic class Main {\n    public static void main(String[] args) throws Exception {\n        Scanner scanner = new Scanner(System.in);\n        // 每个参数占一行；数组、矩阵等复合参数使用 JSON 外观。\n        // 可用 nextInt()/next() 读取空白分隔数据，或 nextLine() 读取整行。\n        // TODO: 解析输入并输出答案。\n        scanner.close();\n    }\n}\n"}'::jsonb),
('hot100',39,'101',NULL,'对称二叉树','symmetric-tree','简单','二叉树',NULL,NULL,TRUE,'https://leetcode.cn/problems/symmetric-tree/','给你一个二叉树的根节点 root ， 检查它是否轴对称。

示例 1：

输入：root = [1,2,2,3,4,4,3]
输出：true

示例 2：

输入：root = [1,2,2,null,3,null,3]
输出：false

提示：

	• 树中节点数目在范围 [1, 1000] 内

	• -100

进阶：你可以运用递归和迭代两种方法解决这个问题吗？','[{"input":"root = [1,2,2,3,4,4,3]","output":"true","explanation":""},{"input":"root = [1,2,2,null,3,null,3]","output":"false","explanation":""}]'::jsonb,'[1,2,2,3,4,4,3]
[1,2,2,null,3,null,3]',ARRAY['树','深度优先搜索','广度优先搜索','二叉树']::text[],'{"java":"/**\n * Definition for a binary tree node.\n * public class TreeNode {\n *     int val;\n *     TreeNode left;\n *     TreeNode right;\n *     TreeNode() {}\n *     TreeNode(int val) { this.val = val; }\n *     TreeNode(int val, TreeNode left, TreeNode right) {\n *         this.val = val;\n *         this.left = left;\n *         this.right = right;\n *     }\n * }\n */\nclass Solution {\n    public boolean isSymmetric(TreeNode root) {\n        \n    }\n}"}'::jsonb,'{"java":"import java.io.*;\nimport java.util.*;\n\npublic class Main {\n    public static void main(String[] args) throws Exception {\n        Scanner scanner = new Scanner(System.in);\n        // 每个参数占一行；数组、矩阵等复合参数使用 JSON 外观。\n        // 可用 nextInt()/next() 读取空白分隔数据，或 nextLine() 读取整行。\n        // TODO: 解析输入并输出答案。\n        scanner.close();\n    }\n}\n"}'::jsonb),
('hot100',40,'543',NULL,'二叉树的直径','diameter-of-binary-tree','简单','二叉树',NULL,NULL,TRUE,'https://leetcode.cn/problems/diameter-of-binary-tree/','给你一棵二叉树的根节点，返回该树的 直径 。

二叉树的 直径 是指树中任意两个节点之间最长路径的 长度 。这条路径可能经过也可能不经过根节点 root 。

两节点之间路径的 长度 由它们之间边数表示。

示例 1：

输入：root = [1,2,3,4,5]
输出：3
解释：3 ，取路径 [4,2,1,3] 或 [5,2,1,3] 的长度。

示例 2：

输入：root = [1,2]
输出：1

提示：

	• 树中节点数目在范围 [1, 104] 内

	• -100','[{"input":"root = [1,2,3,4,5]","output":"3","explanation":"3 ，取路径 [4,2,1,3] 或 [5,2,1,3] 的长度。"},{"input":"root = [1,2]","output":"1","explanation":""}]'::jsonb,'[1,2,3,4,5]
[1,2]',ARRAY['树','深度优先搜索','二叉树','dp-on-trees']::text[],'{"java":"/**\n * Definition for a binary tree node.\n * public class TreeNode {\n *     int val;\n *     TreeNode left;\n *     TreeNode right;\n *     TreeNode() {}\n *     TreeNode(int val) { this.val = val; }\n *     TreeNode(int val, TreeNode left, TreeNode right) {\n *         this.val = val;\n *         this.left = left;\n *         this.right = right;\n *     }\n * }\n */\nclass Solution {\n    public int diameterOfBinaryTree(TreeNode root) {\n        \n    }\n}"}'::jsonb,'{"java":"import java.io.*;\nimport java.util.*;\n\npublic class Main {\n    public static void main(String[] args) throws Exception {\n        Scanner scanner = new Scanner(System.in);\n        // 每个参数占一行；数组、矩阵等复合参数使用 JSON 外观。\n        // 可用 nextInt()/next() 读取空白分隔数据，或 nextLine() 读取整行。\n        // TODO: 解析输入并输出答案。\n        scanner.close();\n    }\n}\n"}'::jsonb),
('hot100',41,'102',NULL,'二叉树的层序遍历','binary-tree-level-order-traversal','中等','二叉树',NULL,NULL,TRUE,'https://leetcode.cn/problems/binary-tree-level-order-traversal/','给你二叉树的根节点 root ，返回其节点值的 层序遍历 。 （即逐层地，从左到右访问所有节点）。

示例 1：

输入：root = [3,9,20,null,null,15,7]
输出：[[3],[9,20],[15,7]]

示例 2：

输入：root = [1]
输出：[[1]]

示例 3：

输入：root = []
输出：[]

提示：

	• 树中节点数目在范围 [0, 2000] 内

	• -1000','[{"input":"root = [3,9,20,null,null,15,7]","output":"[[3],[9,20],[15,7]]","explanation":""},{"input":"root = [1]","output":"[[1]]","explanation":""},{"input":"root = []","output":"[]","explanation":""}]'::jsonb,'[3,9,20,null,null,15,7]
[1]
[]',ARRAY['树','广度优先搜索','二叉树']::text[],'{"java":"/**\n * Definition for a binary tree node.\n * public class TreeNode {\n *     int val;\n *     TreeNode left;\n *     TreeNode right;\n *     TreeNode() {}\n *     TreeNode(int val) { this.val = val; }\n *     TreeNode(int val, TreeNode left, TreeNode right) {\n *         this.val = val;\n *         this.left = left;\n *         this.right = right;\n *     }\n * }\n */\nclass Solution {\n    public List<List<Integer>> levelOrder(TreeNode root) {\n        \n    }\n}"}'::jsonb,'{"java":"import java.io.*;\nimport java.util.*;\n\npublic class Main {\n    public static void main(String[] args) throws Exception {\n        Scanner scanner = new Scanner(System.in);\n        // 每个参数占一行；数组、矩阵等复合参数使用 JSON 外观。\n        // 可用 nextInt()/next() 读取空白分隔数据，或 nextLine() 读取整行。\n        // TODO: 解析输入并输出答案。\n        scanner.close();\n    }\n}\n"}'::jsonb),
('hot100',42,'108',NULL,'将有序数组转换为二叉搜索树','convert-sorted-array-to-binary-search-tree','简单','二叉树',NULL,NULL,FALSE,'https://leetcode.cn/problems/convert-sorted-array-to-binary-search-tree/','给你一个整数数组 nums ，其中元素已经按 升序 排列，请你将其转换为一棵 平衡 二叉搜索树。

示例 1：

输入：nums = [-10,-3,0,5,9]
输出：[0,-3,9,-10,null,5]
解释：[0,-10,5,null,-3,null,9] 也将被视为正确答案：

示例 2：

输入：nums = [1,3]
输出：[3,1]
解释：[1,null,3] 和 [3,1] 都是高度平衡二叉搜索树。

提示：

	• 1 4

	• -104 4

	• nums 按 严格递增 顺序排列','[{"input":"nums = [-10,-3,0,5,9]","output":"[0,-3,9,-10,null,5]","explanation":"[0,-10,5,null,-3,null,9] 也将被视为正确答案："},{"input":"nums = [1,3]","output":"[3,1]","explanation":"[1,null,3] 和 [3,1] 都是高度平衡二叉搜索树。"}]'::jsonb,'[-10,-3,0,5,9]
[1,3]',ARRAY['树','二叉搜索树','数组','分治','二叉树']::text[],'{"java":"/**\n * Definition for a binary tree node.\n * public class TreeNode {\n *     int val;\n *     TreeNode left;\n *     TreeNode right;\n *     TreeNode() {}\n *     TreeNode(int val) { this.val = val; }\n *     TreeNode(int val, TreeNode left, TreeNode right) {\n *         this.val = val;\n *         this.left = left;\n *         this.right = right;\n *     }\n * }\n */\nclass Solution {\n    public TreeNode sortedArrayToBST(int[] nums) {\n        \n    }\n}"}'::jsonb,'{"java":"import java.io.*;\nimport java.util.*;\n\npublic class Main {\n    public static void main(String[] args) throws Exception {\n        Scanner scanner = new Scanner(System.in);\n        // 每个参数占一行；数组、矩阵等复合参数使用 JSON 外观。\n        // 可用 nextInt()/next() 读取空白分隔数据，或 nextLine() 读取整行。\n        // TODO: 解析输入并输出答案。\n        scanner.close();\n    }\n}\n"}'::jsonb),
('hot100',43,'98',NULL,'验证二叉搜索树','validate-binary-search-tree','中等','二叉树',NULL,NULL,TRUE,'https://leetcode.cn/problems/validate-binary-search-tree/','给你一个二叉树的根节点 root ，判断其是否是一个有效的二叉搜索树。

有效 二叉搜索树定义如下：

	• 节点的左子树只包含 严格小于 当前节点的数。

	• 节点的右子树只包含 严格大于 当前节点的数。

	• 所有左子树和右子树自身必须也是二叉搜索树。

示例 1：

输入：root = [2,1,3]
输出：true

示例 2：

输入：root = [5,1,4,null,null,3,6]
输出：false
解释：根节点的值是 5 ，但是右子节点的值是 4 。

提示：

	• 树中节点数目范围在[1, 104] 内

	• -231 31 - 1','[{"input":"root = [2,1,3]","output":"true","explanation":""},{"input":"root = [5,1,4,null,null,3,6]","output":"false","explanation":"根节点的值是 5 ，但是右子节点的值是 4 。"}]'::jsonb,'[2,1,3]
[5,1,4,null,null,3,6]',ARRAY['树','深度优先搜索','二叉搜索树','二叉树']::text[],'{"java":"/**\n * Definition for a binary tree node.\n * public class TreeNode {\n *     int val;\n *     TreeNode left;\n *     TreeNode right;\n *     TreeNode() {}\n *     TreeNode(int val) { this.val = val; }\n *     TreeNode(int val, TreeNode left, TreeNode right) {\n *         this.val = val;\n *         this.left = left;\n *         this.right = right;\n *     }\n * }\n */\nclass Solution {\n    public boolean isValidBST(TreeNode root) {\n        \n    }\n}"}'::jsonb,'{"java":"import java.io.*;\nimport java.util.*;\n\npublic class Main {\n    public static void main(String[] args) throws Exception {\n        Scanner scanner = new Scanner(System.in);\n        // 每个参数占一行；数组、矩阵等复合参数使用 JSON 外观。\n        // 可用 nextInt()/next() 读取空白分隔数据，或 nextLine() 读取整行。\n        // TODO: 解析输入并输出答案。\n        scanner.close();\n    }\n}\n"}'::jsonb),
('hot100',44,'230',NULL,'二叉搜索树中第 K 小的元素','kth-smallest-element-in-a-bst','中等','二叉树',NULL,NULL,FALSE,'https://leetcode.cn/problems/kth-smallest-element-in-a-bst/','给定一个二叉搜索树的根节点 root ，和一个整数 k ，请你设计一个算法查找其中第 k 小的元素（k 从 1 开始计数）。

示例 1：

输入：root = [3,1,4,null,2], k = 1
输出：1

示例 2：

输入：root = [5,3,6,2,4,null,null,1], k = 3
输出：3

提示：

	• 树中的节点数为 n 。

	• 1 4

	• 0 4

进阶：如果二叉搜索树经常被修改（插入/删除操作）并且你需要频繁地查找第 k 小的值，你将如何优化算法？','[{"input":"root = [3,1,4,null,2], k = 1","output":"1","explanation":""},{"input":"root = [5,3,6,2,4,null,null,1], k = 3","output":"3","explanation":""}]'::jsonb,'[3,1,4,null,2]
1
[5,3,6,2,4,null,null,1]
3',ARRAY['树','深度优先搜索','二叉搜索树','二叉树']::text[],'{"java":"/**\n * Definition for a binary tree node.\n * public class TreeNode {\n *     int val;\n *     TreeNode left;\n *     TreeNode right;\n *     TreeNode() {}\n *     TreeNode(int val) { this.val = val; }\n *     TreeNode(int val, TreeNode left, TreeNode right) {\n *         this.val = val;\n *         this.left = left;\n *         this.right = right;\n *     }\n * }\n */\nclass Solution {\n    public int kthSmallest(TreeNode root, int k) {\n        \n    }\n}"}'::jsonb,'{"java":"import java.io.*;\nimport java.util.*;\n\npublic class Main {\n    public static void main(String[] args) throws Exception {\n        Scanner scanner = new Scanner(System.in);\n        // 每个参数占一行；数组、矩阵等复合参数使用 JSON 外观。\n        // 可用 nextInt()/next() 读取空白分隔数据，或 nextLine() 读取整行。\n        // TODO: 解析输入并输出答案。\n        scanner.close();\n    }\n}\n"}'::jsonb),
('hot100',45,'199',NULL,'二叉树的右视图','binary-tree-right-side-view','中等','二叉树',NULL,NULL,TRUE,'https://leetcode.cn/problems/binary-tree-right-side-view/','给定一个二叉树的 根节点 root，想象自己站在它的右侧，按照从顶部到底部的顺序，返回从右侧所能看到的节点值。

示例 1：

输入：root = [1,2,3,null,5,null,4]

输出：[1,3,4]

解释：

示例 2：

输入：root = [1,2,3,4,null,null,null,5]

输出：[1,3,4,5]

解释：

示例 3：

输入：root = [1,null,3]

输出：[1,3]

示例 4：

输入：root = []

输出：[]

提示:

	• 二叉树的节点个数的范围是 [0,100]

	• -100','[{"input":"root = [1,2,3,null,5,null,4]","output":"[1,3,4]","explanation":""},{"input":"root = [1,2,3,4,null,null,null,5]","output":"[1,3,4,5]","explanation":""},{"input":"root = [1,null,3]","output":"[1,3]","explanation":""},{"input":"root = []","output":"[]","explanation":""}]'::jsonb,'[1,2,3,null,5,null,4]
[1,2,3,4,null,null,null,5]
[1,null,3]
[]',ARRAY['树','深度优先搜索','广度优先搜索','二叉树']::text[],'{"java":"/**\n * Definition for a binary tree node.\n * public class TreeNode {\n *     int val;\n *     TreeNode left;\n *     TreeNode right;\n *     TreeNode() {}\n *     TreeNode(int val) { this.val = val; }\n *     TreeNode(int val, TreeNode left, TreeNode right) {\n *         this.val = val;\n *         this.left = left;\n *         this.right = right;\n *     }\n * }\n */\nclass Solution {\n    public List<Integer> rightSideView(TreeNode root) {\n        \n    }\n}"}'::jsonb,'{"java":"import java.io.*;\nimport java.util.*;\n\npublic class Main {\n    public static void main(String[] args) throws Exception {\n        Scanner scanner = new Scanner(System.in);\n        // 每个参数占一行；数组、矩阵等复合参数使用 JSON 外观。\n        // 可用 nextInt()/next() 读取空白分隔数据，或 nextLine() 读取整行。\n        // TODO: 解析输入并输出答案。\n        scanner.close();\n    }\n}\n"}'::jsonb),
('hot100',46,'114',NULL,'二叉树展开为链表','flatten-binary-tree-to-linked-list','中等','二叉树',NULL,NULL,FALSE,'https://leetcode.cn/problems/flatten-binary-tree-to-linked-list/','给你二叉树的根结点 root ，请你将它展开为一个单链表：

	• 展开后的单链表应该同样使用 TreeNode ，其中 right 子指针指向链表中下一个结点，而左子指针始终为 null 。

	• 展开后的单链表应该与二叉树 先序遍历 顺序相同。

 

示例 1：

输入：root = [1,2,5,3,4,null,6]
输出：[1,null,2,null,3,null,4,null,5,null,6]

示例 2：

输入：root = []
输出：[]

示例 3：

输入：root = [0]
输出：[0]

 

提示：

	• 树中结点数在范围 [0, 2000] 内

	• -100

 

进阶：你可以使用原地算法（O(1) 额外空间）展开这棵树吗？','[{"input":"root = [1,2,5,3,4,null,6]","output":"[1,null,2,null,3,null,4,null,5,null,6]","explanation":""},{"input":"root = []","output":"[]","explanation":""},{"input":"root = [0]","output":"[0]","explanation":""}]'::jsonb,'[1,2,5,3,4,null,6]
[]
[0]',ARRAY['栈','树','深度优先搜索','链表','二叉树']::text[],'{"java":"/**\n * Definition for a binary tree node.\n * public class TreeNode {\n *     int val;\n *     TreeNode left;\n *     TreeNode right;\n *     TreeNode() {}\n *     TreeNode(int val) { this.val = val; }\n *     TreeNode(int val, TreeNode left, TreeNode right) {\n *         this.val = val;\n *         this.left = left;\n *         this.right = right;\n *     }\n * }\n */\nclass Solution {\n    public void flatten(TreeNode root) {\n        \n    }\n}"}'::jsonb,'{"java":"import java.io.*;\nimport java.util.*;\n\npublic class Main {\n    public static void main(String[] args) throws Exception {\n        Scanner scanner = new Scanner(System.in);\n        // 每个参数占一行；数组、矩阵等复合参数使用 JSON 外观。\n        // 可用 nextInt()/next() 读取空白分隔数据，或 nextLine() 读取整行。\n        // TODO: 解析输入并输出答案。\n        scanner.close();\n    }\n}\n"}'::jsonb),
('hot100',47,'105',NULL,'从前序与中序遍历序列构造二叉树','construct-binary-tree-from-preorder-and-inorder-traversal','中等','二叉树',NULL,NULL,TRUE,'https://leetcode.cn/problems/construct-binary-tree-from-preorder-and-inorder-traversal/','给定两个整数数组 preorder 和 inorder ，其中 preorder 是二叉树的先序遍历， inorder 是同一棵树的中序遍历，请构造二叉树并返回其根节点。

示例 1:

输入: preorder = [3,9,20,15,7], inorder = [9,3,15,20,7]
输出: [3,9,20,null,null,15,7]

示例 2:

输入: preorder = [-1], inorder = [-1]
输出: [-1]

提示:

	• 1

	• inorder.length == preorder.length

	• -3000

	• preorder 和 inorder 均 无重复 元素

	• inorder 均出现在 preorder

	• preorder 保证 为二叉树的前序遍历序列

	• inorder 保证 为二叉树的中序遍历序列','[{"input":"preorder = [3,9,20,15,7], inorder = [9,3,15,20,7]","output":"[3,9,20,null,null,15,7]","explanation":""},{"input":"preorder = [-1], inorder = [-1]","output":"[-1]","explanation":""}]'::jsonb,'[3,9,20,15,7]
[9,3,15,20,7]
[-1]
[-1]',ARRAY['树','数组','哈希表','分治','二叉树']::text[],'{"java":"/**\n * Definition for a binary tree node.\n * public class TreeNode {\n *     int val;\n *     TreeNode left;\n *     TreeNode right;\n *     TreeNode() {}\n *     TreeNode(int val) { this.val = val; }\n *     TreeNode(int val, TreeNode left, TreeNode right) {\n *         this.val = val;\n *         this.left = left;\n *         this.right = right;\n *     }\n * }\n */\nclass Solution {\n    public TreeNode buildTree(int[] preorder, int[] inorder) {\n        \n    }\n}"}'::jsonb,'{"java":"import java.io.*;\nimport java.util.*;\n\npublic class Main {\n    public static void main(String[] args) throws Exception {\n        Scanner scanner = new Scanner(System.in);\n        // 每个参数占一行；数组、矩阵等复合参数使用 JSON 外观。\n        // 可用 nextInt()/next() 读取空白分隔数据，或 nextLine() 读取整行。\n        // TODO: 解析输入并输出答案。\n        scanner.close();\n    }\n}\n"}'::jsonb),
('hot100',48,'437',NULL,'路径总和 III','path-sum-iii','中等','二叉树',NULL,NULL,FALSE,'https://leetcode.cn/problems/path-sum-iii/','给定一个二叉树的根节点 root ，和一个整数 targetSum ，求该二叉树里节点值之和等于 targetSum 的 路径 的数目。

路径 不需要从根节点开始，也不需要在叶子节点结束，但是路径方向必须是向下的（只能从父节点到子节点）。

 

示例 1：

输入：root = [10,5,-3,3,2,null,11,3,-2,null,1], targetSum = 8
输出：3
解释：和等于 8 的路径有 3 条，如图所示。

示例 2：

输入：root = [5,4,8,11,null,13,4,7,2,null,null,5,1], targetSum = 22
输出：3

 

提示:

	• 二叉树的节点个数的范围是 [0,1000]

	• -109 9 

	• -1000','[{"input":"root = [10,5,-3,3,2,null,11,3,-2,null,1], targetSum = 8","output":"3","explanation":"和等于 8 的路径有 3 条，如图所示。"},{"input":"root = [5,4,8,11,null,13,4,7,2,null,null,5,1], targetSum = 22","output":"3","explanation":""}]'::jsonb,'[10,5,-3,3,2,null,11,3,-2,null,1]
8
[5,4,8,11,null,13,4,7,2,null,null,5,1]
22',ARRAY['树','深度优先搜索','二叉树']::text[],'{"java":"/**\n * Definition for a binary tree node.\n * public class TreeNode {\n *     int val;\n *     TreeNode left;\n *     TreeNode right;\n *     TreeNode() {}\n *     TreeNode(int val) { this.val = val; }\n *     TreeNode(int val, TreeNode left, TreeNode right) {\n *         this.val = val;\n *         this.left = left;\n *         this.right = right;\n *     }\n * }\n */\nclass Solution {\n    public int pathSum(TreeNode root, int targetSum) {\n        \n    }\n}"}'::jsonb,'{"java":"import java.io.*;\nimport java.util.*;\n\npublic class Main {\n    public static void main(String[] args) throws Exception {\n        Scanner scanner = new Scanner(System.in);\n        // 每个参数占一行；数组、矩阵等复合参数使用 JSON 外观。\n        // 可用 nextInt()/next() 读取空白分隔数据，或 nextLine() 读取整行。\n        // TODO: 解析输入并输出答案。\n        scanner.close();\n    }\n}\n"}'::jsonb),
('hot100',49,'236',NULL,'二叉树的最近公共祖先','lowest-common-ancestor-of-a-binary-tree','中等','二叉树',NULL,NULL,TRUE,'https://leetcode.cn/problems/lowest-common-ancestor-of-a-binary-tree/','给定一个二叉树, 找到该树中两个指定节点的最近公共祖先。

百度百科中最近公共祖先的定义为：“对于有根树 T 的两个节点 p、q，最近公共祖先表示为一个节点 x，满足 x 是 p、q 的祖先且 x 的深度尽可能大（一个节点也可以是它自己的祖先）。”

 

示例 1：

输入：root = [3,5,1,6,2,0,8,null,null,7,4], p = 5, q = 1
输出：3
解释：节点 5 和节点 1 的最近公共祖先是节点 3 。

示例 2：

输入：root = [3,5,1,6,2,0,8,null,null,7,4], p = 5, q = 4
输出：5
解释：节点 5 和节点 4 的最近公共祖先是节点 5 。因为根据定义最近公共祖先节点可以为节点本身。

示例 3：

输入：root = [1,2], p = 1, q = 2
输出：1

 

提示：

	• 树中节点数目在范围 [2, 105] 内。

	• -109 9

	• 所有 Node.val 互不相同 。

	• p != q

	• p 和 q 均存在于给定的二叉树中。','[{"input":"root = [3,5,1,6,2,0,8,null,null,7,4], p = 5, q = 1","output":"3","explanation":"节点 5 和节点 1 的最近公共祖先是节点 3 。"},{"input":"root = [3,5,1,6,2,0,8,null,null,7,4], p = 5, q = 4","output":"5","explanation":"节点 5 和节点 4 的最近公共祖先是节点 5 。因为根据定义最近公共祖先节点可以为节点本身。"},{"input":"root = [1,2], p = 1, q = 2","output":"1","explanation":""}]'::jsonb,'[3,5,1,6,2,0,8,null,null,7,4]
5
1
[3,5,1,6,2,0,8,null,null,7,4]
5
4
[1,2]
1
2',ARRAY['树','深度优先搜索','二叉树','lowest-common-ancestor','binary-lifting']::text[],'{"java":"/**\n * Definition for a binary tree node.\n * public class TreeNode {\n *     int val;\n *     TreeNode left;\n *     TreeNode right;\n *     TreeNode(int x) { val = x; }\n * }\n */\nclass Solution {\n    public TreeNode lowestCommonAncestor(TreeNode root, TreeNode p, TreeNode q) {\n        \n    }\n}"}'::jsonb,'{"java":"import java.io.*;\nimport java.util.*;\n\npublic class Main {\n    public static void main(String[] args) throws Exception {\n        Scanner scanner = new Scanner(System.in);\n        // 每个参数占一行；数组、矩阵等复合参数使用 JSON 外观。\n        // 可用 nextInt()/next() 读取空白分隔数据，或 nextLine() 读取整行。\n        // TODO: 解析输入并输出答案。\n        scanner.close();\n    }\n}\n"}'::jsonb),
('hot100',50,'124',NULL,'二叉树中的最大路径和','binary-tree-maximum-path-sum','困难','二叉树',NULL,NULL,TRUE,'https://leetcode.cn/problems/binary-tree-maximum-path-sum/','二叉树中的 路径 被定义为一条节点序列，序列中每对相邻节点之间都存在一条边。同一个节点在一条路径序列中 至多出现一次 。该路径 至少包含一个 节点，且不一定经过根节点。

路径和 是路径中各节点值的总和。

给你一个二叉树的根节点 root ，返回其 最大路径和 。

示例 1：

输入：root = [1,2,3]
输出：6
解释：最优路径是 2 -> 1 -> 3 ，路径和为 2 + 1 + 3 = 6

示例 2：

输入：root = [-10,9,20,null,null,15,7]
输出：42
解释：最优路径是 15 -> 20 -> 7 ，路径和为 15 + 20 + 7 = 42

提示：

	• 树中节点数目范围是 [1, 3 * 104]

	• -1000','[{"input":"root = [1,2,3]","output":"6","explanation":"最优路径是 2 -> 1 -> 3 ，路径和为 2 + 1 + 3 = 6"},{"input":"root = [-10,9,20,null,null,15,7]","output":"42","explanation":"最优路径是 15 -> 20 -> 7 ，路径和为 15 + 20 + 7 = 42"}]'::jsonb,'[1,2,3]
[-10,9,20,null,null,15,7]',ARRAY['树','深度优先搜索','动态规划','二叉树','dp-on-trees']::text[],'{"java":"/**\n * Definition for a binary tree node.\n * public class TreeNode {\n *     int val;\n *     TreeNode left;\n *     TreeNode right;\n *     TreeNode() {}\n *     TreeNode(int val) { this.val = val; }\n *     TreeNode(int val, TreeNode left, TreeNode right) {\n *         this.val = val;\n *         this.left = left;\n *         this.right = right;\n *     }\n * }\n */\nclass Solution {\n    public int maxPathSum(TreeNode root) {\n        \n    }\n}"}'::jsonb,'{"java":"import java.io.*;\nimport java.util.*;\n\npublic class Main {\n    public static void main(String[] args) throws Exception {\n        Scanner scanner = new Scanner(System.in);\n        // 每个参数占一行；数组、矩阵等复合参数使用 JSON 外观。\n        // 可用 nextInt()/next() 读取空白分隔数据，或 nextLine() 读取整行。\n        // TODO: 解析输入并输出答案。\n        scanner.close();\n    }\n}\n"}'::jsonb),
('hot100',51,'200',NULL,'岛屿数量','number-of-islands','中等','图论',NULL,NULL,TRUE,'https://leetcode.cn/problems/number-of-islands/','给你一个由 ''1''（陆地）和 ''0''（水）组成的的二维网格，请你计算网格中岛屿的数量。

岛屿总是被水包围，并且每座岛屿只能由水平方向和/或竖直方向上相邻的陆地连接形成。

此外，你可以假设该网格的四条边均被水包围。

示例 1：

输入：grid = [
  [''1'',''1'',''1'',''1'',''0''],
  [''1'',''1'',''0'',''1'',''0''],
  [''1'',''1'',''0'',''0'',''0''],
  [''0'',''0'',''0'',''0'',''0'']
]
输出：1

示例 2：

输入：grid = [
  [''1'',''1'',''0'',''0'',''0''],
  [''1'',''1'',''0'',''0'',''0''],
  [''0'',''0'',''1'',''0'',''0''],
  [''0'',''0'',''0'',''1'',''1'']
]
输出：3

提示：

	• m == grid.length

	• n == grid[i].length

	• 1

	• grid[i][j] 的值为 ''0'' 或 ''1''','[{"input":"grid = [\n  [''1'',''1'',''1'',''1'',''0''],\n  [''1'',''1'',''0'',''1'',''0''],\n  [''1'',''1'',''0'',''0'',''0''],\n  [''0'',''0'',''0'',''0'',''0'']\n]","output":"1","explanation":""},{"input":"grid = [\n  [''1'',''1'',''0'',''0'',''0''],\n  [''1'',''1'',''0'',''0'',''0''],\n  [''0'',''0'',''1'',''0'',''0''],\n  [''0'',''0'',''0'',''1'',''1'']\n]","output":"3","explanation":""}]'::jsonb,'[["1","1","1","1","0"],["1","1","0","1","0"],["1","1","0","0","0"],["0","0","0","0","0"]]
[["1","1","0","0","0"],["1","1","0","0","0"],["0","0","1","0","0"],["0","0","0","1","1"]]',ARRAY['深度优先搜索','广度优先搜索','并查集','数组','矩阵']::text[],'{"java":"class Solution {\n    public int numIslands(char[][] grid) {\n        \n    }\n}"}'::jsonb,'{"java":"import java.io.*;\nimport java.util.*;\n\npublic class Main {\n    public static void main(String[] args) throws Exception {\n        Scanner scanner = new Scanner(System.in);\n        // 每个参数占一行；数组、矩阵等复合参数使用 JSON 外观。\n        // 可用 nextInt()/next() 读取空白分隔数据，或 nextLine() 读取整行。\n        // TODO: 解析输入并输出答案。\n        scanner.close();\n    }\n}\n"}'::jsonb),
('hot100',52,'994',NULL,'腐烂的橘子','rotting-oranges','中等','图论',NULL,NULL,FALSE,'https://leetcode.cn/problems/rotting-oranges/','在给定的 m x n 网格 grid 中，每个单元格可以有以下三个值之一：

	• 值 0 代表空单元格；

	• 值 1 代表新鲜橘子；

	• 值 2 代表腐烂的橘子。

每分钟，腐烂的橘子 周围 4 个方向上相邻 的新鲜橘子都会腐烂。

返回 直到单元格中没有新鲜橘子为止所必须经过的最小分钟数。如果不可能，返回 -1 。

示例 1：

输入：grid = [[2,1,1],[1,1,0],[0,1,1]]
输出：4

示例 2：

输入：grid = [[2,1,1],[0,1,1],[1,0,1]]
输出：-1
解释：左下角的橘子（第 2 行， 第 0 列）永远不会腐烂，因为腐烂只会发生在 4 个方向上。

示例 3：

输入：grid = [[0,2]]
输出：0
解释：因为 0 分钟时已经没有新鲜橘子了，所以答案就是 0 。

提示：

	• m == grid.length

	• n == grid[i].length

	• 1

	• grid[i][j] 仅为 0、1 或 2','[{"input":"grid = [[2,1,1],[1,1,0],[0,1,1]]","output":"4","explanation":""},{"input":"grid = [[2,1,1],[0,1,1],[1,0,1]]","output":"-1","explanation":"左下角的橘子（第 2 行， 第 0 列）永远不会腐烂，因为腐烂只会发生在 4 个方向上。"},{"input":"grid = [[0,2]]","output":"0","explanation":"因为 0 分钟时已经没有新鲜橘子了，所以答案就是 0 。"}]'::jsonb,'[[2,1,1],[1,1,0],[0,1,1]]
[[2,1,1],[0,1,1],[1,0,1]]
[[0,2]]',ARRAY['广度优先搜索','数组','矩阵']::text[],'{"java":"class Solution {\n    public int orangesRotting(int[][] grid) {\n        \n    }\n}"}'::jsonb,'{"java":"import java.io.*;\nimport java.util.*;\n\npublic class Main {\n    public static void main(String[] args) throws Exception {\n        Scanner scanner = new Scanner(System.in);\n        // 每个参数占一行；数组、矩阵等复合参数使用 JSON 外观。\n        // 可用 nextInt()/next() 读取空白分隔数据，或 nextLine() 读取整行。\n        // TODO: 解析输入并输出答案。\n        scanner.close();\n    }\n}\n"}'::jsonb),
('hot100',53,'207',NULL,'课程表','course-schedule','中等','图论',NULL,NULL,TRUE,'https://leetcode.cn/problems/course-schedule/','你这个学期必须选修 numCourses 门课程，记为 0 到 numCourses - 1 。

在选修某些课程之前需要一些先修课程。 先修课程按数组 prerequisites 给出，其中 prerequisites[i] = [ai, bi] ，表示如果要学习课程 ai 则 必须 先学习课程  bi 。

	• 例如，先修课程对 [0, 1] 表示：想要学习课程 0 ，你需要先完成课程 1 。

请你判断是否可能完成所有课程的学习？如果可以，返回 true ；否则，返回 false 。

示例 1：

输入：numCourses = 2, prerequisites = [[1,0]]
输出：true
解释：总共有 2 门课程。学习课程 1 之前，你需要完成课程 0 。这是可能的。

示例 2：

输入：numCourses = 2, prerequisites = [[1,0],[0,1]]
输出：false
解释：总共有 2 门课程。学习课程 1 之前，你需要先完成​课程 0 ；并且学习课程 0 之前，你还应先完成课程 1 。这是不可能的。

提示：

	• 1

	• 0

	• prerequisites[i].length == 2

	• 0 i, bi

	• prerequisites[i] 中的所有课程对 互不相同','[{"input":"numCourses = 2, prerequisites = [[1,0]]","output":"true","explanation":"总共有 2 门课程。学习课程 1 之前，你需要完成课程 0 。这是可能的。"},{"input":"numCourses = 2, prerequisites = [[1,0],[0,1]]","output":"false","explanation":"总共有 2 门课程。学习课程 1 之前，你需要先完成​课程 0 ；并且学习课程 0 之前，你还应先完成课程 1 。这是不可能的。"}]'::jsonb,'2
[[1,0]]
2
[[1,0],[0,1]]',ARRAY['深度优先搜索','广度优先搜索','图','拓扑排序','directed-acyclic-graph']::text[],'{"java":"class Solution {\n    public boolean canFinish(int numCourses, int[][] prerequisites) {\n        \n    }\n}"}'::jsonb,'{"java":"import java.io.*;\nimport java.util.*;\n\npublic class Main {\n    public static void main(String[] args) throws Exception {\n        Scanner scanner = new Scanner(System.in);\n        // 每个参数占一行；数组、矩阵等复合参数使用 JSON 外观。\n        // 可用 nextInt()/next() 读取空白分隔数据，或 nextLine() 读取整行。\n        // TODO: 解析输入并输出答案。\n        scanner.close();\n    }\n}\n"}'::jsonb),
('hot100',54,'208',NULL,'实现 Trie (前缀树)','implement-trie-prefix-tree','中等','图论',NULL,NULL,FALSE,'https://leetcode.cn/problems/implement-trie-prefix-tree/','Trie（发音类似 "try"）或者说 前缀树 是一种树形数据结构，用于高效地存储和检索字符串数据集中的键。这一数据结构有相当多的应用情景，例如自动补全和拼写检查。

请你实现 Trie 类：

	• Trie() 初始化前缀树对象。

	• void insert(String word) 向前缀树中插入字符串 word 。

	• boolean search(String word) 如果字符串 word 在前缀树中，返回 true（即，在检索之前已经插入）；否则，返回 false 。

	• boolean startsWith(String prefix) 如果之前已经插入的字符串 word 的前缀之一为 prefix ，返回 true ；否则，返回 false 。

示例：

输入
["Trie", "insert", "search", "search", "startsWith", "insert", "search"]
[[], ["apple"], ["apple"], ["app"], ["app"], ["app"], ["app"]]
输出
[null, null, true, false, true, null, true]

解释
Trie trie = new Trie();
trie.insert("apple");
trie.search("apple");   // 返回 True
trie.search("app");     // 返回 False
trie.startsWith("app"); // 返回 True
trie.insert("app");
trie.search("app");     // 返回 True

提示：

	• 1

	• word 和 prefix 仅由小写英文字母组成

	• insert、search 和 startsWith 调用次数 总计 不超过 3 * 104 次','[{"input":"[\"Trie\", \"insert\", \"search\", \"search\", \"startsWith\", \"insert\", \"search\"]\n[[], [\"apple\"], [\"apple\"], [\"app\"], [\"app\"], [\"app\"], [\"app\"]]","output":"[null, null, true, false, true, null, true]","explanation":"Trie trie = new Trie();\ntrie.insert(\"apple\");\ntrie.search(\"apple\");   // 返回 True\ntrie.search(\"app\");     // 返回 False\ntrie.startsWith(\"app\"); // 返回 True\ntrie.insert(\"app\");\ntrie.search(\"app\");     // 返回 True"}]'::jsonb,'["Trie","insert","search","search","startsWith","insert","search"]
[[],["apple"],["apple"],["app"],["app"],["app"],["app"]]',ARRAY['设计','字典树','哈希表','字符串']::text[],'{"java":"class Trie {\n\n    public Trie() {\n        \n    }\n    \n    public void insert(String word) {\n        \n    }\n    \n    public boolean search(String word) {\n        \n    }\n    \n    public boolean startsWith(String prefix) {\n        \n    }\n}\n\n/**\n * Your Trie object will be instantiated and called as such:\n * Trie obj = new Trie();\n * obj.insert(word);\n * boolean param_2 = obj.search(word);\n * boolean param_3 = obj.startsWith(prefix);\n */"}'::jsonb,'{"java":"import java.io.*;\nimport java.util.*;\n\npublic class Main {\n    public static void main(String[] args) throws Exception {\n        Scanner scanner = new Scanner(System.in);\n        // 每个参数占一行；数组、矩阵等复合参数使用 JSON 外观。\n        // 可用 nextInt()/next() 读取空白分隔数据，或 nextLine() 读取整行。\n        // TODO: 解析输入并输出答案。\n        scanner.close();\n    }\n}\n"}'::jsonb),
('hot100',55,'46',NULL,'全排列','permutations','中等','回溯',NULL,NULL,TRUE,'https://leetcode.cn/problems/permutations/','给定一个不含重复数字的数组 nums ，返回其 所有可能的全排列 。你可以 按任意顺序 返回答案。

示例 1：

输入：nums = [1,2,3]
输出：[[1,2,3],[1,3,2],[2,1,3],[2,3,1],[3,1,2],[3,2,1]]

示例 2：

输入：nums = [0,1]
输出：[[0,1],[1,0]]

示例 3：

输入：nums = [1]
输出：[[1]]

提示：

	• 1

	• -10

	• nums 中的所有整数 互不相同','[{"input":"nums = [1,2,3]","output":"[[1,2,3],[1,3,2],[2,1,3],[2,3,1],[3,1,2],[3,2,1]]","explanation":""},{"input":"nums = [0,1]","output":"[[0,1],[1,0]]","explanation":""},{"input":"nums = [1]","output":"[[1]]","explanation":""}]'::jsonb,'[1,2,3]
[0,1]
[1]',ARRAY['数组','回溯']::text[],'{"java":"class Solution {\n    public List<List<Integer>> permute(int[] nums) {\n        \n    }\n}"}'::jsonb,'{"java":"import java.io.*;\nimport java.util.*;\n\npublic class Main {\n    public static void main(String[] args) throws Exception {\n        Scanner scanner = new Scanner(System.in);\n        // 每个参数占一行；数组、矩阵等复合参数使用 JSON 外观。\n        // 可用 nextInt()/next() 读取空白分隔数据，或 nextLine() 读取整行。\n        // TODO: 解析输入并输出答案。\n        scanner.close();\n    }\n}\n"}'::jsonb),
('hot100',56,'78',NULL,'子集','subsets','中等','回溯',NULL,NULL,TRUE,'https://leetcode.cn/problems/subsets/','给你一个整数数组 nums ，数组中的元素 互不相同 。返回该数组所有可能的子集（幂集）。

解集 不能 包含重复的子集。你可以按 任意顺序 返回解集。

示例 1：

输入：nums = [1,2,3]
输出：[[],[1],[2],[1,2],[3],[1,3],[2,3],[1,2,3]]

示例 2：

输入：nums = [0]
输出：[[],[0]]

提示：

	• 1

	• -10

	• nums 中的所有元素 互不相同','[{"input":"nums = [1,2,3]","output":"[[],[1],[2],[1,2],[3],[1,3],[2,3],[1,2,3]]","explanation":""},{"input":"nums = [0]","output":"[[],[0]]","explanation":""}]'::jsonb,'[1,2,3]
[0]',ARRAY['位运算','数组','回溯']::text[],'{"java":"class Solution {\n    public List<List<Integer>> subsets(int[] nums) {\n        \n    }\n}"}'::jsonb,'{"java":"import java.io.*;\nimport java.util.*;\n\npublic class Main {\n    public static void main(String[] args) throws Exception {\n        Scanner scanner = new Scanner(System.in);\n        // 每个参数占一行；数组、矩阵等复合参数使用 JSON 外观。\n        // 可用 nextInt()/next() 读取空白分隔数据，或 nextLine() 读取整行。\n        // TODO: 解析输入并输出答案。\n        scanner.close();\n    }\n}\n"}'::jsonb),
('hot100',57,'17',NULL,'电话号码的字母组合','letter-combinations-of-a-phone-number','中等','回溯',NULL,NULL,FALSE,'https://leetcode.cn/problems/letter-combinations-of-a-phone-number/','给定一个仅包含数字 2-9 的字符串，返回所有它能表示的字母组合。答案可以按 任意顺序 返回。

给出数字到字母的映射如下（与电话按键相同）。注意 1 不对应任何字母。

示例 1：

输入：digits = "23"
输出：["ad","ae","af","bd","be","bf","cd","ce","cf"]

示例 2：

输入：digits = "2"
输出：["a","b","c"]

提示：

	• 1

	• digits[i] 是范围 [''2'', ''9''] 的一个数字。','[{"input":"digits = \"23\"","output":"[\"ad\",\"ae\",\"af\",\"bd\",\"be\",\"bf\",\"cd\",\"ce\",\"cf\"]","explanation":""},{"input":"digits = \"2\"","output":"[\"a\",\"b\",\"c\"]","explanation":""}]'::jsonb,'"23"
"2"',ARRAY['哈希表','字符串','回溯']::text[],'{"java":"class Solution {\n    public List<String> letterCombinations(String digits) {\n        \n    }\n}"}'::jsonb,'{"java":"import java.io.*;\nimport java.util.*;\n\npublic class Main {\n    public static void main(String[] args) throws Exception {\n        Scanner scanner = new Scanner(System.in);\n        // 每个参数占一行；数组、矩阵等复合参数使用 JSON 外观。\n        // 可用 nextInt()/next() 读取空白分隔数据，或 nextLine() 读取整行。\n        // TODO: 解析输入并输出答案。\n        scanner.close();\n    }\n}\n"}'::jsonb),
('hot100',58,'39',NULL,'组合总和','combination-sum','中等','回溯',NULL,NULL,TRUE,'https://leetcode.cn/problems/combination-sum/','给你一个 无重复元素 的整数数组 candidates 和一个目标整数 target ，找出 candidates 中可以使数字和为目标数 target 的 所有 不同组合 ，并以列表形式返回。你可以按 任意顺序 返回这些组合。

candidates 中的 同一个 数字可以 无限制重复被选取 。如果至少一个数字的被选数量不同，则两种组合是不同的。

对于给定的输入，保证和为 target 的不同组合数少于 150 个。

示例 1：

输入：candidates = [2,3,6,7], target = 7
输出：[[2,2,3],[7]]
解释：
2 和 3 可以形成一组候选，2 + 2 + 3 = 7 。注意 2 可以使用多次。
7 也是一个候选， 7 = 7 。
仅有这两种组合。

示例 2：

输入: candidates = [2,3,5], target = 8
输出: [[2,2,2,2],[2,3,3],[3,5]]

示例 3：

输入: candidates = [2], target = 1
输出: []

提示：

	• 1

	• 2

	• candidates 的所有元素 互不相同

	• 1','[{"input":"candidates = [2,3,6,7], target = 7","output":"[[2,2,3],[7]]","explanation":"2 和 3 可以形成一组候选，2 + 2 + 3 = 7 。注意 2 可以使用多次。\n7 也是一个候选， 7 = 7 。\n仅有这两种组合。"},{"input":"candidates = [2,3,5], target = 8","output":"[[2,2,2,2],[2,3,3],[3,5]]","explanation":""},{"input":"candidates = [2], target = 1","output":"[]","explanation":""}]'::jsonb,'[2,3,6,7]
7
[2,3,5]
8
[2]
1',ARRAY['数组','回溯']::text[],'{"java":"class Solution {\n    public List<List<Integer>> combinationSum(int[] candidates, int target) {\n        \n    }\n}"}'::jsonb,'{"java":"import java.io.*;\nimport java.util.*;\n\npublic class Main {\n    public static void main(String[] args) throws Exception {\n        Scanner scanner = new Scanner(System.in);\n        // 每个参数占一行；数组、矩阵等复合参数使用 JSON 外观。\n        // 可用 nextInt()/next() 读取空白分隔数据，或 nextLine() 读取整行。\n        // TODO: 解析输入并输出答案。\n        scanner.close();\n    }\n}\n"}'::jsonb),
('hot100',59,'22',NULL,'括号生成','generate-parentheses','中等','回溯',NULL,NULL,TRUE,'https://leetcode.cn/problems/generate-parentheses/','数字 n 代表生成括号的对数，请你设计一个函数，用于能够生成所有可能的并且 有效的 括号组合。

示例 1：

输入：n = 3
输出：["((()))","(()())","(())()","()(())","()()()"]

示例 2：

输入：n = 1
输出：["()"]

提示：

	• 1','[{"input":"n = 3","output":"[\"((()))\",\"(()())\",\"(())()\",\"()(())\",\"()()()\"]","explanation":""},{"input":"n = 1","output":"[\"()\"]","explanation":""}]'::jsonb,'3
1',ARRAY['字符串','动态规划','回溯','bracket-sequences']::text[],'{"java":"class Solution {\n    public List<String> generateParenthesis(int n) {\n        \n    }\n}"}'::jsonb,'{"java":"import java.io.*;\nimport java.util.*;\n\npublic class Main {\n    public static void main(String[] args) throws Exception {\n        Scanner scanner = new Scanner(System.in);\n        // 每个参数占一行；数组、矩阵等复合参数使用 JSON 外观。\n        // 可用 nextInt()/next() 读取空白分隔数据，或 nextLine() 读取整行。\n        // TODO: 解析输入并输出答案。\n        scanner.close();\n    }\n}\n"}'::jsonb),
('hot100',60,'79',NULL,'单词搜索','word-search','中等','回溯',NULL,NULL,FALSE,'https://leetcode.cn/problems/word-search/','给定一个 m x n 二维字符网格 board 和一个字符串单词 word 。如果 word 存在于网格中，返回 true ；否则，返回 false 。

单词必须按照字母顺序，通过相邻的单元格内的字母构成，其中“相邻”单元格是那些水平相邻或垂直相邻的单元格。同一个单元格内的字母不允许被重复使用。

示例 1：

输入：board = [[''A'',''B'',''C'',''E''],[''S'',''F'',''C'',''S''],[''A'',''D'',''E'',''E'']], word = "ABCCED"
输出：true

示例 2：

输入：board = [[''A'',''B'',''C'',''E''],[''S'',''F'',''C'',''S''],[''A'',''D'',''E'',''E'']], word = "SEE"
输出：true

示例 3：

输入：board = [[''A'',''B'',''C'',''E''],[''S'',''F'',''C'',''S''],[''A'',''D'',''E'',''E'']], word = "ABCB"
输出：false

提示：

	• m == board.length

	• n = board[i].length

	• 1

	• 1

	• board 和 word 仅由大小写英文字母组成

进阶：你可以使用搜索剪枝的技术来优化解决方案，使其在 board 更大的情况下可以更快解决问题？','[{"input":"board = [[''A'',''B'',''C'',''E''],[''S'',''F'',''C'',''S''],[''A'',''D'',''E'',''E'']], word = \"ABCCED\"","output":"true","explanation":""},{"input":"board = [[''A'',''B'',''C'',''E''],[''S'',''F'',''C'',''S''],[''A'',''D'',''E'',''E'']], word = \"SEE\"","output":"true","explanation":""},{"input":"board = [[''A'',''B'',''C'',''E''],[''S'',''F'',''C'',''S''],[''A'',''D'',''E'',''E'']], word = \"ABCB\"","output":"false","explanation":""}]'::jsonb,'[["A","B","C","E"],["S","F","C","S"],["A","D","E","E"]]
"ABCCED"
[["A","B","C","E"],["S","F","C","S"],["A","D","E","E"]]
"SEE"
[["A","B","C","E"],["S","F","C","S"],["A","D","E","E"]]
"ABCB"',ARRAY['深度优先搜索','数组','字符串','回溯','矩阵']::text[],'{"java":"class Solution {\n    public boolean exist(char[][] board, String word) {\n        \n    }\n}"}'::jsonb,'{"java":"import java.io.*;\nimport java.util.*;\n\npublic class Main {\n    public static void main(String[] args) throws Exception {\n        Scanner scanner = new Scanner(System.in);\n        // 每个参数占一行；数组、矩阵等复合参数使用 JSON 外观。\n        // 可用 nextInt()/next() 读取空白分隔数据，或 nextLine() 读取整行。\n        // TODO: 解析输入并输出答案。\n        scanner.close();\n    }\n}\n"}'::jsonb),
('hot100',61,'131',NULL,'分割回文串','palindrome-partitioning','中等','回溯',NULL,NULL,FALSE,'https://leetcode.cn/problems/palindrome-partitioning/','给你一个字符串 s，请你将 s 分割成一些 子串，使每个子串都是 回文串 。返回 s 所有可能的分割方案。

示例 1：

输入：s = "aab"
输出：[["a","a","b"],["aa","b"]]

示例 2：

输入：s = "a"
输出：[["a"]]

提示：

	• 1

	• s 仅由小写英文字母组成','[{"input":"s = \"aab\"","output":"[[\"a\",\"a\",\"b\"],[\"aa\",\"b\"]]","explanation":""},{"input":"s = \"a\"","output":"[[\"a\"]]","explanation":""}]'::jsonb,'"aab"
"a"',ARRAY['字符串','动态规划','回溯']::text[],'{"java":"class Solution {\n    public List<List<String>> partition(String s) {\n        \n    }\n}"}'::jsonb,'{"java":"import java.io.*;\nimport java.util.*;\n\npublic class Main {\n    public static void main(String[] args) throws Exception {\n        Scanner scanner = new Scanner(System.in);\n        // 每个参数占一行；数组、矩阵等复合参数使用 JSON 外观。\n        // 可用 nextInt()/next() 读取空白分隔数据，或 nextLine() 读取整行。\n        // TODO: 解析输入并输出答案。\n        scanner.close();\n    }\n}\n"}'::jsonb),
('hot100',62,'51',NULL,'N 皇后','n-queens','困难','回溯',NULL,NULL,FALSE,'https://leetcode.cn/problems/n-queens/','按照国际象棋的规则，皇后可以攻击与之处在同一行或同一列或同一斜线上的棋子。

n 皇后问题 研究的是如何将 n 个皇后放置在 n×n 的棋盘上，并且使皇后彼此之间不能相互攻击。

给你一个整数 n ，返回所有不同的 n 皇后问题 的解决方案。

每一种解法包含一个不同的 n 皇后问题 的棋子放置方案，该方案中 ''Q'' 和 ''.'' 分别代表了皇后和空位。

示例 1：

输入：n = 4
输出：[[".Q..","...Q","Q...","..Q."],["..Q.","Q...","...Q",".Q.."]]
解释：如上图所示，4 皇后问题存在两个不同的解法。

示例 2：

输入：n = 1
输出：[["Q"]]

提示：

	• 1','[{"input":"n = 4","output":"[[\".Q..\",\"...Q\",\"Q...\",\"..Q.\"],[\"..Q.\",\"Q...\",\"...Q\",\".Q..\"]]","explanation":"如上图所示，4 皇后问题存在两个不同的解法。"},{"input":"n = 1","output":"[[\"Q\"]]","explanation":""}]'::jsonb,'4
1',ARRAY['数组','回溯','algorithm-x']::text[],'{"java":"class Solution {\n    public List<List<String>> solveNQueens(int n) {\n        \n    }\n}"}'::jsonb,'{"java":"import java.io.*;\nimport java.util.*;\n\npublic class Main {\n    public static void main(String[] args) throws Exception {\n        Scanner scanner = new Scanner(System.in);\n        // 每个参数占一行；数组、矩阵等复合参数使用 JSON 外观。\n        // 可用 nextInt()/next() 读取空白分隔数据，或 nextLine() 读取整行。\n        // TODO: 解析输入并输出答案。\n        scanner.close();\n    }\n}\n"}'::jsonb),
('hot100',63,'35',NULL,'搜索插入位置','search-insert-position','简单','二分查找',NULL,NULL,FALSE,'https://leetcode.cn/problems/search-insert-position/','给定一个排序数组和一个目标值，在数组中找到目标值，并返回其索引。如果目标值不存在于数组中，返回它将会被按顺序插入的位置。

请必须使用时间复杂度为 O(log n) 的算法。

示例 1:

输入: nums = [1,3,5,6], target = 5
输出: 2

示例 2:

输入: nums = [1,3,5,6], target = 2
输出: 1

示例 3:

输入: nums = [1,3,5,6], target = 7
输出: 4

提示:

	• 1 4

	• -104 4

	• nums 为 无重复元素 的 升序 排列数组

	• -104 4','[{"input":"nums = [1,3,5,6], target = 5","output":"2","explanation":""},{"input":"nums = [1,3,5,6], target = 2","output":"1","explanation":""},{"input":"nums = [1,3,5,6], target = 7","output":"4","explanation":""}]'::jsonb,'[1,3,5,6]
5
[1,3,5,6]
2
[1,3,5,6]
7',ARRAY['数组','二分查找']::text[],'{"java":"class Solution {\n    public int searchInsert(int[] nums, int target) {\n        \n    }\n}"}'::jsonb,'{"java":"import java.io.*;\nimport java.util.*;\n\npublic class Main {\n    public static void main(String[] args) throws Exception {\n        Scanner scanner = new Scanner(System.in);\n        // 每个参数占一行；数组、矩阵等复合参数使用 JSON 外观。\n        // 可用 nextInt()/next() 读取空白分隔数据，或 nextLine() 读取整行。\n        // TODO: 解析输入并输出答案。\n        scanner.close();\n    }\n}\n"}'::jsonb),
('hot100',64,'74',NULL,'搜索二维矩阵','search-a-2d-matrix','中等','二分查找',NULL,NULL,FALSE,'https://leetcode.cn/problems/search-a-2d-matrix/','给你一个满足下述两条属性的 m x n 整数矩阵：

	• 每行中的整数从左到右按非严格递增顺序排列。

	• 每行的第一个整数大于前一行的最后一个整数。

给你一个整数 target ，如果 target 在矩阵中，返回 true ；否则，返回 false 。

你必须编写一个时间复杂度为 O(log(m * n)) 的解决方案。

示例 1：

输入：matrix = [[1,3,5,7],[10,11,16,20],[23,30,34,60]], target = 3
输出：true

示例 2：

输入：matrix = [[1,3,5,7],[10,11,16,20],[23,30,34,60]], target = 13
输出：false

提示：

	• m == matrix.length

	• n == matrix[i].length

	• 1

	• -104 4','[{"input":"matrix = [[1,3,5,7],[10,11,16,20],[23,30,34,60]], target = 3","output":"true","explanation":""},{"input":"matrix = [[1,3,5,7],[10,11,16,20],[23,30,34,60]], target = 13","output":"false","explanation":""}]'::jsonb,'[[1,3,5,7],[10,11,16,20],[23,30,34,60]]
3
[[1,3,5,7],[10,11,16,20],[23,30,34,60]]
13',ARRAY['数组','二分查找','矩阵']::text[],'{"java":"class Solution {\n    public boolean searchMatrix(int[][] matrix, int target) {\n        \n    }\n}"}'::jsonb,'{"java":"import java.io.*;\nimport java.util.*;\n\npublic class Main {\n    public static void main(String[] args) throws Exception {\n        Scanner scanner = new Scanner(System.in);\n        // 每个参数占一行；数组、矩阵等复合参数使用 JSON 外观。\n        // 可用 nextInt()/next() 读取空白分隔数据，或 nextLine() 读取整行。\n        // TODO: 解析输入并输出答案。\n        scanner.close();\n    }\n}\n"}'::jsonb),
('hot100',65,'34',NULL,'在排序数组中查找元素的第一个和最后一个位置','find-first-and-last-position-of-element-in-sorted-array','中等','二分查找',NULL,NULL,TRUE,'https://leetcode.cn/problems/find-first-and-last-position-of-element-in-sorted-array/','给你一个按照非递减顺序排列的整数数组 nums，和一个目标值 target。请你找出给定目标值在数组中的开始位置和结束位置。

如果数组中不存在目标值 target，返回 [-1, -1]。

你必须设计并实现时间复杂度为 O(log n) 的算法解决此问题。

示例 1：

输入：nums = [5,7,7,8,8,10], target = 8
输出：[3,4]

示例 2：

输入：nums = [5,7,7,8,8,10], target = 6
输出：[-1,-1]

示例 3：

输入：nums = [], target = 0
输出：[-1,-1]

提示：

	• 0 5

	• -109 9

	• nums 是一个非递减数组

	• -109 9','[{"input":"nums = [5,7,7,8,8,10], target = 8","output":"[3,4]","explanation":""},{"input":"nums = [5,7,7,8,8,10], target = 6","output":"[-1,-1]","explanation":""},{"input":"nums = [], target = 0","output":"[-1,-1]","explanation":""}]'::jsonb,'[5,7,7,8,8,10]
8
[5,7,7,8,8,10]
6
[]
0',ARRAY['数组','二分查找']::text[],'{"java":"class Solution {\n    public int[] searchRange(int[] nums, int target) {\n        \n    }\n}"}'::jsonb,'{"java":"import java.io.*;\nimport java.util.*;\n\npublic class Main {\n    public static void main(String[] args) throws Exception {\n        Scanner scanner = new Scanner(System.in);\n        // 每个参数占一行；数组、矩阵等复合参数使用 JSON 外观。\n        // 可用 nextInt()/next() 读取空白分隔数据，或 nextLine() 读取整行。\n        // TODO: 解析输入并输出答案。\n        scanner.close();\n    }\n}\n"}'::jsonb),
('hot100',66,'33',NULL,'搜索旋转排序数组','search-in-rotated-sorted-array','中等','二分查找',NULL,NULL,TRUE,'https://leetcode.cn/problems/search-in-rotated-sorted-array/','整数数组 nums 按升序排列，数组中的值 互不相同 。

在传递给函数之前，nums 在预先未知的某个下标 k（0 ）上进行了 向左旋转，使数组变为 [nums[k], nums[k+1], ..., nums[n-1], nums[0], nums[1], ..., nums[k-1]]（下标 从 0 开始 计数）。例如， [0,1,2,4,5,6,7] 下标 3 上向左旋转后可能变为 [4,5,6,7,0,1,2] 。

给你 旋转后 的数组 nums 和一个整数 target ，如果 nums 中存在这个目标值 target ，则返回它的下标，否则返回 -1 。

你必须设计一个时间复杂度为 O(log n) 的算法解决此问题。

示例 1：

输入：nums = [4,5,6,7,0,1,2], target = 0
输出：4

示例 2：

输入：nums = [4,5,6,7,0,1,2], target = 3
输出：-1

示例 3：

输入：nums = [1], target = 0
输出：-1

提示：

	• 1

	• -104 4

	• nums 中的每个值都 独一无二

	• 题目数据保证 nums 在预先未知的某个下标上进行了旋转

	• -104 4','[{"input":"nums = [4,5,6,7,0,1,2], target = 0","output":"4","explanation":""},{"input":"nums = [4,5,6,7,0,1,2], target = 3","output":"-1","explanation":""},{"input":"nums = [1], target = 0","output":"-1","explanation":""}]'::jsonb,'[4,5,6,7,0,1,2]
0
[4,5,6,7,0,1,2]
3
[1]
0',ARRAY['数组','二分查找']::text[],'{"java":"class Solution {\n    public int search(int[] nums, int target) {\n        \n    }\n}"}'::jsonb,'{"java":"import java.io.*;\nimport java.util.*;\n\npublic class Main {\n    public static void main(String[] args) throws Exception {\n        Scanner scanner = new Scanner(System.in);\n        // 每个参数占一行；数组、矩阵等复合参数使用 JSON 外观。\n        // 可用 nextInt()/next() 读取空白分隔数据，或 nextLine() 读取整行。\n        // TODO: 解析输入并输出答案。\n        scanner.close();\n    }\n}\n"}'::jsonb),
('hot100',67,'153',NULL,'寻找旋转排序数组中的最小值','find-minimum-in-rotated-sorted-array','中等','二分查找',NULL,NULL,FALSE,'https://leetcode.cn/problems/find-minimum-in-rotated-sorted-array/','已知一个长度为 n 的数组，预先按照升序排列，经由 1 到 n 次 旋转 后，得到输入数组。例如，原数组 nums = [0,1,2,4,5,6,7] 在变化后可能得到：

	• 若旋转 4 次，则可以得到 [4,5,6,7,0,1,2]

	• 若旋转 7 次，则可以得到 [0,1,2,4,5,6,7]

注意，数组 [a[0], a[1], a[2], ..., a[n-1]] 旋转一次 的结果为数组 [a[n-1], a[0], a[1], a[2], ..., a[n-2]] 。

给你一个元素值 互不相同 的数组 nums ，它原来是一个升序排列的数组，并按上述情形进行了多次旋转。请你找出并返回数组中的 最小元素 。

你必须设计一个时间复杂度为 O(log n) 的算法解决此问题。

示例 1：

输入：nums = [3,4,5,1,2]
输出：1
解释：原数组为 [1,2,3,4,5] ，旋转 3 次得到输入数组。

示例 2：

输入：nums = [4,5,6,7,0,1,2]
输出：0
解释：原数组为 [0,1,2,4,5,6,7] ，旋转 4 次得到输入数组。

示例 3：

输入：nums = [11,13,15,17]
输出：11
解释：原数组为 [11,13,15,17] ，旋转 4 次得到输入数组。

提示：

	• n == nums.length

	• 1

	• -5000

	• nums 中的所有整数 互不相同

	• nums 原来是一个升序排序的数组，并进行了 1 至 n 次旋转','[{"input":"nums = [3,4,5,1,2]","output":"1","explanation":"原数组为 [1,2,3,4,5] ，旋转 3 次得到输入数组。"},{"input":"nums = [4,5,6,7,0,1,2]","output":"0","explanation":"原数组为 [0,1,2,4,5,6,7] ，旋转 4 次得到输入数组。"},{"input":"nums = [11,13,15,17]","output":"11","explanation":"原数组为 [11,13,15,17] ，旋转 4 次得到输入数组。"}]'::jsonb,'[3,4,5,1,2]
[4,5,6,7,0,1,2]
[11,13,15,17]',ARRAY['数组','二分查找']::text[],'{"java":"class Solution {\n    public int findMin(int[] nums) {\n        \n    }\n}"}'::jsonb,'{"java":"import java.io.*;\nimport java.util.*;\n\npublic class Main {\n    public static void main(String[] args) throws Exception {\n        Scanner scanner = new Scanner(System.in);\n        // 每个参数占一行；数组、矩阵等复合参数使用 JSON 外观。\n        // 可用 nextInt()/next() 读取空白分隔数据，或 nextLine() 读取整行。\n        // TODO: 解析输入并输出答案。\n        scanner.close();\n    }\n}\n"}'::jsonb),
('hot100',68,'4',NULL,'寻找两个正序数组的中位数','median-of-two-sorted-arrays','困难','二分查找',NULL,NULL,TRUE,'https://leetcode.cn/problems/median-of-two-sorted-arrays/','给定两个大小分别为 m 和 n 的正序（从小到大）数组 nums1 和 nums2。请你找出并返回这两个正序数组的 中位数 。

算法的时间复杂度应该为 O(log (m+n)) 。

示例 1：

输入：nums1 = [1,3], nums2 = [2]
输出：2.00000
解释：合并数组 = [1,2,3] ，中位数 2

示例 2：

输入：nums1 = [1,2], nums2 = [3,4]
输出：2.50000
解释：合并数组 = [1,2,3,4] ，中位数 (2 + 3) / 2 = 2.5

提示：

	• nums1.length == m

	• nums2.length == n

	• 0

	• 0

	• 1

	• -106 6','[{"input":"nums1 = [1,3], nums2 = [2]","output":"2.00000","explanation":"合并数组 = [1,2,3] ，中位数 2"},{"input":"nums1 = [1,2], nums2 = [3,4]","output":"2.50000","explanation":"合并数组 = [1,2,3,4] ，中位数 (2 + 3) / 2 = 2.5"}]'::jsonb,'[1,3]
[2]
[1,2]
[3,4]',ARRAY['数组','二分查找','分治']::text[],'{"java":"class Solution {\n    public double findMedianSortedArrays(int[] nums1, int[] nums2) {\n        \n    }\n}"}'::jsonb,'{"java":"import java.io.*;\nimport java.util.*;\n\npublic class Main {\n    public static void main(String[] args) throws Exception {\n        Scanner scanner = new Scanner(System.in);\n        // 每个参数占一行；数组、矩阵等复合参数使用 JSON 外观。\n        // 可用 nextInt()/next() 读取空白分隔数据，或 nextLine() 读取整行。\n        // TODO: 解析输入并输出答案。\n        scanner.close();\n    }\n}\n"}'::jsonb),
('hot100',69,'20',NULL,'有效的括号','valid-parentheses','简单','栈',NULL,NULL,TRUE,'https://leetcode.cn/problems/valid-parentheses/','给定一个只包括 ''(''，'')''，''{''，''}''，''[''，'']'' 的字符串 s ，判断字符串是否有效。

有效字符串需满足：

	• 左括号必须用相同类型的右括号闭合。

	• 左括号必须以正确的顺序闭合。

	• 每个右括号都有一个对应的相同类型的左括号。

示例 1：

输入：s = "()"

输出：true

示例 2：

输入：s = "()[]{}"

输出：true

示例 3：

输入：s = "(]"

输出：false

示例 4：

输入：s = "([])"

输出：true

示例 5：

输入：s = "([)]"

输出：false

提示：

	• 1 4

	• s 仅由括号 ''()[]{}'' 组成','[{"input":"s = \"()\"","output":"true","explanation":""},{"input":"s = \"()[]{}\"","output":"true","explanation":""},{"input":"s = \"(]\"","output":"false","explanation":""},{"input":"s = \"([])\"","output":"true","explanation":""}]'::jsonb,'"()"
"()[]{}"
"(]"
"([])"
"([)]"',ARRAY['栈','字符串','bracket-sequences']::text[],'{"java":"class Solution {\n    public boolean isValid(String s) {\n        \n    }\n}"}'::jsonb,'{"java":"import java.io.*;\nimport java.util.*;\n\npublic class Main {\n    public static void main(String[] args) throws Exception {\n        Scanner scanner = new Scanner(System.in);\n        // 每个参数占一行；数组、矩阵等复合参数使用 JSON 外观。\n        // 可用 nextInt()/next() 读取空白分隔数据，或 nextLine() 读取整行。\n        // TODO: 解析输入并输出答案。\n        scanner.close();\n    }\n}\n"}'::jsonb),
('hot100',70,'155',NULL,'最小栈','min-stack','中等','栈',NULL,NULL,TRUE,'https://leetcode.cn/problems/min-stack/','设计一个支持 push ，pop ，top 操作，并能在常数时间内检索到最小元素的栈。

实现 MinStack 类:

	• MinStack() 初始化堆栈对象。

	• void push(int value) 将元素 value 推入堆栈。

	• void pop() 删除堆栈顶部的元素。

	• int top() 获取堆栈顶部的元素。

	• int getMin() 获取堆栈中的最小元素。

示例 1:

输入：
["MinStack","push","push","push","getMin","pop","top","getMin"]
[[],[-2],[0],[-3],[],[],[],[]]

输出：
[null,null,null,null,-3,null,0,-2]

解释：
MinStack minStack = new MinStack();
minStack.push(-2);
minStack.push(0);
minStack.push(-3);
minStack.getMin();   --> 返回 -3.
minStack.pop();
minStack.top();      --> 返回 0.
minStack.getMin();   --> 返回 -2.

提示：

	• -231 31 - 1

	• pop、top 和 getMin 操作总是在 非空栈 上调用

	• push, pop, top, and getMin最多被调用 3 * 104 次','[{"input":"[\"MinStack\",\"push\",\"push\",\"push\",\"getMin\",\"pop\",\"top\",\"getMin\"]\n[[],[-2],[0],[-3],[],[],[],[]]","output":"[null,null,null,null,-3,null,0,-2]","explanation":"MinStack minStack = new MinStack();\nminStack.push(-2);\nminStack.push(0);\nminStack.push(-3);\nminStack.getMin();   --> 返回 -3.\nminStack.pop();\nminStack.top();      --> 返回 0.\nminStack.getMin();   --> 返回 -2."}]'::jsonb,'["MinStack","push","push","push","getMin","pop","top","getMin"]
[[],[-2],[0],[-3],[],[],[],[]]',ARRAY['栈','设计']::text[],'{"java":"class MinStack {\n\n    public MinStack() {\n        \n    }\n    \n    public void push(int value) {\n        \n    }\n    \n    public void pop() {\n        \n    }\n    \n    public int top() {\n        \n    }\n    \n    public int getMin() {\n        \n    }\n}\n\n/**\n * Your MinStack object will be instantiated and called as such:\n * MinStack obj = new MinStack();\n * obj.push(value);\n * obj.pop();\n * int param_3 = obj.top();\n * int param_4 = obj.getMin();\n */"}'::jsonb,'{"java":"import java.io.*;\nimport java.util.*;\n\npublic class Main {\n    public static void main(String[] args) throws Exception {\n        Scanner scanner = new Scanner(System.in);\n        // 每个参数占一行；数组、矩阵等复合参数使用 JSON 外观。\n        // 可用 nextInt()/next() 读取空白分隔数据，或 nextLine() 读取整行。\n        // TODO: 解析输入并输出答案。\n        scanner.close();\n    }\n}\n"}'::jsonb),
('hot100',71,'394',NULL,'字符串解码','decode-string','中等','栈',NULL,NULL,TRUE,'https://leetcode.cn/problems/decode-string/','给定一个经过编码的字符串，返回它解码后的字符串。

编码规则为: k[encoded_string]，表示其中方括号内部的 encoded_string 正好重复 k 次。注意 k 保证为正整数。

你可以认为输入字符串总是有效的；输入字符串中没有额外的空格，且输入的方括号总是符合格式要求的。

此外，你可以认为原始数据不包含数字，所有的数字只表示重复的次数 k ，例如不会出现像 3a 或 2[4] 的输入。

测试用例保证输出的长度不会超过 105。

示例 1：

输入：s = "3[a]2[bc]"
输出："aaabcbc"

示例 2：

输入：s = "3[a2[c]]"
输出："accaccacc"

示例 3：

输入：s = "2[abc]3[cd]ef"
输出："abcabccdcdcdef"

示例 4：

输入：s = "abc3[cd]xyz"
输出："abccdcdcdxyz"

提示：

	• 1

	• s 由小写英文字母、数字和方括号 ''[]'' 组成

	• s 保证是一个 有效 的输入。

	• s 中所有整数的取值范围为 [1, 300]','[{"input":"s = \"3[a]2[bc]\"","output":"\"aaabcbc\"","explanation":""},{"input":"s = \"3[a2[c]]\"","output":"\"accaccacc\"","explanation":""},{"input":"s = \"2[abc]3[cd]ef\"","output":"\"abcabccdcdcdef\"","explanation":""},{"input":"s = \"abc3[cd]xyz\"","output":"\"abccdcdcdxyz\"","explanation":""}]'::jsonb,'"3[a]2[bc]"
"3[a2[c]]"
"2[abc]3[cd]ef"',ARRAY['栈','递归','字符串']::text[],'{"java":"class Solution {\n    public String decodeString(String s) {\n        \n    }\n}"}'::jsonb,'{"java":"import java.io.*;\nimport java.util.*;\n\npublic class Main {\n    public static void main(String[] args) throws Exception {\n        Scanner scanner = new Scanner(System.in);\n        // 每个参数占一行；数组、矩阵等复合参数使用 JSON 外观。\n        // 可用 nextInt()/next() 读取空白分隔数据，或 nextLine() 读取整行。\n        // TODO: 解析输入并输出答案。\n        scanner.close();\n    }\n}\n"}'::jsonb),
('hot100',72,'739',NULL,'每日温度','daily-temperatures','中等','栈',NULL,NULL,FALSE,'https://leetcode.cn/problems/daily-temperatures/','给定一个整数数组 temperatures ，表示每天的温度，返回一个数组 answer ，其中 answer[i] 是指对于第 i 天，下一个更高温度出现在几天后。如果气温在这之后都不会升高，请在该位置用 0 来代替。

示例 1:

输入: temperatures = [73,74,75,71,69,72,76,73]
输出: [1,1,4,2,1,1,0,0]

示例 2:

输入: temperatures = [30,40,50,60]
输出: [1,1,1,0]

示例 3:

输入: temperatures = [30,60,90]
输出: [1,1,0]

提示：

	• 1 5

	• 30','[{"input":"temperatures = [73,74,75,71,69,72,76,73]","output":"[1,1,4,2,1,1,0,0]","explanation":""},{"input":"temperatures = [30,40,50,60]","output":"[1,1,1,0]","explanation":""},{"input":"temperatures = [30,60,90]","output":"[1,1,0]","explanation":""}]'::jsonb,'[73,74,75,71,69,72,76,73]
[30,40,50,60]
[30,60,90]',ARRAY['栈','数组','单调栈']::text[],'{"java":"class Solution {\n    public int[] dailyTemperatures(int[] temperatures) {\n        \n    }\n}"}'::jsonb,'{"java":"import java.io.*;\nimport java.util.*;\n\npublic class Main {\n    public static void main(String[] args) throws Exception {\n        Scanner scanner = new Scanner(System.in);\n        // 每个参数占一行；数组、矩阵等复合参数使用 JSON 外观。\n        // 可用 nextInt()/next() 读取空白分隔数据，或 nextLine() 读取整行。\n        // TODO: 解析输入并输出答案。\n        scanner.close();\n    }\n}\n"}'::jsonb),
('hot100',73,'84',NULL,'柱状图中最大的矩形','largest-rectangle-in-histogram','困难','栈',NULL,NULL,FALSE,'https://leetcode.cn/problems/largest-rectangle-in-histogram/','给定 n 个非负整数，用来表示柱状图中各个柱子的高度。每个柱子彼此相邻，且宽度为 1 。

求在该柱状图中，能够勾勒出来的矩形的最大面积。

 

示例 1:

输入：heights = [2,1,5,6,2,3]
输出：10
解释：最大的矩形为图中红色区域，面积为 10

示例 2：

输入： heights = [2,4]
输出： 4

 

提示：

	• 1 5

	• 0 4','[{"input":"heights = [2,1,5,6,2,3]","output":"10","explanation":"最大的矩形为图中红色区域，面积为 10"},{"input":"heights = [2,4]","output":"4","explanation":""}]'::jsonb,'[2,1,5,6,2,3]
[2,4]',ARRAY['栈','数组','单调栈','range-minimum-maximum-query']::text[],'{"java":"class Solution {\n    public int largestRectangleArea(int[] heights) {\n        \n    }\n}"}'::jsonb,'{"java":"import java.io.*;\nimport java.util.*;\n\npublic class Main {\n    public static void main(String[] args) throws Exception {\n        Scanner scanner = new Scanner(System.in);\n        // 每个参数占一行；数组、矩阵等复合参数使用 JSON 外观。\n        // 可用 nextInt()/next() 读取空白分隔数据，或 nextLine() 读取整行。\n        // TODO: 解析输入并输出答案。\n        scanner.close();\n    }\n}\n"}'::jsonb),
('hot100',74,'215',NULL,'数组中的第K个最大元素','kth-largest-element-in-an-array','中等','堆',NULL,NULL,TRUE,'https://leetcode.cn/problems/kth-largest-element-in-an-array/','给定整数数组 nums 和整数 k，请返回数组中第 k 个最大的元素。

请注意，你需要找的是数组排序后的第 k 个最大的元素，而不是第 k 个不同的元素。

你必须设计并实现时间复杂度为 O(n) 的算法解决此问题。

示例 1:

输入: [3,2,1,5,6,4], k = 2
输出: 5

示例 2:

输入: [3,2,3,1,2,4,5,5,6], k = 4
输出: 4

提示：

	• 1 5

	• -104 4','[{"input":"[3,2,1,5,6,4], k = 2","output":"5","explanation":""},{"input":"[3,2,3,1,2,4,5,5,6], k = 4","output":"4","explanation":""}]'::jsonb,'[3,2,1,5,6,4]
2
[3,2,3,1,2,4,5,5,6]
4',ARRAY['数组','分治','快速选择','排序','堆（优先队列）']::text[],'{"java":"class Solution {\n    public int findKthLargest(int[] nums, int k) {\n        \n    }\n}"}'::jsonb,'{"java":"import java.io.*;\nimport java.util.*;\n\npublic class Main {\n    public static void main(String[] args) throws Exception {\n        Scanner scanner = new Scanner(System.in);\n        // 每个参数占一行；数组、矩阵等复合参数使用 JSON 外观。\n        // 可用 nextInt()/next() 读取空白分隔数据，或 nextLine() 读取整行。\n        // TODO: 解析输入并输出答案。\n        scanner.close();\n    }\n}\n"}'::jsonb),
('hot100',75,'347',NULL,'前 K 个高频元素','top-k-frequent-elements','中等','堆',NULL,NULL,FALSE,'https://leetcode.cn/problems/top-k-frequent-elements/','给你一个整数数组 nums 和一个整数 k ，请你返回其中出现频率前 k 高的元素。你可以按 任意顺序 返回答案。

示例 1：

输入：nums = [1,1,1,2,2,3], k = 2

输出：[1,2]

示例 2：

输入：nums = [1], k = 1

输出：[1]

示例 3：

输入：nums = [1,2,1,2,1,2,3,1,3,2], k = 2

输出：[1,2]

提示：

	• 1 5

	• -104 4

	• k 的取值范围是 [1, 数组中不相同的元素的个数]

	• 题目数据保证答案唯一，换句话说，数组中前 k 个高频元素的集合是唯一的

进阶：你所设计算法的时间复杂度 必须 优于 O(n log n) ，其中 n 是数组大小。','[{"input":"nums = [1,1,1,2,2,3], k = 2","output":"[1,2]","explanation":""},{"input":"nums = [1], k = 1","output":"[1]","explanation":""},{"input":"nums = [1,2,1,2,1,2,3,1,3,2], k = 2","output":"[1,2]","explanation":""}]'::jsonb,'[1,1,1,2,2,3]
2
[1]
1
[1,2,1,2,1,2,3,1,3,2]
2',ARRAY['数组','哈希表','分治','桶排序','计数','快速选择','排序','堆（优先队列）']::text[],'{"java":"class Solution {\n    public int[] topKFrequent(int[] nums, int k) {\n        \n    }\n}"}'::jsonb,'{"java":"import java.io.*;\nimport java.util.*;\n\npublic class Main {\n    public static void main(String[] args) throws Exception {\n        Scanner scanner = new Scanner(System.in);\n        // 每个参数占一行；数组、矩阵等复合参数使用 JSON 外观。\n        // 可用 nextInt()/next() 读取空白分隔数据，或 nextLine() 读取整行。\n        // TODO: 解析输入并输出答案。\n        scanner.close();\n    }\n}\n"}'::jsonb),
('hot100',76,'295',NULL,'数据流的中位数','find-median-from-data-stream','困难','堆',NULL,NULL,FALSE,'https://leetcode.cn/problems/find-median-from-data-stream/','中位数是有序整数列表中的中间值。如果列表的大小是偶数，则没有中间值，中位数是两个中间值的平均值。

	• 例如 arr = [2,3,4] 的中位数是 3 。

	• 例如 arr = [2,3] 的中位数是 (2 + 3) / 2 = 2.5 。

实现 MedianFinder 类:

	•
	MedianFinder() 初始化 MedianFinder 对象。

	•
	void addNum(int num) 将数据流中的整数 num 添加到数据结构中。

	•
	double findMedian() 返回到目前为止所有元素的中位数。与实际答案相差 10-5 以内的答案将被接受。

示例 1：

输入
["MedianFinder", "addNum", "addNum", "findMedian", "addNum", "findMedian"]
[[], [1], [2], [], [3], []]
输出
[null, null, null, 1.5, null, 2.0]

解释
MedianFinder medianFinder = new MedianFinder();
medianFinder.addNum(1);    // arr = [1]
medianFinder.addNum(2);    // arr = [1, 2]
medianFinder.findMedian(); // 返回 1.5 ((1 + 2) / 2)
medianFinder.addNum(3);    // arr[1, 2, 3]
medianFinder.findMedian(); // return 2.0

提示:

	• -105 5

	• 在调用 findMedian 之前，数据结构中至少有一个元素

	• 最多 5 * 104 次调用 addNum 和 findMedian','[{"input":"[\"MedianFinder\", \"addNum\", \"addNum\", \"findMedian\", \"addNum\", \"findMedian\"]\n[[], [1], [2], [], [3], []]","output":"[null, null, null, 1.5, null, 2.0]","explanation":"MedianFinder medianFinder = new MedianFinder();\nmedianFinder.addNum(1);    // arr = [1]\nmedianFinder.addNum(2);    // arr = [1, 2]\nmedianFinder.findMedian(); // 返回 1.5 ((1 + 2) / 2)\nmedianFinder.addNum(3);    // arr[1, 2, 3]\nmedianFinder.findMedian(); // return 2.0"}]'::jsonb,'["MedianFinder","addNum","addNum","findMedian","addNum","findMedian"]
[[],[1],[2],[],[3],[]]',ARRAY['设计','双指针','数据流','排序','堆（优先队列）']::text[],'{"java":"class MedianFinder {\n\n    public MedianFinder() {\n        \n    }\n    \n    public void addNum(int num) {\n        \n    }\n    \n    public double findMedian() {\n        \n    }\n}\n\n/**\n * Your MedianFinder object will be instantiated and called as such:\n * MedianFinder obj = new MedianFinder();\n * obj.addNum(num);\n * double param_2 = obj.findMedian();\n */"}'::jsonb,'{"java":"import java.io.*;\nimport java.util.*;\n\npublic class Main {\n    public static void main(String[] args) throws Exception {\n        Scanner scanner = new Scanner(System.in);\n        // 每个参数占一行；数组、矩阵等复合参数使用 JSON 外观。\n        // 可用 nextInt()/next() 读取空白分隔数据，或 nextLine() 读取整行。\n        // TODO: 解析输入并输出答案。\n        scanner.close();\n    }\n}\n"}'::jsonb),
('hot100',77,'121',NULL,'买卖股票的最佳时机','best-time-to-buy-and-sell-stock','简单','贪心算法',NULL,NULL,TRUE,'https://leetcode.cn/problems/best-time-to-buy-and-sell-stock/','给定一个数组 prices ，它的第 i 个元素 prices[i] 表示一支给定股票第 i 天的价格。

你只能选择 某一天 买入这只股票，并选择在 未来的某一个不同的日子 卖出该股票。设计一个算法来计算你所能获取的最大利润。

返回你可以从这笔交易中获取的最大利润。如果你不能获取任何利润，返回 0 。

 

示例 1：

输入：[7,1,5,3,6,4]
输出：5
解释：在第 2 天（股票价格 = 1）的时候买入，在第 5 天（股票价格 = 6）的时候卖出，最大利润 = 6-1 = 5 。
     注意利润不能是 7-1 = 6, 因为卖出价格需要大于买入价格；同时，你不能在买入前卖出股票。

示例 2：

输入：prices = [7,6,4,3,1]
输出：0
解释：在这种情况下, 没有交易完成, 所以最大利润为 0。

 

提示：

	• 1 5

	• 0 4','[{"input":"[7,1,5,3,6,4]","output":"5","explanation":"在第 2 天（股票价格 = 1）的时候买入，在第 5 天（股票价格 = 6）的时候卖出，最大利润 = 6-1 = 5 。\n     注意利润不能是 7-1 = 6, 因为卖出价格需要大于买入价格；同时，你不能在买入前卖出股票。"},{"input":"prices = [7,6,4,3,1]","output":"0","explanation":"在这种情况下, 没有交易完成, 所以最大利润为 0。"}]'::jsonb,'[7,1,5,3,6,4]
[7,6,4,3,1]',ARRAY['数组','动态规划']::text[],'{"java":"class Solution {\n    public int maxProfit(int[] prices) {\n        \n    }\n}"}'::jsonb,'{"java":"import java.io.*;\nimport java.util.*;\n\npublic class Main {\n    public static void main(String[] args) throws Exception {\n        Scanner scanner = new Scanner(System.in);\n        // 每个参数占一行；数组、矩阵等复合参数使用 JSON 外观。\n        // 可用 nextInt()/next() 读取空白分隔数据，或 nextLine() 读取整行。\n        // TODO: 解析输入并输出答案。\n        scanner.close();\n    }\n}\n"}'::jsonb),
('hot100',78,'55',NULL,'跳跃游戏','jump-game','中等','贪心算法',NULL,NULL,FALSE,'https://leetcode.cn/problems/jump-game/','给你一个非负整数数组 nums ，你最初位于数组的 第一个下标 。数组中的每个元素代表你在该位置可以跳跃的最大长度。

判断你是否能够到达最后一个下标，如果可以，返回 true ；否则，返回 false 。

示例 1：

输入：nums = [2,3,1,1,4]
输出：true
解释：可以先跳 1 步，从下标 0 到达下标 1, 然后再从下标 1 跳 3 步到达最后一个下标。

示例 2：

输入：nums = [3,2,1,0,4]
输出：false
解释：无论怎样，总会到达下标为 3 的位置。但该下标的最大跳跃长度是 0 ， 所以永远不可能到达最后一个下标。

提示：

	• 1 4

	• 0 5','[{"input":"nums = [2,3,1,1,4]","output":"true","explanation":"可以先跳 1 步，从下标 0 到达下标 1, 然后再从下标 1 跳 3 步到达最后一个下标。"},{"input":"nums = [3,2,1,0,4]","output":"false","explanation":"无论怎样，总会到达下标为 3 的位置。但该下标的最大跳跃长度是 0 ， 所以永远不可能到达最后一个下标。"}]'::jsonb,'[2,3,1,1,4]
[3,2,1,0,4]',ARRAY['贪心','数组','动态规划']::text[],'{"java":"class Solution {\n    public boolean canJump(int[] nums) {\n        \n    }\n}"}'::jsonb,'{"java":"import java.io.*;\nimport java.util.*;\n\npublic class Main {\n    public static void main(String[] args) throws Exception {\n        Scanner scanner = new Scanner(System.in);\n        // 每个参数占一行；数组、矩阵等复合参数使用 JSON 外观。\n        // 可用 nextInt()/next() 读取空白分隔数据，或 nextLine() 读取整行。\n        // TODO: 解析输入并输出答案。\n        scanner.close();\n    }\n}\n"}'::jsonb),
('hot100',79,'45',NULL,'跳跃游戏 II','jump-game-ii','中等','贪心算法',NULL,NULL,FALSE,'https://leetcode.cn/problems/jump-game-ii/','给定一个长度为 n 的 0 索引整数数组 nums。初始位置在下标 0。

每个元素 nums[i] 表示从索引 i 向后跳转的最大长度。换句话说，如果你在索引 i 处，你可以跳转到任意 (i + j) 处：

	• 0  且

	• i + j

返回到达 n - 1 的最小跳跃次数。测试用例保证可以到达 n - 1。

示例 1:

输入: nums = [2,3,1,1,4]
输出: 2
解释: 跳到最后一个位置的最小跳跃数是 2。
     从下标为 0 跳到下标为 1 的位置，跳 1 步，然后跳 3 步到达数组的最后一个位置。

示例 2:

输入: nums = [2,3,0,1,4]
输出: 2

提示:

	• 1 4

	• 0

	• 题目保证可以到达 n - 1','[{"input":"nums = [2,3,1,1,4]","output":"2","explanation":"跳到最后一个位置的最小跳跃数是 2。\n     从下标为 0 跳到下标为 1 的位置，跳 1 步，然后跳 3 步到达数组的最后一个位置。"},{"input":"nums = [2,3,0,1,4]","output":"2","explanation":""}]'::jsonb,'[2,3,1,1,4]
[2,3,0,1,4]',ARRAY['贪心','数组','动态规划']::text[],'{"java":"class Solution {\n    public int jump(int[] nums) {\n        \n    }\n}"}'::jsonb,'{"java":"import java.io.*;\nimport java.util.*;\n\npublic class Main {\n    public static void main(String[] args) throws Exception {\n        Scanner scanner = new Scanner(System.in);\n        // 每个参数占一行；数组、矩阵等复合参数使用 JSON 外观。\n        // 可用 nextInt()/next() 读取空白分隔数据，或 nextLine() 读取整行。\n        // TODO: 解析输入并输出答案。\n        scanner.close();\n    }\n}\n"}'::jsonb),
('hot100',80,'763',NULL,'划分字母区间','partition-labels','中等','贪心算法',NULL,NULL,FALSE,'https://leetcode.cn/problems/partition-labels/','给你一个字符串 s 。我们要把这个字符串划分为尽可能多的片段，同一字母最多出现在一个片段中。例如，字符串 "ababcc" 能够被分为 ["abab", "cc"]，但类似 ["aba", "bcc"] 或 ["ab", "ab", "cc"] 的划分是非法的。

注意，划分结果需要满足：将所有划分结果按顺序连接，得到的字符串仍然是 s 。

返回一个表示每个字符串片段的长度的列表。

示例 1：

输入：s = "ababcbacadefegdehijhklij"
输出：[9,7,8]
解释：
划分结果为 "ababcbaca"、"defegde"、"hijhklij" 。
每个字母最多出现在一个片段中。
像 "ababcbacadefegde", "hijhklij" 这样的划分是错误的，因为划分的片段数较少。

示例 2：

输入：s = "eccbbbbdec"
输出：[10]

提示：

	• 1

	• s 仅由小写英文字母组成','[{"input":"s = \"ababcbacadefegdehijhklij\"","output":"[9,7,8]","explanation":"划分结果为 \"ababcbaca\"、\"defegde\"、\"hijhklij\" 。\n每个字母最多出现在一个片段中。\n像 \"ababcbacadefegde\", \"hijhklij\" 这样的划分是错误的，因为划分的片段数较少。"},{"input":"s = \"eccbbbbdec\"","output":"[10]","explanation":""}]'::jsonb,'"ababcbacadefegdehijhklij"
"eccbbbbdec"',ARRAY['贪心','哈希表','双指针','字符串']::text[],'{"java":"class Solution {\n    public List<Integer> partitionLabels(String s) {\n        \n    }\n}"}'::jsonb,'{"java":"import java.io.*;\nimport java.util.*;\n\npublic class Main {\n    public static void main(String[] args) throws Exception {\n        Scanner scanner = new Scanner(System.in);\n        // 每个参数占一行；数组、矩阵等复合参数使用 JSON 外观。\n        // 可用 nextInt()/next() 读取空白分隔数据，或 nextLine() 读取整行。\n        // TODO: 解析输入并输出答案。\n        scanner.close();\n    }\n}\n"}'::jsonb),
('hot100',81,'70',NULL,'爬楼梯','climbing-stairs','简单','动态规划',NULL,NULL,TRUE,'https://leetcode.cn/problems/climbing-stairs/','假设你正在爬楼梯。需要 n 阶你才能到达楼顶。

每次你可以爬 1 或 2 个台阶。你有多少种不同的方法可以爬到楼顶呢？

示例 1：

输入：n = 2
输出：2
解释：有两种方法可以爬到楼顶。
1. 1 阶 + 1 阶
2. 2 阶

示例 2：

输入：n = 3
输出：3
解释：有三种方法可以爬到楼顶。
1. 1 阶 + 1 阶 + 1 阶
2. 1 阶 + 2 阶
3. 2 阶 + 1 阶

提示：

	• 1','[{"input":"n = 2","output":"2","explanation":"有两种方法可以爬到楼顶。\n1. 1 阶 + 1 阶\n2. 2 阶"},{"input":"n = 3","output":"3","explanation":"有三种方法可以爬到楼顶。\n1. 1 阶 + 1 阶 + 1 阶\n2. 1 阶 + 2 阶\n3. 2 阶 + 1 阶"}]'::jsonb,'2
3',ARRAY['记忆化','数学','动态规划']::text[],'{"java":"class Solution {\n    public int climbStairs(int n) {\n        \n    }\n}"}'::jsonb,'{"java":"import java.io.*;\nimport java.util.*;\n\npublic class Main {\n    public static void main(String[] args) throws Exception {\n        Scanner scanner = new Scanner(System.in);\n        // 每个参数占一行；数组、矩阵等复合参数使用 JSON 外观。\n        // 可用 nextInt()/next() 读取空白分隔数据，或 nextLine() 读取整行。\n        // TODO: 解析输入并输出答案。\n        scanner.close();\n    }\n}\n"}'::jsonb),
('hot100',82,'118',NULL,'杨辉三角','pascals-triangle','简单','动态规划',NULL,NULL,FALSE,'https://leetcode.cn/problems/pascals-triangle/','给定一个非负整数 numRows，生成「杨辉三角」的前 numRows 行。

在「杨辉三角」中，每个数是它左上方和右上方的数的和。

示例 1:

输入: numRows = 5
输出: [[1],[1,1],[1,2,1],[1,3,3,1],[1,4,6,4,1]]

示例 2:

输入: numRows = 1
输出: [[1]]

提示:

	• 1','[{"input":"numRows = 5","output":"[[1],[1,1],[1,2,1],[1,3,3,1],[1,4,6,4,1]]","explanation":""},{"input":"numRows = 1","output":"[[1]]","explanation":""}]'::jsonb,'5
1',ARRAY['数组','动态规划']::text[],'{"java":"class Solution {\n    public List<List<Integer>> generate(int numRows) {\n        \n    }\n}"}'::jsonb,'{"java":"import java.io.*;\nimport java.util.*;\n\npublic class Main {\n    public static void main(String[] args) throws Exception {\n        Scanner scanner = new Scanner(System.in);\n        // 每个参数占一行；数组、矩阵等复合参数使用 JSON 外观。\n        // 可用 nextInt()/next() 读取空白分隔数据，或 nextLine() 读取整行。\n        // TODO: 解析输入并输出答案。\n        scanner.close();\n    }\n}\n"}'::jsonb),
('hot100',83,'198',NULL,'打家劫舍','house-robber','中等','动态规划',NULL,NULL,TRUE,'https://leetcode.cn/problems/house-robber/','你是一个专业的小偷，计划偷窃沿街的房屋。每间房内都藏有一定的现金，影响你偷窃的唯一制约因素就是相邻的房屋装有相互连通的防盗系统，如果两间相邻的房屋在同一晚上被小偷闯入，系统会自动报警。

给定一个代表每个房屋存放金额的非负整数数组，计算你 不触动警报装置的情况下 ，一夜之内能够偷窃到的最高金额。

 

示例 1：

输入：[1,2,3,1]
输出：4
解释：偷窃 1 号房屋 (金额 = 1) ，然后偷窃 3 号房屋 (金额 = 3)。
     偷窃到的最高金额 = 1 + 3 = 4 。

示例 2：

输入：[2,7,9,3,1]
输出：12
解释：偷窃 1 号房屋 (金额 = 2), 偷窃 3 号房屋 (金额 = 9)，接着偷窃 5 号房屋 (金额 = 1)。
     偷窃到的最高金额 = 2 + 9 + 1 = 12 。

 

提示：

	• 1

	• 0','[{"input":"[1,2,3,1]","output":"4","explanation":"偷窃 1 号房屋 (金额 = 1) ，然后偷窃 3 号房屋 (金额 = 3)。\n     偷窃到的最高金额 = 1 + 3 = 4 。"},{"input":"[2,7,9,3,1]","output":"12","explanation":"偷窃 1 号房屋 (金额 = 2), 偷窃 3 号房屋 (金额 = 9)，接着偷窃 5 号房屋 (金额 = 1)。\n     偷窃到的最高金额 = 2 + 9 + 1 = 12 。"}]'::jsonb,'[1,2,3,1]
[2,7,9,3,1]',ARRAY['数组','动态规划']::text[],'{"java":"class Solution {\n    public int rob(int[] nums) {\n        \n    }\n}"}'::jsonb,'{"java":"import java.io.*;\nimport java.util.*;\n\npublic class Main {\n    public static void main(String[] args) throws Exception {\n        Scanner scanner = new Scanner(System.in);\n        // 每个参数占一行；数组、矩阵等复合参数使用 JSON 外观。\n        // 可用 nextInt()/next() 读取空白分隔数据，或 nextLine() 读取整行。\n        // TODO: 解析输入并输出答案。\n        scanner.close();\n    }\n}\n"}'::jsonb),
('hot100',84,'279',NULL,'完全平方数','perfect-squares','中等','动态规划',NULL,NULL,FALSE,'https://leetcode.cn/problems/perfect-squares/','给你一个整数 n ，返回 和为 n 的完全平方数的最少数量 。

完全平方数 是一个整数，其值等于另一个整数的平方；换句话说，其值等于一个整数自乘的积。例如，1、4、9 和 16 都是完全平方数，而 3 和 11 不是。

示例 1：

输入：n = 12
输出：3
解释：12 = 4 + 4 + 4

示例 2：

输入：n = 13
输出：2
解释：13 = 4 + 9

提示：

	• 1 4','[{"input":"n = 12","output":"3","explanation":"12 = 4 + 4 + 4"},{"input":"n = 13","output":"2","explanation":"13 = 4 + 9"}]'::jsonb,'12
13',ARRAY['广度优先搜索','数学','动态规划','knapsack-problem','complete-knapsack']::text[],'{"java":"class Solution {\n    public int numSquares(int n) {\n        \n    }\n}"}'::jsonb,'{"java":"import java.io.*;\nimport java.util.*;\n\npublic class Main {\n    public static void main(String[] args) throws Exception {\n        Scanner scanner = new Scanner(System.in);\n        // 每个参数占一行；数组、矩阵等复合参数使用 JSON 外观。\n        // 可用 nextInt()/next() 读取空白分隔数据，或 nextLine() 读取整行。\n        // TODO: 解析输入并输出答案。\n        scanner.close();\n    }\n}\n"}'::jsonb),
('hot100',85,'322',NULL,'零钱兑换','coin-change','中等','动态规划',NULL,NULL,TRUE,'https://leetcode.cn/problems/coin-change/','给你一个整数数组 coins ，表示不同面额的硬币；以及一个整数 amount ，表示总金额。

计算并返回可以凑成总金额所需的 最少的硬币个数 。如果没有任何一种硬币组合能组成总金额，返回 -1 。

你可以认为每种硬币的数量是无限的。

示例 1：

输入：coins = [1, 2, 5], amount = 11
输出：3
解释：11 = 5 + 5 + 1

示例 2：

输入：coins = [2], amount = 3
输出：-1

示例 3：

输入：coins = [1], amount = 0
输出：0

提示：

	• 1

	• 1 31 - 1

	• 0 4','[{"input":"coins = [1, 2, 5], amount = 11","output":"3","explanation":"11 = 5 + 5 + 1"},{"input":"coins = [2], amount = 3","output":"-1","explanation":""},{"input":"coins = [1], amount = 0","output":"0","explanation":""}]'::jsonb,'[1,2,5]
11
[2]
3
[1]
0',ARRAY['广度优先搜索','数组','动态规划','knapsack-problem','complete-knapsack']::text[],'{"java":"class Solution {\n    public int coinChange(int[] coins, int amount) {\n        \n    }\n}"}'::jsonb,'{"java":"import java.io.*;\nimport java.util.*;\n\npublic class Main {\n    public static void main(String[] args) throws Exception {\n        Scanner scanner = new Scanner(System.in);\n        // 每个参数占一行；数组、矩阵等复合参数使用 JSON 外观。\n        // 可用 nextInt()/next() 读取空白分隔数据，或 nextLine() 读取整行。\n        // TODO: 解析输入并输出答案。\n        scanner.close();\n    }\n}\n"}'::jsonb),
('hot100',86,'139',NULL,'单词拆分','word-break','中等','动态规划',NULL,NULL,TRUE,'https://leetcode.cn/problems/word-break/','给你一个字符串 s 和一个字符串列表 wordDict 作为字典。如果可以利用字典中出现的一个或多个单词拼接出 s 则返回 true。

注意：不要求字典中出现的单词全部都使用，并且字典中的单词可以重复使用。

示例 1：

输入: s = "leetcode", wordDict = ["leet", "code"]
输出: true
解释: 返回 true 因为 "leetcode" 可以由 "leet" 和 "code" 拼接成。

示例 2：

输入: s = "applepenapple", wordDict = ["apple", "pen"]
输出: true
解释: 返回 true 因为 "applepenapple" 可以由 "apple" "pen" "apple" 拼接成。
     注意，你可以重复使用字典中的单词。

示例 3：

输入: s = "catsandog", wordDict = ["cats", "dog", "sand", "and", "cat"]
输出: false

提示：

	• 1

	• 1

	• 1

	• s 和 wordDict[i] 仅由小写英文字母组成

	• wordDict 中的所有字符串 互不相同','[{"input":"s = \"leetcode\", wordDict = [\"leet\", \"code\"]","output":"true","explanation":"返回 true 因为 \"leetcode\" 可以由 \"leet\" 和 \"code\" 拼接成。"},{"input":"s = \"applepenapple\", wordDict = [\"apple\", \"pen\"]","output":"true","explanation":"返回 true 因为 \"applepenapple\" 可以由 \"apple\" \"pen\" \"apple\" 拼接成。\n     注意，你可以重复使用字典中的单词。"},{"input":"s = \"catsandog\", wordDict = [\"cats\", \"dog\", \"sand\", \"and\", \"cat\"]","output":"false","explanation":""}]'::jsonb,'"leetcode"
["leet","code"]
"applepenapple"
["apple","pen"]
"catsandog"
["cats","dog","sand","and","cat"]',ARRAY['字典树','记忆化','数组','哈希表','字符串','动态规划','brute-force-search']::text[],'{"java":"class Solution {\n    public boolean wordBreak(String s, List<String> wordDict) {\n        \n    }\n}"}'::jsonb,'{"java":"import java.io.*;\nimport java.util.*;\n\npublic class Main {\n    public static void main(String[] args) throws Exception {\n        Scanner scanner = new Scanner(System.in);\n        // 每个参数占一行；数组、矩阵等复合参数使用 JSON 外观。\n        // 可用 nextInt()/next() 读取空白分隔数据，或 nextLine() 读取整行。\n        // TODO: 解析输入并输出答案。\n        scanner.close();\n    }\n}\n"}'::jsonb),
('hot100',87,'300',NULL,'最长递增子序列','longest-increasing-subsequence','中等','动态规划',NULL,NULL,TRUE,'https://leetcode.cn/problems/longest-increasing-subsequence/','给你一个整数数组 nums ，找到其中最长严格递增子序列的长度。

子序列 是由数组派生而来的序列，删除（或不删除）数组中的元素而不改变其余元素的顺序。例如，[3,6,2,7] 是数组 [0,3,1,6,2,2,7] 的子序列。

示例 1：

输入：nums = [10,9,2,5,3,7,101,18]
输出：4
解释：最长递增子序列是 [2,3,7,101]，因此长度为 4 。

示例 2：

输入：nums = [0,1,0,3,2,3]
输出：4

示例 3：

输入：nums = [7,7,7,7,7,7,7]
输出：1

提示：

	• 1

	• -104 4

进阶：

	• 你能将算法的时间复杂度降低到 O(n log(n)) 吗?','[{"input":"nums = [10,9,2,5,3,7,101,18]","output":"4","explanation":"最长递增子序列是 [2,3,7,101]，因此长度为 4 。"},{"input":"nums = [0,1,0,3,2,3]","output":"4","explanation":""},{"input":"nums = [7,7,7,7,7,7,7]","output":"1","explanation":""}]'::jsonb,'[10,9,2,5,3,7,101,18]
[0,1,0,3,2,3]
[7,7,7,7,7,7,7]',ARRAY['数组','二分查找','动态规划','longest-increasing-subsequence']::text[],'{"java":"class Solution {\n    public int lengthOfLIS(int[] nums) {\n        \n    }\n}"}'::jsonb,'{"java":"import java.io.*;\nimport java.util.*;\n\npublic class Main {\n    public static void main(String[] args) throws Exception {\n        Scanner scanner = new Scanner(System.in);\n        // 每个参数占一行；数组、矩阵等复合参数使用 JSON 外观。\n        // 可用 nextInt()/next() 读取空白分隔数据，或 nextLine() 读取整行。\n        // TODO: 解析输入并输出答案。\n        scanner.close();\n    }\n}\n"}'::jsonb),
('hot100',88,'152',NULL,'乘积最大子数组','maximum-product-subarray','中等','动态规划',NULL,NULL,TRUE,'https://leetcode.cn/problems/maximum-product-subarray/','给你一个整数数组 nums ，请你找出数组中乘积最大的非空连续 子数组（该子数组中至少包含一个数字），并返回该子数组所对应的乘积。

测试用例的答案是一个 32-位 整数。

请注意，一个只包含一个元素的数组的乘积是这个元素的值。

示例 1:

输入: nums = [2,3,-2,4]
输出: 6
解释: 子数组 [2,3] 有最大乘积 6。

示例 2:

输入: nums = [-2,0,-1]
输出: 0
解释: 结果不能为 2, 因为 [-2,-1] 不是子数组。

提示:

	• 1 4

	• -10

	• nums 的任何子数组的乘积都 保证 是一个 32-位 整数','[{"input":"nums = [2,3,-2,4]","output":"6","explanation":"子数组 [2,3] 有最大乘积 6。"},{"input":"nums = [-2,0,-1]","output":"0","explanation":"结果不能为 2, 因为 [-2,-1] 不是子数组。"}]'::jsonb,'[2,3,-2,4]
[-2,0,-1]',ARRAY['数组','动态规划']::text[],'{"java":"class Solution {\n    public int maxProduct(int[] nums) {\n        \n    }\n}"}'::jsonb,'{"java":"import java.io.*;\nimport java.util.*;\n\npublic class Main {\n    public static void main(String[] args) throws Exception {\n        Scanner scanner = new Scanner(System.in);\n        // 每个参数占一行；数组、矩阵等复合参数使用 JSON 外观。\n        // 可用 nextInt()/next() 读取空白分隔数据，或 nextLine() 读取整行。\n        // TODO: 解析输入并输出答案。\n        scanner.close();\n    }\n}\n"}'::jsonb),
('hot100',89,'416',NULL,'分割等和子集','partition-equal-subset-sum','中等','动态规划',NULL,NULL,FALSE,'https://leetcode.cn/problems/partition-equal-subset-sum/','给你一个 只包含正整数 的 非空 数组 nums 。请你判断是否可以将这个数组分割成两个子集，使得两个子集的元素和相等。

 

示例 1：

输入：nums = [1,5,11,5]
输出：true
解释：数组可以分割成 [1, 5, 5] 和 [11] 。

示例 2：

输入：nums = [1,2,3,5]
输出：false
解释：数组不能分割成两个元素和相等的子集。

 

提示：

	• 1

	• 1','[{"input":"nums = [1,5,11,5]","output":"true","explanation":"数组可以分割成 [1, 5, 5] 和 [11] 。"},{"input":"nums = [1,2,3,5]","output":"false","explanation":"数组不能分割成两个元素和相等的子集。"}]'::jsonb,'[1,5,11,5]
[1,2,3,5]',ARRAY['数组','动态规划','knapsack-problem','0-1-knapsack']::text[],'{"java":"class Solution {\n    public boolean canPartition(int[] nums) {\n        \n    }\n}"}'::jsonb,'{"java":"import java.io.*;\nimport java.util.*;\n\npublic class Main {\n    public static void main(String[] args) throws Exception {\n        Scanner scanner = new Scanner(System.in);\n        // 每个参数占一行；数组、矩阵等复合参数使用 JSON 外观。\n        // 可用 nextInt()/next() 读取空白分隔数据，或 nextLine() 读取整行。\n        // TODO: 解析输入并输出答案。\n        scanner.close();\n    }\n}\n"}'::jsonb),
('hot100',90,'32',NULL,'最长有效括号','longest-valid-parentheses','困难','动态规划',NULL,NULL,TRUE,'https://leetcode.cn/problems/longest-valid-parentheses/','给你一个只包含 ''('' 和 '')'' 的字符串，找出最长有效（格式正确且连续）括号 子串 的长度。

左右括号匹配，即每个左括号都有对应的右括号将其闭合的字符串是格式正确的，比如 "(()())"。

示例 1：

输入：s = "(()"
输出：2
解释：最长有效括号子串是 "()"

示例 2：

输入：s = ")()())"
输出：4
解释：最长有效括号子串是 "()()"

示例 3：

输入：s = ""
输出：0

提示：

	• 0 4

	• s[i] 为 ''('' 或 '')''','[{"input":"s = \"(()\"","output":"2","explanation":"最长有效括号子串是 \"()\""},{"input":"s = \")()())\"","output":"4","explanation":"最长有效括号子串是 \"()()\""},{"input":"s = \"\"","output":"0","explanation":""}]'::jsonb,'"(()"
")()())"
""',ARRAY['栈','字符串','动态规划','bracket-sequences']::text[],'{"java":"class Solution {\n    public int longestValidParentheses(String s) {\n        \n    }\n}"}'::jsonb,'{"java":"import java.io.*;\nimport java.util.*;\n\npublic class Main {\n    public static void main(String[] args) throws Exception {\n        Scanner scanner = new Scanner(System.in);\n        // 每个参数占一行；数组、矩阵等复合参数使用 JSON 外观。\n        // 可用 nextInt()/next() 读取空白分隔数据，或 nextLine() 读取整行。\n        // TODO: 解析输入并输出答案。\n        scanner.close();\n    }\n}\n"}'::jsonb),
('hot100',91,'62',NULL,'不同路径','unique-paths','中等','多维动态规划',NULL,NULL,TRUE,'https://leetcode.cn/problems/unique-paths/','一个机器人位于一个 m x n 网格的左上角 （起始点在下图中标记为 “Start” ）。

机器人每次只能向下或者向右移动一步。机器人试图达到网格的右下角（在下图中标记为 “Finish” ）。

问总共有多少条不同的路径？

示例 1：

输入：m = 3, n = 7
输出：28

示例 2：

输入：m = 3, n = 2
输出：3
解释：
从左上角开始，总共有 3 条路径可以到达右下角。
1. 向右 -> 向下 -> 向下
2. 向下 -> 向下 -> 向右
3. 向下 -> 向右 -> 向下

示例 3：

输入：m = 7, n = 3
输出：28

示例 4：

输入：m = 3, n = 3
输出：6

提示：

	• 1

	• 题目数据保证答案小于等于 2 * 109','[{"input":"m = 3, n = 7","output":"28","explanation":""},{"input":"m = 3, n = 2","output":"3","explanation":"从左上角开始，总共有 3 条路径可以到达右下角。\n1. 向右 -> 向下 -> 向下\n2. 向下 -> 向下 -> 向右\n3. 向下 -> 向右 -> 向下"},{"input":"m = 7, n = 3","output":"28","explanation":""},{"input":"m = 3, n = 3","output":"6","explanation":""}]'::jsonb,'3
7
3
2',ARRAY['数学','动态规划','组合数学']::text[],'{"java":"class Solution {\n    public int uniquePaths(int m, int n) {\n        \n    }\n}"}'::jsonb,'{"java":"import java.io.*;\nimport java.util.*;\n\npublic class Main {\n    public static void main(String[] args) throws Exception {\n        Scanner scanner = new Scanner(System.in);\n        // 每个参数占一行；数组、矩阵等复合参数使用 JSON 外观。\n        // 可用 nextInt()/next() 读取空白分隔数据，或 nextLine() 读取整行。\n        // TODO: 解析输入并输出答案。\n        scanner.close();\n    }\n}\n"}'::jsonb),
('hot100',92,'64',NULL,'最小路径和','minimum-path-sum','中等','多维动态规划',NULL,NULL,TRUE,'https://leetcode.cn/problems/minimum-path-sum/','给定一个包含非负整数的 m x n 网格 grid ，请找出一条从左上角到右下角的路径，使得路径上的数字总和为最小。

说明：每次只能向下或者向右移动一步。

示例 1：

输入：grid = [[1,3,1],[1,5,1],[4,2,1]]
输出：7
解释：因为路径 1→3→1→1→1 的总和最小。

示例 2：

输入：grid = [[1,2,3],[4,5,6]]
输出：12

提示：

	• m == grid.length

	• n == grid[i].length

	• 1

	• 0','[{"input":"grid = [[1,3,1],[1,5,1],[4,2,1]]","output":"7","explanation":"因为路径 1→3→1→1→1 的总和最小。"},{"input":"grid = [[1,2,3],[4,5,6]]","output":"12","explanation":""}]'::jsonb,'[[1,3,1],[1,5,1],[4,2,1]]
[[1,2,3],[4,5,6]]',ARRAY['数组','动态规划','矩阵']::text[],'{"java":"class Solution {\n    public int minPathSum(int[][] grid) {\n        \n    }\n}"}'::jsonb,'{"java":"import java.io.*;\nimport java.util.*;\n\npublic class Main {\n    public static void main(String[] args) throws Exception {\n        Scanner scanner = new Scanner(System.in);\n        // 每个参数占一行；数组、矩阵等复合参数使用 JSON 外观。\n        // 可用 nextInt()/next() 读取空白分隔数据，或 nextLine() 读取整行。\n        // TODO: 解析输入并输出答案。\n        scanner.close();\n    }\n}\n"}'::jsonb),
('hot100',93,'5',NULL,'最长回文子串','longest-palindromic-substring','中等','多维动态规划',NULL,NULL,TRUE,'https://leetcode.cn/problems/longest-palindromic-substring/','给你一个字符串 s，找到 s 中最长的 回文 子串。

示例 1：

输入：s = "babad"
输出："bab"
解释："aba" 同样是符合题意的答案。

示例 2：

输入：s = "cbbd"
输出："bb"

提示：

	• 1

	• s 仅由数字和英文字母组成','[{"input":"s = \"babad\"","output":"\"bab\"","explanation":"\"aba\" 同样是符合题意的答案。"},{"input":"s = \"cbbd\"","output":"\"bb\"","explanation":""}]'::jsonb,'"babad"
"cbbd"',ARRAY['双指针','字符串','动态规划','manacher']::text[],'{"java":"class Solution {\n    public String longestPalindrome(String s) {\n        \n    }\n}"}'::jsonb,'{"java":"import java.io.*;\nimport java.util.*;\n\npublic class Main {\n    public static void main(String[] args) throws Exception {\n        Scanner scanner = new Scanner(System.in);\n        // 每个参数占一行；数组、矩阵等复合参数使用 JSON 外观。\n        // 可用 nextInt()/next() 读取空白分隔数据，或 nextLine() 读取整行。\n        // TODO: 解析输入并输出答案。\n        scanner.close();\n    }\n}\n"}'::jsonb),
('hot100',94,'1143',NULL,'最长公共子序列','longest-common-subsequence','中等','多维动态规划',NULL,NULL,TRUE,'https://leetcode.cn/problems/longest-common-subsequence/','给定两个字符串 text1 和 text2，返回这两个字符串的最长 公共子序列 的长度。如果不存在 公共子序列 ，返回 0 。

一个字符串的 子序列 是指这样一个新的字符串：它是由原字符串在不改变字符的相对顺序的情况下删除某些字符（也可以不删除任何字符）后组成的新字符串。

	• 例如，"ace" 是 "abcde" 的子序列，但 "aec" 不是 "abcde" 的子序列。

两个字符串的 公共子序列 是这两个字符串所共同拥有的子序列。

 

示例 1：

输入：text1 = "abcde", text2 = "ace"
输出：3
解释：最长公共子序列是 "ace" ，它的长度为 3 。

示例 2：

输入：text1 = "abc", text2 = "abc"
输出：3
解释：最长公共子序列是 "abc" ，它的长度为 3 。

示例 3：

输入：text1 = "abc", text2 = "def"
输出：0
解释：两个字符串没有公共子序列，返回 0 。

 

提示：

	• 1

	• text1 和 text2 仅由小写英文字符组成。','[{"input":"text1 = \"abcde\", text2 = \"ace\"","output":"3","explanation":"最长公共子序列是 \"ace\" ，它的长度为 3 。"},{"input":"text1 = \"abc\", text2 = \"abc\"","output":"3","explanation":"最长公共子序列是 \"abc\" ，它的长度为 3 。"},{"input":"text1 = \"abc\", text2 = \"def\"","output":"0","explanation":"两个字符串没有公共子序列，返回 0 。"}]'::jsonb,'"abcde"
"ace"
"abc"
"abc"
"abc"
"def"',ARRAY['字符串','动态规划','longest-common-subsequence']::text[],'{"java":"class Solution {\n    public int longestCommonSubsequence(String text1, String text2) {\n        \n    }\n}"}'::jsonb,'{"java":"import java.io.*;\nimport java.util.*;\n\npublic class Main {\n    public static void main(String[] args) throws Exception {\n        Scanner scanner = new Scanner(System.in);\n        // 每个参数占一行；数组、矩阵等复合参数使用 JSON 外观。\n        // 可用 nextInt()/next() 读取空白分隔数据，或 nextLine() 读取整行。\n        // TODO: 解析输入并输出答案。\n        scanner.close();\n    }\n}\n"}'::jsonb),
('hot100',95,'72',NULL,'编辑距离','edit-distance','中等','多维动态规划',NULL,NULL,TRUE,'https://leetcode.cn/problems/edit-distance/','给你两个单词 word1 和 word2， 请返回将 word1 转换成 word2 所使用的最少操作数  。

你可以对一个单词进行如下三种操作：

	• 插入一个字符

	• 删除一个字符

	• 替换一个字符

示例 1：

输入：word1 = "horse", word2 = "ros"
输出：3
解释：
horse -> rorse (将 ''h'' 替换为 ''r'')
rorse -> rose (删除 ''r'')
rose -> ros (删除 ''e'')

示例 2：

输入：word1 = "intention", word2 = "execution"
输出：5
解释：
intention -> inention (删除 ''t'')
inention -> enention (将 ''i'' 替换为 ''e'')
enention -> exention (将 ''n'' 替换为 ''x'')
exention -> exection (将 ''n'' 替换为 ''c'')
exection -> execution (插入 ''u'')

提示：

	• 0

	• word1 和 word2 由小写英文字母组成','[{"input":"word1 = \"horse\", word2 = \"ros\"","output":"3","explanation":"horse -> rorse (将 ''h'' 替换为 ''r'')\nrorse -> rose (删除 ''r'')\nrose -> ros (删除 ''e'')"},{"input":"word1 = \"intention\", word2 = \"execution\"","output":"5","explanation":"intention -> inention (删除 ''t'')\ninention -> enention (将 ''i'' 替换为 ''e'')\nenention -> exention (将 ''n'' 替换为 ''x'')\nexention -> exection (将 ''n'' 替换为 ''c'')\nexection -> execution (插入 ''u'')"}]'::jsonb,'"horse"
"ros"
"intention"
"execution"',ARRAY['字符串','动态规划']::text[],'{"java":"class Solution {\n    public int minDistance(String word1, String word2) {\n        \n    }\n}"}'::jsonb,'{"java":"import java.io.*;\nimport java.util.*;\n\npublic class Main {\n    public static void main(String[] args) throws Exception {\n        Scanner scanner = new Scanner(System.in);\n        // 每个参数占一行；数组、矩阵等复合参数使用 JSON 外观。\n        // 可用 nextInt()/next() 读取空白分隔数据，或 nextLine() 读取整行。\n        // TODO: 解析输入并输出答案。\n        scanner.close();\n    }\n}\n"}'::jsonb),
('hot100',96,'136',NULL,'只出现一次的数字','single-number','简单','技巧',NULL,NULL,FALSE,'https://leetcode.cn/problems/single-number/','给你一个 非空 整数数组 nums ，除了某个元素只出现一次以外，其余每个元素均出现两次。找出那个只出现了一次的元素。

你必须设计并实现线性时间复杂度的算法来解决此问题，且该算法只使用常量额外空间。

示例 1 ：

输入：nums = [2,2,1]

输出：1

示例 2 ：

输入：nums = [4,1,2,1,2]

输出：4

示例 3 ：

输入：nums = [1]

输出：1

提示：

	• 1 4

	• -3 * 104 4

	• 除了某个元素只出现一次以外，其余每个元素均出现两次。','[{"input":"nums = [2,2,1]","output":"1","explanation":""},{"input":"nums = [4,1,2,1,2]","output":"4","explanation":""},{"input":"nums = [1]","output":"1","explanation":""}]'::jsonb,'[2,2,1]
[4,1,2,1,2]
[1]',ARRAY['位运算','数组']::text[],'{"java":"class Solution {\n    public int singleNumber(int[] nums) {\n        \n    }\n}"}'::jsonb,'{"java":"import java.io.*;\nimport java.util.*;\n\npublic class Main {\n    public static void main(String[] args) throws Exception {\n        Scanner scanner = new Scanner(System.in);\n        // 每个参数占一行；数组、矩阵等复合参数使用 JSON 外观。\n        // 可用 nextInt()/next() 读取空白分隔数据，或 nextLine() 读取整行。\n        // TODO: 解析输入并输出答案。\n        scanner.close();\n    }\n}\n"}'::jsonb),
('hot100',97,'169',NULL,'多数元素','majority-element','简单','技巧',NULL,NULL,TRUE,'https://leetcode.cn/problems/majority-element/','给定一个大小为 n 的数组 nums ，返回其中的多数元素。多数元素是指在数组中出现次数 大于 ⌊ n/2 ⌋ 的元素。

你可以假设数组是非空的，并且给定的数组总是存在多数元素。

示例 1：

输入：nums = [3,2,3]
输出：3

示例 2：

输入：nums = [2,2,1,1,1,2,2]
输出：2

提示：

	• n == nums.length

	• 1 4

	• -109 9

	• 输入保证数组中一定有一个多数元素。

进阶：尝试设计时间复杂度为 O(n)、空间复杂度为 O(1) 的算法解决此问题。','[{"input":"nums = [3,2,3]","output":"3","explanation":""},{"input":"nums = [2,2,1,1,1,2,2]","output":"2","explanation":""}]'::jsonb,'[3,2,3]
[2,2,1,1,1,2,2]',ARRAY['数组','哈希表','分治','计数','排序','boyer-moore-majority-vote-algorithm']::text[],'{"java":"class Solution {\n    public int majorityElement(int[] nums) {\n        \n    }\n}"}'::jsonb,'{"java":"import java.io.*;\nimport java.util.*;\n\npublic class Main {\n    public static void main(String[] args) throws Exception {\n        Scanner scanner = new Scanner(System.in);\n        // 每个参数占一行；数组、矩阵等复合参数使用 JSON 外观。\n        // 可用 nextInt()/next() 读取空白分隔数据，或 nextLine() 读取整行。\n        // TODO: 解析输入并输出答案。\n        scanner.close();\n    }\n}\n"}'::jsonb),
('hot100',98,'75',NULL,'颜色分类','sort-colors','中等','技巧',NULL,NULL,FALSE,'https://leetcode.cn/problems/sort-colors/','给定一个包含红色、白色和蓝色、共 n 个元素的数组 nums ，原地 对它们进行排序，使得相同颜色的元素相邻，并按照红色、白色、蓝色顺序排列。

我们使用整数 0、 1 和 2 分别表示红色、白色和蓝色。

必须在不使用库内置的 sort 函数的情况下解决这个问题。

示例 1：

输入：nums = [2,0,2,1,1,0]

输出：[0,0,1,1,2,2]

解释：

该数组包含两个 0、两个 1 和两个 2。将它们原地排序后，所有 0 排在最前面，接着是所有 1，最后是所有 2。

示例 2：

输入：nums = [2,0,1]

输出：[0,1,2]

解释：

数组中有且仅有一个 0、一个 1 和一个 2，按 0、1、2 的顺序原地排列。

提示：

	• n == nums.length

	• 1

	• nums[i] 为 0、1 或 2

进阶：

	• 你能想出一个仅使用常数空间的一趟扫描算法吗？','[{"input":"nums = [2,0,2,1,1,0]","output":"[0,0,1,1,2,2]","explanation":"该数组包含两个 0、两个 1 和两个 2。将它们原地排序后，所有 0 排在最前面，接着是所有 1，最后是所有 2。"},{"input":"nums = [2,0,1]","output":"[0,1,2]","explanation":"数组中有且仅有一个 0、一个 1 和一个 2，按 0、1、2 的顺序原地排列。"}]'::jsonb,'[2,0,2,1,1,0]
[2,0,1]',ARRAY['数组','双指针','bubble-sort','排序','quicksort']::text[],'{"java":"class Solution {\n    public void sortColors(int[] nums) {\n        \n    }\n}"}'::jsonb,'{"java":"import java.io.*;\nimport java.util.*;\n\npublic class Main {\n    public static void main(String[] args) throws Exception {\n        Scanner scanner = new Scanner(System.in);\n        // 每个参数占一行；数组、矩阵等复合参数使用 JSON 外观。\n        // 可用 nextInt()/next() 读取空白分隔数据，或 nextLine() 读取整行。\n        // TODO: 解析输入并输出答案。\n        scanner.close();\n    }\n}\n"}'::jsonb),
('hot100',99,'31',NULL,'下一个排列','next-permutation','中等','技巧',NULL,NULL,TRUE,'https://leetcode.cn/problems/next-permutation/','整数数组的一个 排列  就是将其所有成员以序列或线性顺序排列。

	• 例如，arr = [1,2,3] ，以下这些都可以视作 arr 的排列：[1,2,3]、[1,3,2]、[3,1,2]、[2,3,1] 。

整数数组的 下一个排列 是指其整数的下一个字典序更大的排列。更正式地，如果数组的所有排列根据其字典顺序从小到大排列在一个容器中，那么数组的 下一个排列 就是在这个有序容器中排在它后面的那个排列。如果不存在下一个更大的排列，那么这个数组必须重排为字典序最小的排列（即，其元素按升序排列）。

	• 例如，arr = [1,2,3] 的下一个排列是 [1,3,2] 。

	• 类似地，arr = [2,3,1] 的下一个排列是 [3,1,2] 。

	• 而 arr = [3,2,1] 的下一个排列是 [1,2,3] ，因为 [3,2,1] 不存在一个字典序更大的排列。

给你一个整数数组 nums ，找出 nums 的下一个排列。

必须 原地 修改，只允许使用额外常数空间。

示例 1：

输入：nums = [1,2,3]
输出：[1,3,2]

示例 2：

输入：nums = [3,2,1]
输出：[1,2,3]

示例 3：

输入：nums = [1,1,5]
输出：[1,5,1]

提示：

	• 1

	• 0','[{"input":"nums = [1,2,3]","output":"[1,3,2]","explanation":""},{"input":"nums = [3,2,1]","output":"[1,2,3]","explanation":""},{"input":"nums = [1,1,5]","output":"[1,5,1]","explanation":""}]'::jsonb,'[1,2,3]
[3,2,1]
[1,1,5]',ARRAY['数组','双指针']::text[],'{"java":"class Solution {\n    public void nextPermutation(int[] nums) {\n        \n    }\n}"}'::jsonb,'{"java":"import java.io.*;\nimport java.util.*;\n\npublic class Main {\n    public static void main(String[] args) throws Exception {\n        Scanner scanner = new Scanner(System.in);\n        // 每个参数占一行；数组、矩阵等复合参数使用 JSON 外观。\n        // 可用 nextInt()/next() 读取空白分隔数据，或 nextLine() 读取整行。\n        // TODO: 解析输入并输出答案。\n        scanner.close();\n    }\n}\n"}'::jsonb),
('hot100',100,'287',NULL,'寻找重复数','find-the-duplicate-number','中等','技巧',NULL,NULL,FALSE,'https://leetcode.cn/problems/find-the-duplicate-number/','给定一个包含 n + 1 个整数的数组 nums ，其数字都在 [1, n] 范围内（包括 1 和 n），可知至少存在一个重复的整数。

假设 nums 只有 一个重复的整数 ，返回 这个重复的数 。

你设计的解决方案必须 不修改 数组 nums 且只用常量级 O(1) 的额外空间。

示例 1：

输入：nums = [1,3,4,2,2]
输出：2

示例 2：

输入：nums = [3,1,3,4,2]
输出：3

示例 3 :

输入：nums = [3,3,3,3,3]
输出：3

提示：

	• 1 5

	• nums.length == n + 1

	• 1

	• nums 中 只有一个整数 出现 两次或多次 ，其余整数均只出现 一次

进阶：

	• 如何证明 nums 中至少存在一个重复的数字?

	• 你可以设计一个线性级时间复杂度 O(n) 的解决方案吗？','[{"input":"nums = [1,3,4,2,2]","output":"2","explanation":""},{"input":"nums = [3,1,3,4,2]","output":"3","explanation":""},{"input":"nums = [3,3,3,3,3]","output":"3","explanation":""}]'::jsonb,'[1,3,4,2,2]
[3,1,3,4,2]
[3,3,3,3,3]',ARRAY['位运算','数组','双指针','二分查找','floyds-cycle-finding-algorithm','pigeonhole-principle']::text[],'{"java":"class Solution {\n    public int findDuplicate(int[] nums) {\n        \n    }\n}"}'::jsonb,'{"java":"import java.io.*;\nimport java.util.*;\n\npublic class Main {\n    public static void main(String[] args) throws Exception {\n        Scanner scanner = new Scanner(System.in);\n        // 每个参数占一行；数组、矩阵等复合参数使用 JSON 外观。\n        // 可用 nextInt()/next() 读取空白分隔数据，或 nextLine() 读取整行。\n        // TODO: 解析输入并输出答案。\n        scanner.close();\n    }\n}\n"}'::jsonb)
ON CONFLICT (source, rank) DO NOTHING;
