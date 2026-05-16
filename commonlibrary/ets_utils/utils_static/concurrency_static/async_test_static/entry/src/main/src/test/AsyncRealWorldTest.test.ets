'use static'
import { afterEach, describe, expect, it, Level, Size, TestType } from '../../../hypium';
import {sleep} from './Utils.test';

class User {
  public id: number = 0;
  public name: string = '';
}

class Post {
  public userId: number = 0;
  public title: string = '';
}

class MergedUser {
  public id: number = 0;
  public name: string = '';
  public posts: Post[] = [];
}

type State = 'idle' | 'loading' | 'success' | 'error';

export default function asyncRealWorldTest() {
  describe('asyncRealWorldTest', () => {
    afterEach(async () => {
      await sleep(50)
    })

    /**
     * @tc.name   asyncRealWorldTest002
     * @tc.number SUB_BUILTINS_asyncRealWorld_TEST_002
     * @tc.desc   Simulate data caching mechanism
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('asyncRealWorldTest002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const cache = new Map<string, string>();

      const getDataWithCache = async (key: string): Promise<string> => {
        // Check cache first
        if (cache.has(key)) {
          return cache.get(key)!;
        }

        // Simulate slow data fetch
        await sleep(1);
        const data = `data-${key}`;

        // Store in cache
        cache.set(key, data);
        return data;
      };

      const result1 = await getDataWithCache('user1');
      const result2 = await getDataWithCache('user1'); // Should return cached

      expect(result1).assertEqual('data-user1');
      expect(result2).assertEqual('data-user1');
      expect(cache.size).assertEqual(1);
    });

    /**
     * @tc.name   asyncRealWorldTest004
     * @tc.number SUB_BUILTINS_asyncRealWorld_TEST_004
     * @tc.desc   Simulate data pipeline transformation
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('asyncRealWorldTest004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const fetch = async (): Promise<int[]> => {
        return [1, 2, 3, 4, 5];
      };

      const transform = async (data: int[]): Promise<int[]> => {
        return data.map((x: int) => x * 2);
      };

      const filter = async (data: int[]): Promise<int[]> => {
        return data.filter(x => x > 4);
      };

      const sort = async (data: int[]): Promise<int[]> => {
        return data.sort((a, b) => a - b);
      };

      // Pipeline: fetch -> transform -> filter -> sort
      const rawData = await fetch();
      const transformed = await transform(rawData);
      const filtered = await filter(transformed);
      const sorted = await sort(filtered);

      expect(sorted).assertDeepEquals([6, 8, 10]);
    });

    /**
     * @tc.name   asyncRealWorldTest005
     * @tc.number SUB_BUILTINS_asyncRealWorld_TEST_005
     * @tc.desc   Simulate batch processing
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('asyncRealWorldTest005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      // 显式类型声明，避免类型推断
      const items: number[] = [];
      for (let i: int = 0; i < 100; i++) {
        items.push(i);
      }
      const batchSize: int = 10;

      const processBatch = async (batch: number[]): Promise<number[]> => {
        return batch.map((x: number) => x * 2);
      };

      const processInBatches = async (): Promise<number[]> => {
        const results: number[] = [];

        for (let i: int = 0; i < items.length; i += batchSize) {
          const batch = items.slice(i, i + batchSize);
          const processed = await processBatch(batch);
          results.push(...processed);
        }

        return results;
      };

      const result = await processInBatches();
      expect(result.length).assertEqual(100);
      expect(result[0]).assertEqual(0);
      expect(result[99]).assertEqual(198);
    });

    /**
     * @tc.name   asyncRealWorldTest006
     * @tc.number SUB_BUILTINS_asyncRealWorld_TEST_006
     * @tc.desc   Simulate request debouncing
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('asyncRealWorldTest006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let lastCallTime: long = 0;
      const debounceTime: long = 50;

      const debouncedRequest = async (key: string): Promise<string> => {
        const now = Date.now();
        if (now - lastCallTime < debounceTime) {
          throw new Error('debounced');
        }
        lastCallTime = now;
        return `result-${key}`;
      };

      const result1 = await debouncedRequest('request1');
      await sleep(60); // Wait for debounce to clear
      const result2 = await debouncedRequest('request2');

      expect(result1).assertEqual('result-request1');
      expect(result2).assertEqual('result-request2');
    });

    /**
     * @tc.name   asyncRealWorldTest007
     * @tc.number SUB_BUILTINS_asyncRealWorld_TEST_007
     * @tc.desc   Simulate rate limiting
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('asyncRealWorldTest007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const maxRequestsPerSecond: int = 3;
      let requestCount: int = 0;
      let resetTime: number = (Date.now() + 1000).toDouble();

      const rateLimitedRequest = async (id: number): Promise<string> => {
        const now: number = Date.now();
        if (now > resetTime) {
          requestCount = 0;
          resetTime = now + 1000;
        }

        if (requestCount >= maxRequestsPerSecond) {
          throw new Error('rate limit exceeded');
        }

        requestCount++;
        return `response-${id}`;
      };

      const results: string[] = [];
      for (let i: int = 0; i < 3; i++) {
        results.push(await rateLimitedRequest(i));
      }

      expect(results.length).assertEqual(3);
      expect(results[0]).assertEqual('response-0');
    });

    /**
     * @tc.name   asyncRealWorldTest010
     * @tc.number SUB_BUILTINS_asyncRealWorld_TEST_010
     * @tc.desc   Simulate async queue processing
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('asyncRealWorldTest010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const queue: number[] = [];
      const results: string[] = [];

      const enqueue = (item: number): void => {
        queue.push(item);
      };

      const processQueue = async (): Promise<void> => {
        while (queue.length > 0) {
          const item = queue.shift()!;
          results.push(`processed-${item}`);
          await sleep(1);
        }
      };

      // Add items to queue
      for (let i: int = 0; i < 5; i++) {
        enqueue(i);
      }

      await processQueue();

      expect(results.length).assertEqual(5);
      expect(results[0]).assertEqual('processed-0');
      expect(results[4]).assertEqual('processed-4');
    });

    /**
     * @tc.name   asyncRealWorldTest011
     * @tc.number SUB_BUILTINS_asyncRealWorld_TEST_011
     * @tc.desc   Simulate conditional async workflow
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('asyncRealWorldTest011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const fetchUserRole = async (userId: number): Promise<string> => {
        return userId > 100 ? 'admin' : 'user';
      };

      const fetchAdminData = async (): Promise<string> => {
        return 'admin-data';
      };

      const fetchUserData = async (): Promise<string> => {
        return 'user-data';
      };

      const userId: int = 150;
      const role = await fetchUserRole(userId);

      let data: string;
      if (role === 'admin') {
        data = await fetchAdminData();
      } else {
        data = await fetchUserData();
      }

      expect(data).assertEqual('admin-data');
    });

    /**
     * @tc.name   asyncRealWorldTest012
     * @tc.number SUB_BUILTINS_asyncRealWorld_TEST_012
     * @tc.desc   Simulate async data validation
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('asyncRealWorldTest012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const validateEmail = async (email: string): Promise<boolean> => {
        return email.includes('@');
      };

      const validatePhone = async (phone: string): Promise<boolean> => {
        return phone.length >= 10;
      };

      const validateUserData = async (
        email: string,
        phone: string
      ): Promise<boolean> => {
        // 不使用 Promise.all 的泛型，分别处理
        const isEmailValid = await validateEmail(email);
        const isPhoneValid = await validatePhone(phone);

        return isEmailValid && isPhoneValid;
      };

      const result1 = await validateUserData('test@example.com', '1234567890');
      const result2 = await validateUserData('invalid', '123');

      expect(result1).assertEqual(true);
      expect(result2).assertEqual(false);
    });

    /**
     * @tc.name   asyncRealWorldTest013
     * @tc.number SUB_BUILTINS_asyncRealWorld_TEST_013
     * @tc.desc   Simulate async data pagination
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('asyncRealWorldTest013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const pageSize: int = 10;
      const totalPages: int = 3;

      const fetchPage = async (page: number): Promise<number[]> => {
        const start = page * pageSize;
        const result: number[] = [];
        for (let i: int = 0; i < pageSize; i++) {
          result.push(start + i);
        }
        return result;
      };

      const fetchAllPages = async (): Promise<number[]> => {
        const allData: number[] = [];

        for (let page: int = 0; page < totalPages; page++) {
          const pageData = await fetchPage(page);
          allData.push(...pageData);
        }

        return allData;
      };

      const result = await fetchAllPages();
      expect(result.length).assertEqual(30);
      expect(result[0]).assertEqual(0);
      expect(result[29]).assertEqual(29);
    });

    /**
     * @tc.name   asyncRealWorldTest014
     * @tc.number SUB_BUILTINS_asyncRealWorld_TEST_014
     * @tc.desc   Simulate async event handler
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('asyncRealWorldTest014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sequence: string[] = [];

      const handleEvent = async (eventName: string, data: string): Promise<void> => {
        sequence.push(`start-${eventName}`);
        await sleep(1);
        sequence.push(`process-${data}`);
        await sleep(1);
        sequence.push(`end-${eventName}`);
      };

      await handleEvent('click', 'button1');
      await handleEvent('submit', 'form1');

      expect(sequence.length).assertEqual(6);
      expect(sequence[0]).assertEqual('start-click');
      expect(sequence[1]).assertEqual('process-button1');
    });

    /**
     * @tc.name   asyncRealWorldTest015
     * @tc.number SUB_BUILTINS_asyncRealWorld_TEST_015
     * @tc.desc   Simulate async resource pool
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('asyncRealWorldTest015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const poolSize: int = 3;
      const available: number[] = [1, 2, 3];

      const acquireResource = async (): Promise<number> => {
        while (available.length === 0) {
          await sleep(1);
        }
        return available.shift()!;
      };

      const releaseResource = async (resource: number): Promise<void> => {
        await sleep(1);
        available.push(resource);
      };

      const useResource = async (): Promise<string> => {
        const resource = await acquireResource();
        const result = `used-${resource}`;
        await releaseResource(resource);
        return result;
      };

      const results = await Promise.all([
        useResource(),
        useResource(),
        useResource()
      ]);

      expect(results.length).assertEqual(3);
      expect(results).assertContain('used-1');
      expect(results).assertContain('used-2');
      expect(results).assertContain('used-3');
    });

    /**
     * @tc.name   asyncRealWorldTest016
     * @tc.number SUB_BUILTINS_asyncRealWorld_TEST_016
     * @tc.desc   Simulate async data deduplication
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('asyncRealWorldTest016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const pendingRequests = new Map<string, Promise<string>>();

      const deduplicatedFetch = async (key: string): Promise<string> => {
        if (pendingRequests.has(key)) {
          return pendingRequests.get(key)!;
        }

        const promise = (async () => {
          await sleep(1);
          return `data-${key}`;
        })();

        pendingRequests.set(key, promise);

        try {
          return await promise;
        } finally {
          pendingRequests.delete(key);
        }
      };

      // 不使用 Promise.all 的泛型，分别获取结果
      const r1 = await deduplicatedFetch('key1');
      const r2 = await deduplicatedFetch('key1'); // Should use same request
      const r3 = await deduplicatedFetch('key2');

      expect(r1).assertEqual('data-key1');
      expect(r2).assertEqual('data-key1');
      expect(r3).assertEqual('data-key2');
      expect(pendingRequests.size).assertEqual(0);
    });

    /**
     * @tc.name   asyncRealWorldTest017
     * @tc.number SUB_BUILTINS_asyncRealWorld_TEST_017
     * @tc.desc   Simulate async progress tracking
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('asyncRealWorldTest017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const progressUpdates: number[] = [];

      const reportProgress = async (progress: number): Promise<void> => {
        progressUpdates.push(progress);
        await sleep(1);
      };

      const longRunningTask = async (): Promise<string> => {
        const totalSteps: number = 5;

        for (let step: number = 1; step <= totalSteps; step++) {
          await reportProgress(Math.floor((step / totalSteps) * 100));
        }

        return 'completed';
      };

      const result = await longRunningTask();
      expect(result).assertEqual('completed');
      let res: number[] = [20, 40, 60, 80, 100];
      expect(progressUpdates).assertDeepEquals(res);
    });

    /**
     * @tc.name   asyncRealWorldTest018
     * @tc.number SUB_BUILTINS_asyncRealWorld_TEST_018
     * @tc.desc   Simulate async data merging
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('asyncRealWorldTest018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const fetchUsers = async (): Promise<User[]> => {
        const user1: User = { id: 1, name: 'Alice' };
        const user2: User = { id: 2, name: 'Bob' };
        return [user1, user2];
      };

      const fetchPosts = async (): Promise<Post[]> => {
        const post1: Post = { userId: 1, title: 'Post 1' };
        const post2: Post = { userId: 2, title: 'Post 2' };
        return [post1, post2];
      };

      // 不使用解构，使用数组索引访问
      const results = await Promise.all<User[] | Post[]>([
        fetchUsers(),
        fetchPosts()
      ]);
      const users = results[0] as User[];
      const posts = results[1] as Post[];

      const merged: MergedUser[] = [];
      for (let i: int = 0; i < users.length; i++) {
        const user = users[i];
        const mergedUser: MergedUser = new MergedUser();
        mergedUser.id = user.id;
        mergedUser.name = user.name;
        mergedUser.posts = posts.filter(p => p.userId === user.id);
        merged.push(mergedUser);
      }

      expect(merged.length).assertEqual(2);
      expect(merged[0].name).assertEqual('Alice');
      expect(merged[0].posts.length).assertEqual(1);
    });

    /**
     * @tc.name   asyncRealWorldTest019
     * @tc.number SUB_BUILTINS_asyncRealWorld_TEST_019
     * @tc.desc   Simulate async state machine
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('asyncRealWorldTest019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {

      let currentState: State = 'idle';
      const stateHistory: State[] = [];

      const transitionTo = async (newState: State): Promise<void> => {
        stateHistory.push(currentState);
        currentState = newState;
        await sleep(1);
      };

      const loadData = async (): Promise<string> => {
        await transitionTo('loading');

        try {
          // Simulate success
          await transitionTo('success');
          return 'data-loaded';
        } catch (err) {
          await transitionTo('error');
          // 只能抛出 Error 类型
          if (err instanceof Error) {
            throw err;
          }
          throw new Error('Unknown error');
        }
      };

      const result = await loadData();
      expect(result).assertEqual('data-loaded');
      expect(currentState).assertEqual('success');
      expect(stateHistory).assertDeepEquals(['idle', 'loading']);
    });

    /**
     * @tc.name   asyncRealWorldTest020
     * @tc.number SUB_BUILTINS_asyncRealWorld_TEST_020
     * @tc.desc   Simulate async data streaming
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('asyncRealWorldTest020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      // 不使用生成器函数，返回数组
      const streamData = async (count: number): Promise<number[]> => {
        const results: number[] = [];
        for (let i: int = 0; i < count; i++) {
          await sleep(1);
          results.push(i);
        }
        return results;
      };

      const collectedData = await streamData(10);

      expect(collectedData.length).assertEqual(10);
      let res: number[] = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]
      expect(collectedData).assertDeepEquals(res);
    });
  });
}
