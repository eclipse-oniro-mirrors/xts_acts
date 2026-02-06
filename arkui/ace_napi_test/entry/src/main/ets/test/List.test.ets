/*
 * Copyright (c) 2021 Huawei Device Co., Ltd.
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
import napiStringTest from './NativeApiStringTest';
import napiBufferTest from './NativeApiBufferTest';
import napiSendableTest from './NativeApiSendableTest';
import napiApiTest from './NapiTest';
import napiCheckExTest from './NapiCheckEx.test';
import napiTaskApiTest from './NapiTask.test';
import napiSendableTaskTest from './NapiSendableTask.test';
import napiWorkerTest from './NapiWorker.test';
import napiWorkerGCTest from './NapiWorkerGC.test';

export default function testsuite() {
  napiStringTest();
  napiBufferTest();
  napiSendableTest();
  napiApiTest();
  napiTaskApiTest();
  napiSendableTaskTest();
  napiWorkerTest();
  napiWorkerGCTest();
  napiCheckExTest();
}
