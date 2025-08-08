/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import worker,{ MessageEvents, ThreadWorkerGlobalScope } from '@ohos.worker'
import image from '@ohos.multimedia.image'


const workerPort: ThreadWorkerGlobalScope = worker.workerPort

workerPort.onmessage = async (e: MessageEvents) => {
  console.info(`worker :worker receive data ${JSON.stringify(e.data)} ${JSON.stringify(e.data.getComponent(4))}`)
  let component: image.Component = await e.data.getComponent(4)
  console.info(`worker: component ${component}`)

  console.info(`worker: componentType is: ${component.componentType}`)
  console.info(`worker: rowStride is: ${component.rowStride}`)
  console.info(`worker: pixelStride is: ${component.pixelStride}`)
  console.info(`worker: byteBuffer is: ${component.byteBuffer}`)
  let flag = component.componentType === 4 && component.byteBuffer ? true : false
  console.info(`worker: flag is: ${flag}`)
  workerPort.postMessageWithSharedSendable(flag)
}