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
import pasteboardNdkTest from './Ability.test';
import UdmfNdkTest from './UdmfNdkTest';
import UdsNdkTest from './UdsNdkTest';
import UtdNdkTest from './UtdNdkTest';
import ContentNdkTest from './ContentNdkTest';
import UdsNdkexTest from './udsndkex.test';
import UdmfNdkexTest from './udmfndkex.test';

export default function testsuite() {
    pasteboardNdkTest();
    UdmfNdkTest();
    UdsNdkTest();
    UtdNdkTest();
    ContentNdkTest();
    UdsNdkexTest();
    UdmfNdkexTest();
}