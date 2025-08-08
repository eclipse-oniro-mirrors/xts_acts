import worker, { ThreadWorkerGlobalScope, MessageEvents, ErrorEvent } from '@ohos.worker';
const workerPort: ThreadWorkerGlobalScope = worker.workerPort;
workerPort.onmessage =  (e: MessageEvents)=> {
  workerPort.postMessage("success")
}
throw Error("throw error task19")