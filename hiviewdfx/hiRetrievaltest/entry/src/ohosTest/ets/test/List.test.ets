/*
 * Copyright (C) 2024 Huawei Device Co., Ltd.
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

import HiRetrievalInitTest from './HiRetrievalInit.test';
import HiRetrievalParticipateTest from './HiRetrievalParticipate.test';
import HiRetrievalQuitTest from './HiRetrievalQuit.test';
import HiRetrievalIsParticipantTest from './HiRetrievalIsParticipant.test';
import HiRetrievalGetLastParticipationTimestampTest from './HiRetrievalGetLastParticipationTimestamp.test';
import HiRetrievalRunTest from './HiRetrievalRun.test';
import HiRetrievalGetCurrentConfigTest from './HiRetrievalGetCurrentConfig.test';

export default function testsuite() {
    HiRetrievalParticipateTest();
    HiRetrievalInitTest();
    HiRetrievalQuitTest();
    HiRetrievalIsParticipantTest();
    HiRetrievalGetLastParticipationTimestampTest();
    HiRetrievalRunTest();
    HiRetrievalGetCurrentConfigTest();
}