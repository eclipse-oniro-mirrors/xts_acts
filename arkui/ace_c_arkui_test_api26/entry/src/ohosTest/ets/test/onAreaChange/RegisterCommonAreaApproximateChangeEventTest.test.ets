/*
* Copyright (c) 2026 Huawei Device Co., Ltd.
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

import { beforeAll, describe, expect, it, Level, afterEach } from '@ohos/hypium';
import Utils from '../common/Utils';
import { Driver, ON } from '@ohos.UiTest';

export default function RegisterCommonAreaApproximateChangeEventTest() {

describe('RegisterCommonAreaApproximateChangeEventTest', () => {

    let PAGE_TAG = 'RegisterCommonAreaApproximateChangeEventTest';

    beforeAll(async (done: Function) => {
    await Utils.pushPage(`onAreaChange/${PAGE_TAG}`, done);
    });

    /**
    * @tc.name   SUB_ACE_ARKUI_REGISTERCOMMONAREAAPPROXIMATECHANGEEVENT_0100
    * @tc.number SUB_ACE_ARKUI_REGISTERCOMMONAREAAPPROXIMATECHANGEEVENT_0100
    * @tc.desc   SUB_ACE_ARKUI_REGISTERCOMMONAREAAPPROXIMATECHANGEEVENT_0100
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL1
    */
    it('SUB_ACE_ARKUI_REGISTERCOMMONAREAAPPROXIMATECHANGEEVENT_0100', Level.LEVEL1, async (done: Function) => {
    console.info('[SUB_ACE_ARKUI_REGISTERCOMMONAREAAPPROXIMATECHANGEEVENT_0100] START');
    let driver: Driver = Driver.create();
    await Utils.sleep(500);
    let strJson = getInspectorByKey('Text11');
    await Utils.sleep(200);
    let obj: ESObject = JSON.parse(strJson);
    console.info("[SUB_ACE_ARKUI_REGISTERCOMMONAREAAPPROXIMATECHANGEEVENT_0100] component obj is: " + JSON.stringify(obj));
    console.info('[SUB_ACE_ARKUI_REGISTERCOMMONAREAAPPROXIMATECHANGEEVENT_0100] content: ' + obj.$attrs.content);
    expect(obj.$attrs.content).assertEqual('ARKUI_ERROR_CODE_NO_ERROR');
    console.info('[SUB_ACE_ARKUI_REGISTERCOMMONAREAAPPROXIMATECHANGEEVENT_0100] END');
    done();
    });


})
}