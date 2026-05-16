import {
  afterAll,
  afterEach,
  beforeAll,
  beforeEach,
  describe,
  expect,
  it,
  TestType,
  Level,
  Size
} from "../../../hypium/index";

export default function executeDelayedTest() {
  describe('executeDelayedTest', (): void => {


    /**
     * @tc.number SUB_ExecuteDelayed_TEST_0100
     * @tc.name ExecuteDelayedTest001
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('ExecuteDelayedTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'ExecuteDelayedTest001';
        console.info(`${TAG} test start`);
        let task1 = true;
        try {
          const task = new taskpool.Task(() => {
            task1 = false;
          });
          await taskpool.executeDelayed(
            100 as Int,
            task,
            taskpool.Priority.IDLE
          );
          console.info("Delayed task completed");
          expect(task1).assertEqual(false);
        } catch (err) {
          err = err as Error;
          console.error(`${TAG} catch error: code =>  message => ${err.message}`);
          expect(false).assertFail();
        }
        console.info(`${TAG} test end`);
        done();
      });


    /**
     * @tc.number SUB_ExecuteDelayed_TEST_0200
     * @tc.name ExecuteDelayedTest002
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('ExecuteDelayedTest002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      const TAG: string = 'ExecuteDelayedTest002';
      console.info(`${TAG} test start`);
      let expectedErrorCaught = false;
      try {
        const task = async (): Promise<undefined> => {
          return undefined;
        };
        await taskpool.executeDelayed(
          -100 as Int,
          new taskpool.Task(task),
          taskpool.Priority.MEDIUM
        ).then((value: Any) => {
          expect(value as undefined).assertEqual(undefined);
        })
      } catch (err) {
        err = err as Error;
        expectedErrorCaught = true;
        console.error(`${TAG} catch error: code =>  message => ${err.message}`);
      }
      console.info(`${TAG} test end`);
      done()
    });


    /**
     * @tc.number SUB_ExecuteDelayed_TEST_0300
     * @tc.name ExecuteDelayedTest003
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('ExecuteDelayedTest003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'ExecuteDelayedTest003';
        console.info(`${TAG} test start`);
        let taskName: string = "taskName";
        let taskExecuted = false;
        try {
          const task1 = new taskpool.Task(taskName,
            () => {
              console.info("DelayedGenericsTask executed after 3000ms");
              taskExecuted = true;
            }
          );
          await taskpool.executeDelayed(
            3000,
            task1,
            taskpool.Priority.IDLE
          );
          expect(task1.name).assertEqual("taskName");
          expect(taskExecuted).assertTrue();
        } catch (err) {
          err = err as Error;
          console.error(`${TAG} catch error: code =>  message => ${err.message}`);
          expect(false).assertFail();
        }
        console.info(`${TAG} test end`);
        done();
      });

    /**
     * @tc.number SUB_ExecuteDelayed_TEST_0400
     * @tc.name ExecuteDelayedTest004
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('ExecuteDelayedTest004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'ExecuteDelayedTest004';
        console.info(`${TAG} test start`);
        let taskExecuted = false;
        let ResultTuple: [int] = [10];
        try {
          const task = new taskpool.Task(
            (params: [int]) => {
              console.info("DelayedGenericsTask executed after 3000ms");
              taskExecuted = true;
              return undefined;
            }, ResultTuple
          );
          await taskpool.executeDelayed(
            3000,
            task,
            taskpool.Priority.HIGH
          ).then((value:Any) => {
            expect(value as undefined).assertEqual(undefined);
          })
          expect(taskExecuted).assertTrue();
        } catch (err) {
          err = err as Error;
          console.error(`${TAG} catch error: code =>  message => ${err.message}`);
          expect(false).assertFail();
        } finally {
          console.info(`${TAG} test end`);
          done();
        }
      });
  })
}