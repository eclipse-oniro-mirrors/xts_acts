import { ArkTSUtils, MessageEvents, ThreadWorkerGlobalScope, worker } from '@kit.ArkTS';

const workerPort: ThreadWorkerGlobalScope = worker.workerPort;
// send new object to worker owner
workerPort.onmessage = (e: MessageEvents) => {
  let promptStr = e.data as string;
  if (promptStr === 'start') {
    let cache = new ArkTSUtils.SendableLruCache<number, number>();
    cache.put(1, 2)
    cache.put(2, 10)
    // send object to worker owner
    workerPort.postMessageWithSharedSendable(cache)
  } else {
    // need to wait owner finish cache operation
    workerPort.close()
  }
}