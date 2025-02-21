/*
 * Copyright (c) 2022 Huawei Device Co., Ltd.
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
import AVSession from './AVSession.test.js';
import AVSessionManager from './AVSessionManager.test.js';
import AVSessionCallback from './AVSessionCallback.test.js';
import AVSessionManagerCallback from './AVSessionManagerCallback.test.js';
import AVSessionErrorCode from './AVSessionErrorCode.test.js';
import AVSessionControllerJSTest from './AVSessionControllerJSTest.js';
import AVSessionJSTest from './AVSessionJSTest.js';
import AVSessionEnum from './AVSessionEnum.test.js';
import AVSessionControllerErrorCode from './AVSessionControllerErrorCode.test.js';

export default function testsuite() {
    AVSession();
    AVSessionManager();
    AVSessionCallback();
    AVSessionManagerCallback();
    AVSessionErrorCode();
    AVSessionJSTest();
    AVSessionControllerJSTest();
    AVSessionEnum();
    AVSessionControllerErrorCode();
}