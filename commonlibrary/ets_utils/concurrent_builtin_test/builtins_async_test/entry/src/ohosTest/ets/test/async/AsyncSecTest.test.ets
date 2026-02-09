import { afterEach, describe, expect, it, Level, Size, TestType } from '@ohos/hypium';
import { sleep } from './utils';

export default function asyncSecTest(): void {
  describe('asyncSecTest', () => {
    afterEach(async () => {
      await sleep(10)
    })
    /**
     * @tc.name   asyncSecTest0001
     * @tc.number ASYNC_SEC_TEST_0001
     * @tc.desc   Verify async dependency call counts and caching mechanism
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('asyncSecTest0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let dbCallCount = 0;
      const mockDatabaseFetch = async (key: string): Promise<string> => {
        dbCallCount++;
        return await Promise.resolve(`Value_for_${key}`);
      };

      const cache: Map<string, string> = new Map();

      const getDataWithCache = async (key: string): Promise<string> => {
        if (cache.has(key)) {
          return Promise.resolve(cache.get(key)!);
        }
        const result = await mockDatabaseFetch(key);
        cache.set(key, result);
        return result;
      };

      const val1 = await getDataWithCache('user_1');
      expect(val1).assertEqual('Value_for_user_1');
      expect(dbCallCount).assertEqual(1);

      const val2 = await getDataWithCache('user_1');
      expect(val2).assertEqual('Value_for_user_1');
      expect(dbCallCount).assertEqual(1);

      const val3 = await getDataWithCache('user_2');
      expect(val3).assertEqual('Value_for_user_2');
      expect(dbCallCount).assertEqual(2);
    });

    /**
     * @tc.name   asyncSecTest0002
     * @tc.number ASYNC_SEC_TEST_0002
     * @tc.desc   Verify parameter passthrough correctness and return value transformation
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('asyncSecTest0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      // Define explicit classes to avoid "Object literals cannot be used as type declarations"
      class ApiConfig {
        verbose: boolean = false;
      }

      class ApiResponse {
        code: number = 0;
      }

      class CapturedArgs {
        id: number = 0;
        config: ApiConfig | null = null;
      }

      let capturedArgs: CapturedArgs = new CapturedArgs();

      const externalApi = async (id: number, config: ApiConfig): Promise<ApiResponse> => {
        capturedArgs.id = id;
        capturedArgs.config = config;

        const response = new ApiResponse();
        response.code = 200;
        return await Promise.resolve(response);
      };

      const businessService = async (userId: number): Promise<string> => {
        const config = new ApiConfig();
        config.verbose = true;

        const result = await externalApi(userId, config);

        if (result.code === 200) {
          return 'Success';
        } else {
          return 'Failure';
        }
      };

      const status = await businessService(12345);

      expect(capturedArgs.id).assertEqual(12345);
      expect(capturedArgs.config !== null).assertTrue();
      if (capturedArgs.config) {
        expect(capturedArgs.config.verbose).assertEqual(true);
      }

      expect(status).assertEqual('Success');
    });

    /**
     * @tc.name   asyncSecTest0003
     * @tc.number ASYNC_SEC_TEST_0003
     * @tc.desc   Verify multiple async dependencies: Sequential linkage and Concurrent aggregation
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('asyncSecTest0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      class UserProfile {
        name: string = '';
        roleId: number = 0;
      }

      class DetailedUser {
        name: string = '';
        roleId: number = 0;
        permissions: string[] = [];
      }

      const fetchUserProfile = async (id: number): Promise<UserProfile> => {
        const profile = new UserProfile();
        profile.name = 'Alice';
        profile.roleId = 99;
        return await Promise.resolve(profile);
      };

      const fetchPermissions = async (roleId: number): Promise<string[]> => {
        return await Promise.resolve(roleId === 99 ? ['admin', 'write'] : ['read']);
      };

      const fetchSystemStatus = async (): Promise<string> => {
        return await Promise.resolve('Online');
      };

      const getDetailedUser = async (id: number): Promise<DetailedUser> => {
        const user = await fetchUserProfile(id);
        const perms = await fetchPermissions(user.roleId);

        const detailed = new DetailedUser();
        detailed.name = user.name;
        detailed.roleId = user.roleId;
        detailed.permissions = perms;

        return detailed;
      };

      const detailedUser = await getDetailedUser(1);
      expect(detailedUser.name).assertEqual('Alice');
      expect(detailedUser.permissions.length).assertEqual(2);
      expect(detailedUser.permissions[0]).assertEqual('admin');

      const getDashboardData = async (): Promise<string> => {
        const results: Object[] = await Promise.all([
          fetchSystemStatus(),
          fetchUserProfile(1)
        ]);

        const status = results[0] as string;
        const user = results[1] as UserProfile;

        return `System: ${status}, User: ${user.name}`;
      };

      const dashboard = await getDashboardData();
      expect(dashboard).assertEqual('System: Online, User: Alice');
    });

    /**
     * @tc.name   asyncSecTest0004
     * @tc.number ASYNC_SEC_TEST_0004
     * @tc.desc   Test Promise.all result order consistency with input order
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('asyncSecTest0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const fastTask = async (): Promise<string> => {
        await new Promise<void>((resolve) => setTimeout(resolve, 10));
        return 'Fast';
      };

      const slowTask = async (): Promise<string> => {
        await new Promise<void>((resolve) => setTimeout(resolve, 50));
        return 'Slow';
      };

      const mediumTask = async (): Promise<string> => {
        await new Promise<void>((resolve) => setTimeout(resolve, 30));
        return 'Medium';
      };

      const results = await Promise.all([slowTask(), fastTask(), mediumTask()]);

      expect(results.length).assertEqual(3);

      expect(results[0]).assertEqual('Slow');
      expect(results[1]).assertEqual('Fast');
      expect(results[2]).assertEqual('Medium');
    });

    /**
     * @tc.name   asyncSecTest0005
     * @tc.number ASYNC_SEC_TEST_0005
     * @tc.desc   Test Promise.race returns the fastest result
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('asyncSecTest0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const WINNER_VAL = 'Winner';
      const LOSER_VAL = 'Loser';

      const pFast = new Promise<string>((resolve) => {
        setTimeout(() => { resolve(WINNER_VAL); }, 10);
      });

      const pSlow = new Promise<string>((resolve) => {
        setTimeout(() => { resolve(LOSER_VAL); }, 100);
      });

      const result = await Promise.race([pSlow, pFast]);

      expect(result).assertEqual(WINNER_VAL);
    });

    /**
     * @tc.name   asyncSecTest0006
     * @tc.number ASYNC_SEC_TEST_0006
     * @tc.desc   Test Promise.allSettled for success/failure classification and error isolation
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('asyncSecTest0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const pSuccess1 = Promise.resolve(100);
      const pFail = Promise.reject('Error_Reason');
      const pSuccess2 = new Promise<number>((resolve) => {
        setTimeout(() => { resolve(200); }, 20);
      });

      const results = await Promise.allSettled([pSuccess1, pFail, pSuccess2]);

      expect(results.length).assertEqual(3);

      const res0 = results[0];
      expect(res0.status).assertEqual('fulfilled');
      if (res0.status === 'fulfilled') {
        expect(res0.value).assertEqual(100);
      }

      const res1 = results[1];
      expect(res1.status).assertEqual('rejected');
      if (res1.status === 'rejected') {
        expect(res1.reason).assertEqual('Error_Reason');
      }

      const res2 = results[2];
      expect(res2.status).assertEqual('fulfilled');
      if (res2.status === 'fulfilled') {
        expect(res2.value).assertEqual(200);
      }
    });
    /**
     * @tc.name   asyncSecTest0007
     * @tc.number ASYNC_SEC_TEST_0007
     * @tc.desc   Verify await blocks subsequent code and executes multiple awaits linearly
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('asyncSecTest0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const logs: string[] = [];

      const doTask = async (name: string, delay: number): Promise<void> => {
        await new Promise<void>((resolve) => setTimeout(resolve, delay));
        logs.push(`Finished_${name}`);
      };

      const processSequence = async (): Promise<void> => {
        logs.push('Start');

        await doTask('A', 50);

        logs.push('Between_A_and_B');

        await doTask('B', 20);

        logs.push('End');
      };

      await processSequence();

      expect(logs.length).assertEqual(5);
      expect(logs[0]).assertEqual('Start');
      expect(logs[1]).assertEqual('Finished_A');
      expect(logs[2]).assertEqual('Between_A_and_B');
      expect(logs[3]).assertEqual('Finished_B');
      expect(logs[4]).assertEqual('End');
    });

    /**
     * @tc.name   asyncSecTest0008
     * @tc.number ASYNC_SEC_TEST_0008
     * @tc.desc   Verify await on non-Promise values returns immediately without blocking time
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('asyncSecTest0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const startTime = new Date().getTime();

      const numResult = await 123;
      const strResult = await 'NonBlocking';
      const boolResult = await true;

      const endTime = new Date().getTime();
      const diff = endTime - startTime;

      expect(numResult).assertEqual(123);
      expect(strResult).assertEqual('NonBlocking');
      expect(boolResult).assertEqual(true);

      expect(diff < 50).assertTrue();
    });

    /**
     * @tc.name   asyncSecTest0009
     * @tc.number ASYNC_SEC_TEST_0009
     * @tc.desc   Verify execution order of nested async functions
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('asyncSecTest0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const executionLog: string[] = [];

      // Inner async function
      const innerTask = async (): Promise<void> => {
        executionLog.push('Inner_Start');
        // Simulate work
        await new Promise<void>((resolve) => setTimeout(resolve, 10));
        executionLog.push('Inner_End');
      };

      // Outer async function calling inner
      const outerTask = async (): Promise<void> => {
        executionLog.push('Outer_Start');

        // This await ensures Outer pauses until Inner completes fully
        await innerTask();

        executionLog.push('Outer_End');
      };

      await outerTask();

      // Verify the precise nesting order (Stack-like behavior for execution flow)
      expect(executionLog.length).assertEqual(4);
      expect(executionLog[0]).assertEqual('Outer_Start');
      expect(executionLog[1]).assertEqual('Inner_Start');
      expect(executionLog[2]).assertEqual('Inner_End'); // Must happen before Outer_End
      expect(executionLog[3]).assertEqual('Outer_End');
    });

    /**
     * @tc.name   asyncSecTest0010
     * @tc.number ASYNC_SEC_TEST_0010
     * @tc.desc   Verify 'for...of' loop with await executes strictly sequentially
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('asyncSecTest0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const inputs: number[] = [1, 2, 3];
      const trace: string[] = [];

      const processItem = async (id: number, delayMs: number): Promise<void> => {
        trace.push(`Start_${id}`);
        await new Promise<void>((resolve) => setTimeout(resolve, delayMs));
        trace.push(`End_${id}`);
      };

      const runLoop = async (): Promise<void> => {
        const delays: number[] = [40, 10, 10];

        let index = 0;
        for (const id of inputs) {
          await processItem(id, delays[index]);
          index++;
        }
      };

      await runLoop();
      expect(trace.length).assertEqual(6);

      expect(trace[0]).assertEqual('Start_1');
      expect(trace[1]).assertEqual('End_1');

      expect(trace[2]).assertEqual('Start_2');
      expect(trace[3]).assertEqual('End_2');

      expect(trace[4]).assertEqual('Start_3');
      expect(trace[5]).assertEqual('End_3');
    });

    /**
     * @tc.name   asyncSecTest0011
     * @tc.number ASYNC_SEC_TEST_0011
     * @tc.desc   Verify logic correctness under high concurrency (1000+ tasks)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('asyncSecTest0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const taskCount = 1000;
      const tasks: Promise<number>[] = [];

      for (let i = 0; i < taskCount; i++) {
        const task = async (index: number): Promise<number> => {
          await new Promise<void>((resolve) => setTimeout(resolve, 0));
          return index;
        };
        tasks.push(task(i));
      }

      const results = await Promise.all(tasks);

      expect(results.length).assertEqual(taskCount);

      let sum = 0;
      for (let i = 0; i < results.length; i++) {
        sum += results[i];
      }
      expect(sum).assertEqual(499500);

      expect(results[0]).assertEqual(0);
      expect(results[999]).assertEqual(999);
    });

    /**
     * @tc.name   asyncSecTest0012
     * @tc.number ASYNC_SEC_TEST_0012
     * @tc.desc   Verify data isolation between concurrent tasks (Scope containment)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('asyncSecTest0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      class UserSession {
        userId: number = 0;
        data: string = '';
      }

      const processUser = async (id: number, uniqueData: string, delay: number): Promise<string> => {
        const session = new UserSession();
        session.userId = id;
        session.data = uniqueData;

        await new Promise<void>((resolve) => setTimeout(resolve, delay));

        return session.data;
      };

      const taskA = processUser(1, 'Alice', 10);
      const taskB = processUser(2, 'Bob', 50);

      const results = await Promise.all([taskA, taskB]);

      const resultA = results[0];
      const resultB = results[1];

      expect(resultA).assertEqual('Alice');

      expect(resultB).assertEqual('Bob');
    });
    /**
     * @tc.name   asyncSecTest0013
     * @tc.number ASYNC_SEC_TEST_0013
     * @tc.desc   Verify race condition handling: Ensure the latest call overwrites/ignores older results
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('asyncSecTest0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      class SearchState {
        lastRequestId: number = 0;
        displayValue: string = '';
      }

      const state = new SearchState();
      const performSearch = async (reqId: number, result: string, delay: number): Promise<void> => {
        state.lastRequestId = reqId;

        await new Promise<void>((resolve) => setTimeout(resolve, delay));

        if (reqId === state.lastRequestId) {
          state.displayValue = result;
        }
      };

      const p1 = performSearch(101, 'Old_Result', 100);

      await new Promise<void>((resolve) => setTimeout(resolve, 10));
      const p2 = performSearch(102, 'New_Result', 20);

      await Promise.all([p1, p2]);

      expect(state.displayValue).assertEqual('New_Result');
      expect(state.lastRequestId).assertEqual(102);
    });

    /**
     * @tc.name   asyncSecTest0014
     * @tc.number ASYNC_SEC_TEST_0014
     * @tc.desc   Verify concurrent update correctness using Mutex/Lock pattern
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('asyncSecTest0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {

      class BankAccount {
        balance: number = 100;
        isLocked: boolean = false;
      }

      const account = new BankAccount();

      const safeWithdraw = async (amount: number): Promise<boolean> => {
        while (account.isLocked) {
          await new Promise<void>((resolve) => setTimeout(resolve, 5));
        }

        account.isLocked = true;

        try {
          const currentBalance = account.balance;

          await new Promise<void>((resolve) => setTimeout(resolve, 20));

          if (currentBalance >= amount) {
            account.balance = currentBalance - amount;
            return true;
          }
          return false;
        } finally {
          account.isLocked = false;
        }
      };

      const t1 = safeWithdraw(80);
      const t2 = safeWithdraw(30);

      const results = await Promise.all([t1, t2]);

      let successCount = 0;
      if (results[0]) successCount++;
      if (results[1]) successCount++;

      expect(successCount).assertEqual(1);

      const validBalances = (account.balance === 20) || (account.balance === 70);
      expect(validBalances).assertTrue();
    });

    /**
     * @tc.name   asyncSecTest0015
     * @tc.number ASYNC_SEC_TEST_0015
     * @tc.desc   Verify re-entrancy control (prevention of overlapping execution)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('asyncSecTest0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      class AsyncTaskManager {
        isProcessing: boolean = false;
        executionCount: number = 0;

        async doWork(): Promise<string> {
          if (this.isProcessing) {
            return 'Ignored';
          }

          this.isProcessing = true;

          await new Promise<void>((resolve) => setTimeout(resolve, 50));
          this.executionCount++;

          this.isProcessing = false;
          return 'Completed';
        }
      }

      const manager = new AsyncTaskManager();

      const p1 = manager.doWork();

      await new Promise<void>((resolve) => setTimeout(resolve, 5));
      const p2 = manager.doWork();

      const results = await Promise.all([p1, p2]);

      expect(results[0]).assertEqual('Completed');
      expect(results[1]).assertEqual('Ignored');

      expect(manager.executionCount).assertEqual(1);

      const p3 = await manager.doWork();
      expect(p3).assertEqual('Completed');
      expect(manager.executionCount).assertEqual(2);
    });
    /**
     * @tc.name   asyncSecTest0016
     * @tc.number ASYNC_SEC_TEST_0016
     * @tc.desc   Verify try/catch captures asynchronous exceptions thrown via await
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('asyncSecTest0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const asyncFailure = async (): Promise<string> => {
        await new Promise<void>((resolve) => setTimeout(resolve, 10));
        throw new Error('Network_Timeout');
      };

      let capturedError: Error | null = null;

      try {
        await asyncFailure();
        expect(true).assertFalse();
      } catch (err) {
        capturedError = err as Error;
      }

      expect(capturedError !== null).assertTrue();
      if (capturedError) {
        expect(capturedError.message).assertEqual('Network_Timeout');
      }
    });

    /**
     * @tc.name   asyncSecTest0017
     * @tc.number ASYNC_SEC_TEST_0017
     * @tc.desc   Verify try/catch captures synchronous exceptions thrown inside async functions
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('asyncSecTest0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const syncFailure = async (): Promise<number> => {
        const x: number = 0;
        if (x === 0) {
          throw new Error('Division_By_Zero');
        }
        return 100;
      };

      let capturedError: Error | null = null;

      try {

        await syncFailure();
        expect(true).assertFalse();
      } catch (err) {
        capturedError = err as Error;
      }

      expect(capturedError !== null).assertTrue();
      if (capturedError) {
        expect(capturedError.message).assertEqual('Division_By_Zero');
      }
    });

    /**
     * @tc.name   asyncSecTest0018
     * @tc.number ASYNC_SEC_TEST_0018
     * @tc.desc   Verify exception bubbling from nested async functions to outer try/catch
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('asyncSecTest0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const innerLevel = async (): Promise<void> => {
        throw new Error('Deep_Inner_Error');
      };

      const middleLevel = async (): Promise<void> => {
        await innerLevel();
      };

      const outerLevel = async (): Promise<void> => {
        try {
          await middleLevel();
          expect(true).assertFalse();
        } catch (err) {
          const error = err as Error;
          expect(error.message).assertEqual('Deep_Inner_Error');
        }
      };

      await outerLevel();
    });

    /**
     * @tc.name   asyncSecTest0019
     * @tc.number ASYNC_SEC_TEST_0019
     * @tc.desc   Verify uncaught exception bubbling and error object accuracy (Type & Properties)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('asyncSecTest0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      class DatabaseError extends Error {
        errorCode: number = 0;
        constructor(msg: string, code: number) {
          super(msg);
          this.errorCode = code;
        }
      }

      const queryDatabase = async (): Promise<void> => {
        throw new DatabaseError('Connection_Refused', 503);
      };

      const businessService = async (): Promise<void> => {
        await queryDatabase();
      };

      try {
        await businessService();
        expect(true).assertFalse();
      } catch (err) {
        expect(err !== null).assertTrue();

        expect(err instanceof DatabaseError).assertTrue();

        const dbError = err as DatabaseError;
        expect(dbError.message).assertEqual('Connection_Refused');
        expect(dbError.errorCode).assertEqual(503);
      }
    });

    /**
     * @tc.name   asyncSecTest0020
     * @tc.number ASYNC_SEC_TEST_0020
     * @tc.desc   Verify network-related exception capture and property verification
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('asyncSecTest0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      class NetworkError extends Error {
        statusCode: number = 0;
        url: string = '';

        constructor(message: string, code: number, url: string) {
          super(message);
          this.name = 'NetworkError';
          this.statusCode = code;
          this.url = url;
        }
      }

      const simulateFetch = async (targetUrl: string): Promise<string> => {
        await new Promise<void>((resolve) => setTimeout(resolve, 10));

        throw new NetworkError('Host unreachable', 404, targetUrl);
      };

      const apiUrl = 'https://example.com/api/data';

      try {
        await simulateFetch(apiUrl);
        expect(true).assertFalse();
      } catch (e) {
        expect(e instanceof NetworkError).assertTrue();

        const netErr = e as NetworkError;
        expect(netErr.message).assertEqual('Host unreachable');
        expect(netErr.statusCode).assertEqual(404);
        expect(netErr.url).assertEqual(apiUrl);
      }
    });

    /**
     * @tc.name   asyncSecTest0021
     * @tc.number ASYNC_SEC_TEST_0021
     * @tc.desc   Verify timeout exception handling using Promise.race simulation
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('asyncSecTest0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      // A task that takes longer than the timeout limit
      const slowTask = async (): Promise<string> => {
        await new Promise<void>((resolve) => setTimeout(resolve, 100));
        return 'Success';
      };

      // Wrapper to enforce timeout
      const executeWithTimeout = async (timeoutMs: number): Promise<string> => {
        const timeoutPromise = new Promise<string>((_, reject) => {
          setTimeout(() => {
            reject(new Error('Operation_Timeout'));
          }, timeoutMs);
        });

        // Race: returns whichever settles first
        return Promise.race([slowTask(), timeoutPromise]);
      };

      try {
        // Set timeout to 20ms, but task takes 100ms
        await executeWithTimeout(20);
        expect(true).assertFalse();
      } catch (e) {
        // Verify capture of the timeout error
        const err = e as Error;
        expect(err.message).assertEqual('Operation_Timeout');
      }
    });

    /**
     * @tc.name   asyncSecTest0022
     * @tc.number ASYNC_SEC_TEST_0022
     * @tc.desc   Verify custom error code and message matching logic
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('asyncSecTest0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      // Define structured business error
      class ServiceError extends Error {
        errorCode: string = '';
        retryable: boolean = false;

        constructor(msg: string, code: string, canRetry: boolean) {
          super(msg);
          this.name = 'ServiceError';
          this.errorCode = code;
          this.retryable = canRetry;
        }
      }

      const processOrder = async (orderId: number): Promise<void> => {
        if (orderId < 0) {
          throw new ServiceError('Invalid Order ID', 'ERR_INVALID_INPUT', false);
        }
        // Simulate busy server state
        throw new ServiceError('Server Busy', 'ERR_BUSY', true);
      };

      // Test Scenario 1: Non-retryable Error
      try {
        await processOrder(-1);
        expect(true).assertFalse();
      } catch (e) {
        expect(e instanceof ServiceError).assertTrue();
        const sErr = e as ServiceError;
        expect(sErr.errorCode).assertEqual('ERR_INVALID_INPUT');
        expect(sErr.retryable).assertFalse();
      }

      // Test Scenario 2: Retryable Error
      try {
        await processOrder(100);
        expect(true).assertFalse();
      } catch (e) {
        const sErr = e as ServiceError;
        expect(sErr.errorCode).assertEqual('ERR_BUSY');
        expect(sErr.retryable).assertTrue();
      }
    });

    /**
     * @tc.name   asyncSecTest0023
     * @tc.number ASYNC_SEC_TEST_0023
     * @tc.desc   Verify exception logic consistency in generic async functions
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('asyncSecTest0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      // Generic function that validates input and throws error on demand
      const validateAndReturn = async <T>(input: T, shouldFail: boolean): Promise<T> => {
        await new Promise<void>((resolve) => setTimeout(resolve, 5));
        if (shouldFail) {
          throw new Error(`Validation failed`);
        }
        return input;
      };

      class UserData {
        id: number = 1;
      }

      // 1. Test with String type
      try {
        await validateAndReturn<string>('test_string', true);
        expect(true).assertFalse();
      } catch (e) {
        const err = e as Error;
        expect(err.message).assertEqual('Validation failed');
      }

      // 2. Test with Number type
      try {
        await validateAndReturn<number>(12345, true);
        expect(true).assertFalse();
      } catch (e) {
        const err = e as Error;
        expect(err.message).assertEqual('Validation failed');
      }

      // 3. Test with Object Class type
      try {
        const user = new UserData();
        await validateAndReturn<UserData>(user, true);
        expect(true).assertFalse();
      } catch (e) {
        const err = e as Error;
        expect(err.message).assertEqual('Validation failed');
      }

      // 4. Verify Success Path works (Control)
      const validRes = await validateAndReturn<string>('Success', false);
      expect(validRes).assertEqual('Success');
    });
    /**
     * @tc.name   asyncSecTest0024
     * @tc.number ASYNC_SEC_TEST_0024
     * @tc.desc   Verify 'finally' block execution for resource release regardless of success or failure
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('asyncSecTest0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      class dbConnection {
        isOpen: boolean = false;

        open(): void {
          this.isOpen = true;
        }

        close(): void {
          this.isOpen = false;
        }
      }

      const conn = new dbConnection();

      const successOperation = async (): Promise<string> => {
        conn.open();
        try {
          await new Promise<void>((resolve) => setTimeout(resolve, 5));
          return 'Success';
        } finally {
          conn.close();
        }
      };

      const failOperation = async (): Promise<string> => {
        conn.open();
        try {
          await new Promise<void>((resolve) => setTimeout(resolve, 5));
          throw new Error('Query Failed');
        } finally {
          conn.close();
        }
      };

      await successOperation();
      expect(conn.isOpen).assertFalse();

      try {
        await failOperation();
      } catch (e) {
      }
      expect(conn.isOpen).assertFalse();
    });

    /**
     * @tc.name   asyncResourceTest002
     * @tc.number SUB_BUILTINS_asyncResource_TEST_002
     * @tc.desc   Verify cleanup of Timers/Locks/External resources upon exception
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    /**
     * @tc.name   asyncSecTest0025
     * @tc.number ASYNC_SEC_TEST_0025
     * @tc.desc   Verify cleanup of Timers/Locks/External resources upon exception
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('asyncSecTest0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      class SystemLock {
        isLocked: boolean = false;
      }
      const lock = new SystemLock();

      const riskyProcess = async (): Promise<void> => {
        if (lock.isLocked) throw new Error('Already Locked');
        lock.isLocked = true;

        let timerId: number = -1;

        try {
          await new Promise<void>((resolve, reject) => {
            timerId = setTimeout(() => {
            }, 1000);

            setTimeout(() => {
              reject(new Error('Process Crashed'));
            }, 10);
          });
        } catch (e) {
          clearTimeout(timerId);

          if (e instanceof Error) {
            throw e;
          } else {
            throw new Error('Unknown error occurred');
          }
        } finally {
          lock.isLocked = false;
        }
      };

      try {
        await riskyProcess();
      } catch (e) {
        expect(e instanceof Error).assertTrue();
        if (e instanceof Error) {
          expect(e.message).assertEqual('Process Crashed');
        }
      }

      expect(lock.isLocked).assertFalse();
    });

    /**
     * @tc.name   asyncSecTest0026
     * @tc.number ASYNC_SEC_TEST_0026
     * @tc.desc   Verify fallback logic (Default Value/Reset State) when async fails
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('asyncSecTest0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      class AppConfig {
        theme: string = 'light';
        retries: number = 0;
      }

      class StateManager {
        isLoading: boolean = false;
      }

      const state = new StateManager();

      const fetchConfigSafe = async (): Promise<AppConfig> => {
        state.isLoading = true;
        try {
          await new Promise<void>((_, reject) => setTimeout(() => reject(new Error('Network Error')), 10));

          const remoteConfig = new AppConfig();
          remoteConfig.theme = 'dark';
          return remoteConfig;
        } catch (e) {
          const defaultConfig = new AppConfig();
          defaultConfig.theme = 'default_blue';
          return defaultConfig;
        } finally {

          state.isLoading = false;
        }
      };

      const result = await fetchConfigSafe();

      expect(result.theme).assertEqual('default_blue');
      expect(state.isLoading).assertFalse();
    });

    /**
     * @tc.name   asyncSecTest0027
     * @tc.number ASYNC_SEC_TEST_0027
     * @tc.desc   Verify partial failure handling in batch tasks (Rollback successful tasks)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('asyncSecTest0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    class FileStorage {
        storedFiles: string[] = [];

        async upload(filename: string): Promise<void> {
          await new Promise<void>((resolve) => setTimeout(resolve, 5));
          this.storedFiles.push(filename);
        }

        async delete(filename: string): Promise<void> {
          await new Promise<void>((resolve) => setTimeout(resolve, 5));
          const index = this.storedFiles.indexOf(filename);
          if (index > -1) {
            this.storedFiles.splice(index, 1);
          }
        }
      }

      const storage = new FileStorage();
      const filesToUpload: string[] = ['file_A', 'file_B', 'file_C_FAIL'];
      const uploadedSuccessfully: string[] = [];

      const executeBatchTransaction = async (): Promise<string> => {
        try {
          for (let i = 0; i < filesToUpload.length; i++) {
            const file = filesToUpload[i];

            if (file.includes('FAIL')) {
              throw new Error(`Failed to upload ${file}`);
            }

            await storage.upload(file);
            uploadedSuccessfully.push(file);
          }
          return 'Success';
        } catch (e) {
          for (let i = 0; i < uploadedSuccessfully.length; i++) {
            await storage.delete(uploadedSuccessfully[i]);
          }
          return 'Transaction_Rolled_Back';
        }
      };

      const status = await executeBatchTransaction();

      expect(status).assertEqual('Transaction_Rolled_Back');

      expect(storage.storedFiles.length).assertEqual(0);

      expect(uploadedSuccessfully.length).assertEqual(2);
      expect(uploadedSuccessfully[0]).assertEqual('file_A');
    });

    /**
     * @tc.name   asyncSecTest0028
     * @tc.number ASYNC_SEC_TEST_0028
     * @tc.desc   Verify that inner await blocks the outer function's subsequent logic
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('asyncSecTest0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const trace: string[] = [];

      const innerFunction = async (): Promise<void> => {
        trace.push('Inner_Start');
        await new Promise<void>((resolve) => setTimeout(resolve, 20));
        trace.push('Inner_End');
      };

      const outerFunction = async (): Promise<void> => {
        trace.push('Outer_Start');

        await innerFunction();

        trace.push('Outer_End');
      };

      await outerFunction();

      expect(trace.length).assertEqual(4);
      expect(trace[0]).assertEqual('Outer_Start');
      expect(trace[1]).assertEqual('Inner_Start');
      expect(trace[2]).assertEqual('Inner_End');
      expect(trace[3]).assertEqual('Outer_End');
    });

    /**
     * @tc.name   asyncSecTest0029
     * @tc.number ASYNC_SEC_TEST_0029
     * @tc.desc   Verify execution order of deep nested async calls (3+ layers)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('asyncSecTest0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const stackTrace: string[] = [];

      const level3 = async (): Promise<void> => {
        stackTrace.push('L3_Start');
        await new Promise<void>((resolve) => setTimeout(resolve, 10));
        stackTrace.push('L3_End');
      };

      const level2 = async (): Promise<void> => {
        stackTrace.push('L2_Start');
        await level3();
        stackTrace.push('L2_End');
      };

      const level1 = async (): Promise<void> => {
        stackTrace.push('L1_Start');
        await level2();
        stackTrace.push('L1_End');
      };

      await level1();

      const expected: string[] = [
        'L1_Start',
        'L2_Start',
        'L3_Start',
        'L3_End',
        'L2_End',
        'L1_End'
      ];

      expect(stackTrace.length).assertEqual(6);
      for (let i = 0; i < expected.length; i++) {
        expect(stackTrace[i]).assertEqual(expected[i]);
      }
    });

    /**
     * @tc.name   asyncSecTest0030
     * @tc.number ASYNC_SEC_TEST_0030
     * @tc.desc   Verify execution order in mixed Nested + Concurrent scenarios
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('asyncSecTest0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const logs: string[] = [];

      const workerTask = async (name: string, delay: number): Promise<void> => {
        logs.push(`${name}_Start`);
        await new Promise<void>((resolve) => setTimeout(resolve, delay));
        logs.push(`${name}_End`);
      };

      const middleManager = async (): Promise<void> => {
        logs.push('Manager_Start');

        await Promise.all([
          workerTask('TaskA', 10),
          workerTask('TaskB', 50)
        ]);

        logs.push('Manager_End');
      };

      const director = async (): Promise<void> => {
        logs.push('Director_Start');
        await middleManager();
        logs.push('Director_End');
      };

      await director();

      expect(logs[0]).assertEqual('Director_Start');
      expect(logs[1]).assertEqual('Manager_Start');

      const indexAStart = logs.indexOf('TaskA_Start');
      const indexBStart = logs.indexOf('TaskB_Start');
      const indexAEnd = logs.indexOf('TaskA_End');
      const indexBEnd = logs.indexOf('TaskB_End');

      expect(indexAStart > 1).assertTrue();
      expect(indexBStart > 1).assertTrue();

      expect(indexAStart < indexAEnd).assertTrue();
      expect(indexBStart < indexAEnd).assertTrue();

      expect(indexAEnd < indexBEnd).assertTrue();

      const indexMgrEnd = logs.indexOf('Manager_End');
      expect(indexMgrEnd > indexBEnd).assertTrue();

      expect(logs[logs.length - 1]).assertEqual('Director_End');
    });
    /**
     * @tc.name   asyncSecTest0031
     * @tc.number ASYNC_SEC_TEST_0031
     * @tc.desc   Verify that inner exceptions are captured by outer layers without data loss
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('asyncSecTest0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      class PaymentError extends Error {
        transactionId: string;
        errorCode: number;

        constructor(msg: string, id: string, code: number) {
          super(msg);
          this.name = 'PaymentError';
          this.transactionId = id;
          this.errorCode = code;
        }
      }

      const processPayment = async (id: string): Promise<void> => {
        await new Promise<void>((resolve) => setTimeout(resolve, 10));
        throw new PaymentError('Insufficient Funds', id, 1001);
      };

      const handleCheckout = async (): Promise<void> => {
        await processPayment('TX_999');
      };

      try {
        await handleCheckout();
        expect(true).assertFalse();
      } catch (e) {
        expect(e instanceof PaymentError).assertTrue();

        if (e instanceof PaymentError) {
          expect(e.message).assertEqual('Insufficient Funds');
          expect(e.transactionId).assertEqual('TX_999');
          expect(e.errorCode).assertEqual(1001);
        }
      }
    });

    /**
     * @tc.name   asyncSecTest0032
     * @tc.number ASYNC_SEC_TEST_0032
     * @tc.desc   Verify exception bubbling from deep nested calls to top level
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('asyncSecTest0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const trace: string[] = [];

      const deepFunction = async (): Promise<void> => {
        trace.push('Enter_L3');
        throw new Error('Core_Failure');
      };

      const middleFunction = async (): Promise<void> => {
        trace.push('Enter_L2');
        await deepFunction();
        trace.push('Exit_L2');
      };

      const topFunction = async (): Promise<void> => {
        trace.push('Enter_L1');
        await middleFunction();
        trace.push('Exit_L1');
      };

      try {
        await topFunction();
        expect(true).assertFalse();
      } catch (e) {
        const err = e as Error;
        expect(err.message).assertEqual('Core_Failure');
      }

      expect(trace.length).assertEqual(3);
      expect(trace[0]).assertEqual('Enter_L1');
      expect(trace[1]).assertEqual('Enter_L2');
      expect(trace[2]).assertEqual('Enter_L3');

      expect(trace.indexOf('Exit_L2')).assertEqual(-1);
      expect(trace.indexOf('Exit_L1')).assertEqual(-1);
    });

    /**
     * @tc.name   asyncSecTest0033
     * @tc.number ASYNC_SEC_TEST_0033
     * @tc.desc   Verify impact of nested branch exception on other branches (Promise.all fail-fast)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('asyncSecTest0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {

      const branchSuccess = async (): Promise<string> => {
        await new Promise<void>((resolve) => setTimeout(resolve, 50));
        return 'Success';
      };

      const branchFail = async (): Promise<string> => {
        await new Promise<void>((resolve) => setTimeout(resolve, 10));
        throw new Error('Branch_Failed');
      };

      const parentTask = async (): Promise<string[]> => {
        return await Promise.all([branchSuccess(), branchFail()]);
      };

      try {
        await parentTask();
        expect(true).assertFalse();
      } catch (e) {
        const err = e as Error;
        expect(err.message).assertEqual('Branch_Failed');
      }

    });

    /**
     * @tc.name   asyncSecTest0034
     * @tc.number ASYNC_SEC_TEST_0034
     * @tc.desc   Verify type inference and value propagation in multi-level generic async functions
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('asyncSecTest0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      class Box<T> {
        value: T;
        constructor(val: T) {
          this.value = val;
        }
      }

      const innerIdentity = async <T>(item: T): Promise<T> => {
        await new Promise<void>((resolve) => setTimeout(resolve, 5));
        return item;
      };

      const middleWrapper = async <T>(item: T): Promise<T> => {
        const result = await innerIdentity<T>(item);
        return result;
      };

      const outerWrapper = async <T>(item: T): Promise<T> => {
        return await middleWrapper<T>(item);
      };

      const numResult = await outerWrapper<number>(12345);
      expect(numResult).assertEqual(12345);

      const strResult = await outerWrapper<string>('Generic_Flow');
      expect(strResult).assertEqual('Generic_Flow');

      const boxInput = new Box<number>(99);
      const boxResult = await outerWrapper<Box<number>>(boxInput);

      expect(boxResult instanceof Box).assertTrue();
      expect(boxResult.value).assertEqual(99);
      expect(boxResult).assertEqual(boxInput);
    });

    /**
     * @tc.name   asyncSecTest0035
     * @tc.number ASYNC_SEC_TEST_0035
     * @tc.desc   Verify automatic unwrapping of nested Promises (Promise<Promise<T>> -> Promise<T>)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('asyncSecTest0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const returnDirect = async <T>(val: T): Promise<T> => {
        return val;
      };

      const returnPromise = async <T>(val: T): Promise<T> => {
        return Promise.resolve(val);
      };

      const returnAwait = async <T>(val: T): Promise<T> => {
        return await Promise.resolve(val);
      };

      const testVal = 'AutoUnwrap';

      const res1 = await returnDirect<string>(testVal);
      const res2 = await returnPromise<string>(testVal);
      const res3 = await returnAwait<string>(testVal);

      expect(res1).assertEqual(testVal);
      expect(res2).assertEqual(testVal);
      expect(res3).assertEqual(testVal);

      expect(typeof res2).assertEqual('string');
    });

    /**
     * @tc.name   asyncSecTest0036
     * @tc.number ASYNC_SEC_TEST_0036
     * @tc.desc   Verify transitivity of generic constraints (T extends Entity) in nested functions
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('asyncSecTest0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      class BaseEntity {
        id: number = 0;
        createdAt: number = 0;
      }

      class UserEntity extends BaseEntity {
        username: string = '';
      }

      class ProductEntity extends BaseEntity {
        sku: string = '';
      }

      const updateTimestamp = async <T extends BaseEntity>(entity: T): Promise<T> => {
        await new Promise<void>((resolve) => setTimeout(resolve, 5));
        entity.createdAt = 1234567890;
        return entity;
      };

      const processEntity = async <T extends BaseEntity>(entity: T): Promise<T> => {
        if (entity.id <= 0) {
          throw new Error('Invalid ID');
        }
        return await updateTimestamp<T>(entity);
      };

      const user = new UserEntity();
      user.id = 101;
      user.username = 'Alice';

      const processedUser = await processEntity<UserEntity>(user);

      expect(processedUser.id).assertEqual(101);
      expect(processedUser.username).assertEqual('Alice');
      expect(processedUser.createdAt).assertEqual(1234567890);

      const product = new ProductEntity();
      product.id = 202;
      product.sku = 'PROD-X';

      const processedProduct = await processEntity<ProductEntity>(product);
      expect(processedProduct.sku).assertEqual('PROD-X');
      expect(processedProduct.createdAt).assertEqual(1234567890);

      const invalidProduct = new ProductEntity();
      invalidProduct.id = 0;

      try {
        await processEntity<ProductEntity>(invalidProduct);
        expect(true).assertFalse();
      } catch (e) {
        expect(e instanceof Error).assertTrue();
        if (e instanceof Error) {
          expect(e.message).assertEqual('Invalid ID');
        }
      }
    });

    /**
     * @tc.name   asyncSecTest0037
     * @tc.number ASYNC_SEC_TEST_0037
     * @tc.desc   Verify consistency of parameters passed from outer to inner async functions
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('asyncSecTest0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      class ConfigObj {
        mode: string = '';
        active: boolean = false;
      }

      const innerLevel = async (id: number, config: ConfigObj, tags: string[]): Promise<boolean> => {
        if (id !== 1001) return false;

        if (config.mode !== 'strict') return false;
        if (config.active !== true) return false;

        if (tags.length !== 2) return false;
        if (tags[0] !== 'A' || tags[1] !== 'B') return false;

        return true;
      };

      const outerLevel = async (id: number, config: ConfigObj, tags: string[]): Promise<boolean> => {
        return await innerLevel(id, config, tags);
      };

      const testConfig = new ConfigObj();
      testConfig.mode = 'strict';
      testConfig.active = true;
      const testTags: string[] = ['A', 'B'];

      const isConsistent = await outerLevel(1001, testConfig, testTags);
      expect(isConsistent).assertTrue();
    });

    /**
     * @tc.name   asyncSecTest0038
     * @tc.number ASYNC_SEC_TEST_0038
     * @tc.desc   Verify structure and type correctness of return values propagated from inner to outer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('asyncSecTest0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      class UserProfile {
        id: number = 0;
        meta: Map<string, string> = new Map();
      }

      const createProfile = async (uid: number): Promise<UserProfile> => {
        await new Promise<void>((resolve) => setTimeout(resolve, 5));
        const p = new UserProfile();
        p.id = uid;
        p.meta.set('role', 'admin');
        p.meta.set('region', 'CN');
        return p;
      };

      const fetchUserProfile = async (uid: number): Promise<UserProfile> => {
        return await createProfile(uid);
      };

      const result = await fetchUserProfile(888);

      expect(result instanceof UserProfile).assertTrue();
      expect(result.id).assertEqual(888);

      expect(result.meta.size).assertEqual(2);
      expect(result.meta.get('role')).assertEqual('admin');
      expect(result.meta.get('region')).assertEqual('CN');
    });

    /**
     * @tc.name   asyncSecTest0039
     * @tc.number ASYNC_SEC_TEST_0039
     * @tc.desc   Verify 'this' context binding in nested async class methods
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('asyncSecTest0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {

      class AsyncCalculator {
        multiplier: number = 10;
        baseValue: number = 5;

        async innerCompute(input: number): Promise<number> {
          await new Promise<void>((resolve) => setTimeout(resolve, 5));
          return input * this.multiplier;
        }

        async calculate(input: number): Promise<number> {
          const partial = this.baseValue + input;
          return await this.innerCompute(partial);
        }
      }

      const calc = new AsyncCalculator();

      calc.multiplier = 2;
      calc.baseValue = 10;

      const result = await calc.calculate(5);

      expect(result).assertEqual(30);

      const calc2 = new AsyncCalculator();
      const result2 = await calc2.calculate(5);
      expect(result2).assertEqual(100);
    });
    /**
     * @tc.name   asyncSecTest0040
     * @tc.number ASYNC_SEC_TEST_0040
     * @tc.desc   Verify handling of "illegal" inputs (null/undefined/NaN/Empty) without crashing
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('asyncSecTest0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      class InputWrapper {
        strVal: string | null | undefined = null;
        numVal: number = 0;
      }

      const safeProcess = async (input: InputWrapper): Promise<string> => {

        await new Promise<void>((resolve) => setTimeout(resolve, 5));

        if (input.strVal === null || input.strVal === undefined) {
          return 'Default_String';
        }

        if (input.strVal.length === 0) {
          return 'Empty_String_Detected';
        }

        if (Number.isNaN(input.numVal)) {
          return 'Invalid_Number';
        }

        return `Processed_${input.strVal}`;
      };

      const inputNull = new InputWrapper();
      inputNull.strVal = null;
      const resNull = await safeProcess(inputNull);
      expect(resNull).assertEqual('Default_String');

      const inputUndefined = new InputWrapper();
      inputUndefined.strVal = undefined;
      const resUndefined = await safeProcess(inputUndefined);
      expect(resUndefined).assertEqual('Default_String');

      const inputEmpty = new InputWrapper();
      inputEmpty.strVal = '';
      const resEmpty = await safeProcess(inputEmpty);
      expect(resEmpty).assertEqual('Empty_String_Detected');

      const inputNaN = new InputWrapper();
      inputNaN.strVal = 'Valid';
      inputNaN.numVal = Number.NaN;
      const resNaN = await safeProcess(inputNaN);
      expect(resNaN).assertEqual('Invalid_Number');
    });

    /**
     * @tc.name   asyncSecTest0041
     * @tc.number ASYNC_SEC_TEST_0041
     * @tc.desc   Verify async calculation correctness with extreme numerical values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('asyncSecTest0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const asyncCalc = async (a: number, b: number): Promise<number> => {
        await new Promise<void>((resolve) => setTimeout(resolve, 5));
        return a + b;
      };

      const maxSafe = Number.MAX_SAFE_INTEGER;
      const resMax = await asyncCalc(maxSafe, 0);
      expect(resMax).assertEqual(maxSafe);

      const minSafe = Number.MIN_SAFE_INTEGER;
      const resMin = await asyncCalc(minSafe, 0);
      expect(resMin).assertEqual(minSafe);

      const overflowStart = Math.pow(2, 1024);
      const resInf = await asyncCalc(overflowStart, 0);
      expect(resInf).assertEqual(Infinity);

      const resFloat = await asyncCalc(0.1, 0.2);
      expect(Math.abs(resFloat - 0.3) < 0.0000001).assertTrue();
    });

    /**
     * @tc.name   asyncSecTest0042
     * @tc.number ASYNC_SEC_TEST_0042
     * @tc.desc   Verify stability when parsing/transferring large data structures
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('asyncSecTest0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      class DataItem {
        id: number = 0;
        payload: string = '';
      }

      const largeList: DataItem[] = [];
      const ITEM_COUNT = 5000;

      for (let i = 0; i < ITEM_COUNT; i++) {
        const item = new DataItem();
        item.id = i;
        item.payload = `Content_${i}`;
        largeList.push(item);
      }

      const processLargeList = async (list: DataItem[]): Promise<number> => {
        let checkSum = 0;
        for (let i = 0; i < list.length; i++) {
          checkSum += list[i].id;
          if (i % 1000 === 0) {
            await new Promise<void>((resolve) => setTimeout(resolve, 1));
          }
        }
        return checkSum;
      };

      const startTime = new Date().getTime();
      const resultSum = await processLargeList(largeList);
      const endTime = new Date().getTime();

      const expectedSum = (ITEM_COUNT - 1) * ITEM_COUNT / 2;

      expect(resultSum).assertEqual(expectedSum);

      expect(endTime - startTime > 0).assertTrue();
    });

    /**
     * @tc.name   asyncSecTest0043
     * @tc.number ASYNC_SEC_TEST_0043
     * @tc.desc   Verify compatibility with special characters (symbols, escape chars, unicode)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('asyncSecTest0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const asyncEcho = async (input: string): Promise<string> => {
        await new Promise<void>((resolve) => setTimeout(resolve, 5));
        return input;
      };

      const escapeStr = "Line1\nLine2\tTabbed\"Quoted\"\\Backslash";
      const resEscape = await asyncEcho(escapeStr);
      expect(resEscape).assertEqual(escapeStr);

      const symbolStr = "!@#$%^&*()_+{}|:<>?`-=[]';/.,~";
      const resSymbol = await asyncEcho(symbolStr);
      expect(resSymbol).assertEqual(symbolStr);

      const unicodeStr = "Hello 🌍, this is a test 🧪 with Kanji 漢字";
      const resUnicode = await asyncEcho(unicodeStr);

      expect(resUnicode).assertEqual(unicodeStr);
      expect(resUnicode.length > 0).assertTrue();
      expect(resUnicode.includes('🌍')).assertTrue();
    });

    /**
     * @tc.name   asyncSecTest0044
     * @tc.number ASYNC_SEC_TEST_0044
     * @tc.desc   Verify async operation throws timeout error and does not wait indefinitely
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('asyncSecTest0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const slowTask = async (): Promise<string> => {
        await new Promise<void>((resolve) => setTimeout(resolve, 100));
        return 'Finished_Slowly';
      };

      const executeWithTimeout = async (timeoutMs: number): Promise<string> => {
        let timerId: number = -1;

        const timeoutPromise = new Promise<string>((_, reject) => {
          timerId = setTimeout(() => {
            reject(new Error('Timeout_Occurred'));
          }, timeoutMs);
        });

        try {
          const result = await Promise.race([slowTask(), timeoutPromise]);
          clearTimeout(timerId);
          return result;
        } catch (e) {
          clearTimeout(timerId);
          if (e instanceof Error) {
            throw e;
          }
          throw new Error('Unknown Error');
        }
      };

      const startTime = new Date().getTime();

      try {
        await executeWithTimeout(20);
        expect(true).assertFalse();
      } catch (e) {
        const endTime = new Date().getTime();
        const duration = endTime - startTime;

        expect(e instanceof Error).assertTrue();
        if (e instanceof Error) {
          expect(e.message).assertEqual('Timeout_Occurred');
        }

        expect(duration < 80).assertTrue();
      }
    });

    /**
     * @tc.name   asyncSecTest0045
     * @tc.number ASYNC_SEC_TEST_0045
     * @tc.desc   Verify subsequent logic cancellation (cooperative cancellation) after timeout
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('asyncSecTest0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      class TaskContext {
        isCancelled: boolean = false;
        resultData: string = 'Initial';
      }

      const context = new TaskContext();

      const cancellableTask = async (ctx: TaskContext): Promise<void> => {
        await new Promise<void>((resolve) => setTimeout(resolve, 20));

        if (ctx.isCancelled) return;
        await new Promise<void>((resolve) => setTimeout(resolve, 50));

        if (!ctx.isCancelled) {
          ctx.resultData = 'Modified_By_Task';
        }
      };

      const runWithCancel = async (ctx: TaskContext): Promise<void> => {
        const timeoutMs = 30;

        const taskPromise = cancellableTask(ctx);

        const timeoutPromise = new Promise<void>((_, reject) => {
          setTimeout(() => {
            ctx.isCancelled = true;
            reject(new Error('Timeout'));
          }, timeoutMs);
        });

        await Promise.race([taskPromise, timeoutPromise]);
      };

      try {
        await runWithCancel(context);
      } catch (e) {
      }

      await new Promise<void>((resolve) => setTimeout(resolve, 100));

      expect(context.resultData).assertEqual('Initial');
    });

    /**
     * @tc.name   asyncSecTest0046
     * @tc.number ASYNC_SEC_TEST_0046
     * @tc.desc   Verify retry mechanism (count and interval) upon failure/timeout
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('asyncSecTest0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      class ServiceMock {
        callCount: number = 0;
        lastCallTime: number = 0;
      }
      const service = new ServiceMock();

      const unstableFetch = async (): Promise<string> => {
        const now = new Date().getTime();

        if (service.callCount > 0) {
          const diff = now - service.lastCallTime;

          expect(diff >= 40).assertTrue();
        }

        service.lastCallTime = now;
        service.callCount++;

        await new Promise<void>((resolve) => setTimeout(resolve, 5));

        if (service.callCount < 3) {
          throw new Error('Temporary_Failure');
        }
        return 'Success';
      };

      const executeWithRetry = async (maxRetries: number, interval: number): Promise<string> => {
        let attempts = 0;
        while (attempts < maxRetries) {
          try {
            return await unstableFetch();
          } catch (e) {
            attempts++;
            if (attempts >= maxRetries) {
              if (e instanceof Error) throw e;
              throw new Error('Unknown Error');
            }

            await new Promise<void>((resolve) => setTimeout(resolve, interval));
          }
        }
        return 'Failed';
      };

      const startTime = new Date().getTime();

      const result = await executeWithRetry(5, 50);

      expect(result).assertEqual('Success');

      expect(service.callCount).assertEqual(3);

      const totalTime = new Date().getTime() - startTime;
      expect(totalTime >= 100).assertTrue();
    });

    /**
     * @tc.name   asyncSecTest0047
     * @tc.number ASYNC_SEC_TEST_0047
     * @tc.desc   Verify AbortController-like cancellation pattern throwing specific exception
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('asyncSecTest0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      class CancelError extends Error {
        constructor(msg: string) {
          super(msg);
          this.name = 'CancelError';
        }
      }

      class CancelSignal {
        isAborted: boolean = false;

        abort(): void {
          this.isAborted = true;
        }

        check(): void {
          if (this.isAborted) {
            throw new CancelError('Operation_Aborted');
          }
        }
      }

      const longRunningTask = async (signal: CancelSignal): Promise<string> => {
        signal.check();

        await new Promise<void>((resolve) => setTimeout(resolve, 20));

        signal.check();

        return 'Completed';
      };

      const signal = new CancelSignal();

      const taskPromise = longRunningTask(signal);

      setTimeout(() => {
        signal.abort();
      }, 10);

      try {
        await taskPromise;
        expect(true).assertFalse();
      } catch (e) {
        expect(e instanceof CancelError).assertTrue();

        if (e instanceof CancelError) {
          expect(e.message).assertEqual('Operation_Aborted');
        }
      }
    });

    /**
     * @tc.name   asyncSecTest0048
     * @tc.number ASYNC_SEC_TEST_0048
     * @tc.desc   Verify resource cleanup (locks/data) after cancellation using finally block
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('asyncSecTest0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      class CancelError extends Error {
        constructor() { super('Aborted'); }
      }

      class CancelToken {
        isCancelled: boolean = false;
        cancel(): void { this.isCancelled = true; }
      }

      class SharedLock {
        isActive: boolean = false;
        acquire(): void { this.isActive = true; }
        release(): void { this.isActive = false; }
      }

      const lock = new SharedLock();
      const token = new CancelToken();

      const secureTask = async (): Promise<void> => {
        lock.acquire();
        try {
          await new Promise<void>((resolve) => setTimeout(resolve, 50));

          if (token.isCancelled) {
            throw new CancelError();
          }
        } finally {
          lock.release();
        }
      };

      const p = secureTask();

      await new Promise<void>((resolve) => setTimeout(resolve, 20));
      token.cancel();

      try {
        await p;
      } catch (e) {
        expect(e instanceof CancelError).assertTrue();
      }

      expect(lock.isActive).assertFalse();
    });

    /**
     * @tc.name   asyncSecTest0049
     * @tc.number ASYNC_SEC_TEST_0049
     * @tc.desc   Verify full cancellation of batch async tasks (Promise.all)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('asyncSecTest0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      class CancelSignal {
        isAborted: boolean = false;
        abort(): void { this.isAborted = true; }
      }

      class ProgressTracker {
        completedCount: number = 0;
      }
      const tracker = new ProgressTracker();
      const signal = new CancelSignal();

      const worker = async (id: number, duration: number): Promise<void> => {
        await new Promise<void>((resolve) => setTimeout(resolve, duration));

        if (signal.isAborted) {
          throw new Error(`Worker_${id}_Cancelled`);
        }

        tracker.completedCount++;
      };

      const tasks = [
        worker(1, 10),
        worker(2, 50),
        worker(3, 50)
      ];

      setTimeout(() => {
        signal.abort();
      }, 25);

      try {
        await Promise.all(tasks);
        expect(true).assertFalse();
      } catch (e) {

        const err = e as Error;
        expect(err.message.includes('Cancelled')).assertTrue();
      }

      expect(tracker.completedCount).assertEqual(1);
    });

    /**
     * @tc.name   asyncSecTest0050
     * @tc.number ASYNC_SEC_TEST_0050
     * @tc.desc   Verify result consistency across multiple calls (Pure Async Function)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('asyncSecTest0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const calculateAsync = async (base: number, exponent: number): Promise<number> => {
        await new Promise<void>((resolve) => setTimeout(resolve, 2));
        return Math.pow(base, exponent);
      };

      const baseVal = 2;
      const expVal = 10;
      const expectedResult = 1024;

      const res1 = await calculateAsync(baseVal, expVal);
      const res2 = await calculateAsync(baseVal, expVal);
      const res3 = await calculateAsync(baseVal, expVal);

      expect(res1).assertEqual(expectedResult);
      expect(res1).assertEqual(res2);
      expect(res2).assertEqual(res3);

      const promises: Promise<number>[] = [
        calculateAsync(baseVal, expVal),
        calculateAsync(baseVal, expVal),
        calculateAsync(baseVal, expVal)
      ];

      const concurrentResults = await Promise.all(promises);

      expect(concurrentResults[0]).assertEqual(expectedResult);
      expect(concurrentResults[1]).assertEqual(expectedResult);
      expect(concurrentResults[2]).assertEqual(expectedResult);
    });

    /**
     * @tc.name   asyncSecTest0051
     * @tc.number ASYNC_SEC_TEST_0051
     * @tc.desc   Verify idempotency of repeated async calls (State should settle and remain consistent)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('asyncSecTest0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      class ServiceManager {
        state: string = 'IDLE';
        initTimestamp: number = 0;
        operationCount: number = 0;

        async initialize(): Promise<string> {
          if (this.state === 'READY') {
            return 'Already_Ready';
          }

          await new Promise<void>((resolve) => setTimeout(resolve, 10));

          this.state = 'READY';
          this.initTimestamp = new Date().getTime();
          this.operationCount++;
          return 'Initialization_Complete';
        }
      }

      const service = new ServiceManager();

      const res1 = await service.initialize();
      expect(res1).assertEqual('Initialization_Complete');
      expect(service.state).assertEqual('READY');
      expect(service.operationCount).assertEqual(1);

      const firstTs = service.initTimestamp;

      const res2 = await service.initialize();
      const res3 = await service.initialize();

      expect(res2).assertEqual('Already_Ready');
      expect(res3).assertEqual('Already_Ready');

      expect(service.operationCount).assertEqual(1);

      expect(service.initTimestamp).assertEqual(firstTs);
    });

    /**
     * @tc.name   asyncSecTest0052
     * @tc.number ASYNC_SEC_TEST_0052
     * @tc.desc   Stress test: High frequency calls (1000+) to verify no degradation/leaks
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('asyncSecTest0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const lightTask = async (index: number): Promise<number> => {
        await new Promise<void>((resolve) => setTimeout(resolve, 0));
        return index;
      };

      const iterationCount = 1000;
      const tasks: Promise<number>[] = [];

      const startTime = new Date().getTime();

      for (let i = 0; i < iterationCount; i++) {
        tasks.push(lightTask(i));
      }

      const results = await Promise.all(tasks);

      const endTime = new Date().getTime();

      expect(results.length).assertEqual(iterationCount);

      expect(results[0]).assertEqual(0);
      expect(results[iterationCount - 1]).assertEqual(iterationCount - 1);

      const duration = endTime - startTime;

      expect(duration < 5000).assertTrue();
    });

    /**
     * @tc.name   asyncSecTest0053
     * @tc.number ASYNC_SEC_TEST_0053
     * @tc.desc   Verify fault tolerance and retry effectiveness when dependencies are unstable
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('asyncSecTest0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {

      class UnstableService {
        failureThreshold: number;
        callCount: number = 0;

        constructor(failuresBeforeSuccess: number) {
          this.failureThreshold = failuresBeforeSuccess;
        }

        async request(): Promise<string> {
          this.callCount++;
          await new Promise<void>((resolve) => setTimeout(resolve, 5));

          if (this.callCount <= this.failureThreshold) {
            throw new Error('Service_Unavailable_503');
          }
          return 'Success_Data';
        }
      }

      const executeWithRetry = async (service: UnstableService, maxRetries: number): Promise<string> => {
        let attempts = 0;
        let lastError: Error | null = null;

        while (attempts <= maxRetries) {
          try {
            return await service.request();
          } catch (e) {
            attempts++;
            if (e instanceof Error) {
              lastError = e;
            } else {
              lastError = new Error('Unknown Error');
            }

            if (attempts > maxRetries) {
              throw lastError;
            }

            await new Promise<void>((resolve) => setTimeout(resolve, 10));
          }
        }
        return 'Should_Not_Reach_Here';
      };

      const serviceA = new UnstableService(3);
      const resultA = await executeWithRetry(serviceA, 5);

      expect(resultA).assertEqual('Success_Data');
      expect(serviceA.callCount).assertEqual(4);

      const serviceB = new UnstableService(5);

      try {
        await executeWithRetry(serviceB, 3);
        expect(true).assertFalse();
      } catch (e) {
        expect(e instanceof Error).assertTrue();
        if (e instanceof Error) {
          expect(e.message).assertEqual('Service_Unavailable_503');
        }
        expect(serviceB.callCount).assertEqual(4);
      }
    });

    /**
     * @tc.name   asyncSecTest0054
     * @tc.number ASYNC_SEC_TEST_0054
     * @tc.desc   Verify data consistency and resource competition control under multi-instance concurrent calls
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('asyncSecTest0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      class Inventory {
        stock: number = 100;
        private _isLocked: boolean = false;
        private _waitingResolvers: ((value: void) => void)[] = [];

        async lock(): Promise<void> {
          if (!this._isLocked) {
            this._isLocked = true;
            return;
          }
          await new Promise<void>((resolve) => {
            this._waitingResolvers.push(resolve);
          });
        }

        unlock(): void {
          if (this._waitingResolvers.length > 0) {
            const next = this._waitingResolvers.shift();
            if (next) next();
          } else {
            this._isLocked = false;
          }
        }
      }

      const globalInventory = new Inventory();
      const PURCHASE_COUNT = 50;

      const purchaseItem = async (qty: number): Promise<boolean> => {
        await globalInventory.lock();

        try {
          const currentStock = globalInventory.stock;

          await new Promise<void>((resolve) => setTimeout(resolve, 2));

          if (currentStock >= qty) {
            globalInventory.stock = currentStock - qty;
            return true;
          }
          return false;

        } finally {
          globalInventory.unlock();
        }
      };

      const tasks: Promise<boolean>[] = [];
      for (let i = 0; i < PURCHASE_COUNT; i++) {
        tasks.push(purchaseItem(1));
      }

      const results = await Promise.all(tasks);

      let successCount = 0;
      for (let i = 0; i < results.length; i++) {
        if (results[i]) successCount++;
      }

      expect(successCount).assertEqual(PURCHASE_COUNT);

      expect(globalInventory.stock).assertEqual(100 - PURCHASE_COUNT);
    });
  })
}