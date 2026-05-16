import { afterEach, describe, expect, it, Level, Size, TestType } from '@ohos/hypium';
import { sleep } from './utils';

export default function asyncAdvancedTest() {
  describe('asyncAdvancedTest', () => {
    afterEach(async () => {
      await sleep(50)
    })

    /**
     * @tc.name   asyncAdvancedTest004
     * @tc.number SUB_BUILTINS_asyncAdvanced_TEST_004
     * @tc.desc   Test async function with utility types (Partial, Required)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('asyncAdvancedTest004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      class User {
        public id: number = 0;
        public name: string = '';
        public age: number = 0;
      }

      const fetchPartialUser = async (): Promise<User> => {
        const user: User = new User();
        user.name = 'Bob';
        return user;
      };

      const result = await fetchPartialUser();
      expect(result.name).assertEqual('Bob');
      expect(result.id).assertEqual(0);
    });

    /**
     * @tc.name   asyncAdvancedTest006
     * @tc.number SUB_BUILTINS_asyncAdvanced_TEST_006
     * @tc.desc   Test async function with promise chaining and error recovery
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('asyncAdvancedTest006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const chainWithRecovery = async (): Promise<string> => {
        try {
          const val1 = await Promise.resolve(1);
          const val2 = val1 * 2;

          if (val2 > 1) {
            throw new Error('Intentional error');
          }

          return val2.toString();
        } catch (e) {
          return 'recovered';
        }
      };

      const result = await chainWithRecovery();
      expect(result).assertEqual('recovered');
    });

    /**
     * @tc.name   asyncAdvancedTest011
     * @tc.number SUB_BUILTINS_asyncAdvanced_TEST_011
     * @tc.desc   Test async function with recursive types
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('asyncAdvancedTest011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      class TreeNode {
        public value: number = 0;
        public left?: TreeNode;
        public right?: TreeNode;
      }

      const buildTree = async (depth: number): Promise<TreeNode> => {
        if (depth === 0) {
          const node: TreeNode = new TreeNode();
          node.value = depth;
          return node;
        }
        const node: TreeNode = new TreeNode();
        node.value = depth;
        node.left = await buildTree(depth - 1);
        node.right = await buildTree(depth - 1);
        return node;
      };

      const tree = await buildTree(3);
      expect(tree.value).assertEqual(3);
      expect(tree.left !== undefined).assertTrue();
      expect(tree.right !== undefined).assertTrue();
      expect(tree.left!.value).assertEqual(2);
      expect(tree.right!.value).assertEqual(2);
    });
  });
}
