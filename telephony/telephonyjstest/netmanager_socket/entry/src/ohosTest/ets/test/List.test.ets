/**
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

//other import
import connectionJsunit from './ConnectionJsunit.test';
import socketJsunit from './SocketJsunit.test';
import webSocketJsunit from './WebSocketJsunit.test';
import connectionSecondJsUnit from './ConnectionSecondJsUnit.test';
import networkManagerSocketTest from './NetworkManagerSocket.test'

export default function testsuite() {
  //other
  networkManagerSocketTest();
  socketJsunit();
  webSocketJsunit();
  connectionJsunit();
  connectionSecondJsUnit();
}