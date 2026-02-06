/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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
import writeTest from "./Write.test";
import configureTest from "./Configure.test";
import removeProcessorTest from "./RemoveProcessor.test";
import SetGetUserIdTest from "./SetGetUserId.test";
import SetGetUserPropertyTest from "./SetGetUserProperty.test";
import setEventParamTest from "./SetEventParam.test";
import addWatcherTest from "./AddWatcher.test";
import addProcessorTest from "./AddProcessor.test";
import addProcessorTestFromConfigTest from "./AddProcessorFromConfig.test";
import configEventPolicyTest from "./ConfigEventPolicy.test";

export default function testsuite() {
    writeTest();
    configureTest();
    removeProcessorTest();
    SetGetUserIdTest();
    SetGetUserPropertyTest();
    setEventParamTest();
    addWatcherTest();
    addProcessorTest();
    addProcessorTestFromConfigTest();
    configEventPolicyTest();
}
