/**
 * Copyright (c) 2023 Huawei Device Co., Ltd.
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
 import taskpool from '@ohos.taskpool';
 import { image } from '@kit.ImageKit';

 export async function taskpoolTest(pixelMap: image.PixelMap) {
  console.info('www data start taskpool');
  try {
    let task = new taskpool.Task(pixelTest, pixelMap);
    taskpool.execute(task);
  } catch (err) {
    console.error('www data execute error');
  }
 }

 @Concurrent
 export async function pixelTest(pixelMap: image.PixelMap){
  console.info('www data start pixelTest');
  setTimeout(()=>{
    console.info('www data 开始异步阻塞');
  }, 1000)
  return pixelMap;
 }