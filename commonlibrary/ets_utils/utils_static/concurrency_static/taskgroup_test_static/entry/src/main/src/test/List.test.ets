import taskPoolTaskGroupExecuteTest from './TaskPoolTaskGroupExecute.test';
import taskPoolErrorSuccessTest from './TaskPoolErrorSuccessTest.test';
import taskPoolErrorSuccess2Test from './TaskPoolErrorSuccess2Test.test';
import taskPoolTaskMultipleUITest from './TaskPoolTaskMultipleUITest.test';
import TaskGroupAbilityTest from './TaskGroupAbility.test';
import TaskGroupAbilityTest2 from './TaskGroupAbility2.test';

export default function testsuite() {
    taskPoolTaskGroupExecuteTest();
    taskPoolErrorSuccessTest();
    taskPoolErrorSuccess2Test();
    taskPoolTaskMultipleUITest();
    TaskGroupAbilityTest();
    TaskGroupAbilityTest2();
}
