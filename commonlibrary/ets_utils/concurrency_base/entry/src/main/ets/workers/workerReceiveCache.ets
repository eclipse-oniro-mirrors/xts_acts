import { worker, ThreadWorkerGlobalScope, MessageEvents, ArkTSUtils } from '@kit.ArkTS';

const workerPort: ThreadWorkerGlobalScope = worker.workerPort;
// receive object from worker owner
workerPort.onmessage = (e: MessageEvents) => {
  let cache = e.data as ArkTSUtils.SendableLruCache<number, number>;
  cache.put(1, 2)
  cache.put(2, 10)
  // send object to worker owner
  workerPort.postMessage('Has finish cache operation')
  workerPort.close()
}