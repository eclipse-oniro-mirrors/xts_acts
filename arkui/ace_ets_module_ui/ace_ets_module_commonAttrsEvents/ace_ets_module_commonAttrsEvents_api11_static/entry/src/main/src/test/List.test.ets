'use static';
/**
 * Copyright (c) 2025 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http:www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import enableJsunit from './enabledTest/EnableJsunit.test';
import touchAbleJsunit from './touchableTest/TouchAbleJsunit.test';
import onChildTouchTest from './onChildTouchTest/onChildTouchTest.test';
import monopolizeTest from './monopolizeEventsTest/monopolizeTest.test';
import assemblyCallbackTest from './AssemblyCallbackTest.test';
import sourceTypeJsunit from './SourceTypeJsunit.test';

export default function testsuite() {
  assemblyCallbackTest();
  enableJsunit(); //pass：4
  touchAbleJsunit(); //pass:2
  onChildTouchTest();
  monopolizeTest();
  sourceTypeJsunit(); //pass:1
}