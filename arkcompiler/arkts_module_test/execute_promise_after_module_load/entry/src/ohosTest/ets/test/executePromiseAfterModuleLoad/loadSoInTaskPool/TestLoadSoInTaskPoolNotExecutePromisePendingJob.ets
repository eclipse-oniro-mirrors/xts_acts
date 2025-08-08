import taskpool from '@ohos.taskpool';

@Concurrent
async function taskFunc() {
  await import("./TriggerModuleLoad")
}

function taskpoolExecute() {
  taskpool.execute(taskFunc)
}

taskpoolExecute()

export let testLoadSoInTaskPoolNotExecutePromisePendingJobDone = true;