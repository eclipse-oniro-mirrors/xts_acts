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

import { beforeAll, describe, expect, it, Level, afterEach } from '@ohos/hypium';
import Utils from '../common/Utils';
import { Driver, ON } from '@ohos.UiTest';

export default function textAreaBarStateTest() {

  describe('textAreaBarStateTest', () => {

    let PAGE_TAG = 'TextAreaBarStateTest';

    beforeAll(async (done: Function) => {
      await Utils.pushPage(`textArea/${PAGE_TAG}`, done);
    });

    /**
     * @tc.name   textAreaBarState_0010
     * @tc.number textAreaBarState_0010
     * @tc.desc   test barState is ARKUI_BAR_STATE_OFF
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('textAreaBarState_0010', Level.LEVEL1, async (done: Function) => {
      console.info('[textAreaBarState_0010] START');
      await Utils.sleep(100);
      let strJson1 = getInspectorByKey('areaTest1');
      let obj1: ESObject = JSON.parse(strJson1);
      console.info('[textAreaBarState_0010] barState: ' + obj1.$attrs.barState);
      expect(obj1.$attrs.barState).assertEqual('BarState.OFF');
      console.info('[textAreaBarState_0010] END');
      done();
    })

    /**
     * @tc.name   textAreaBarState_0020
     * @tc.number textAreaBarState_0020
     * @tc.desc   test barState is ARKUI_BAR_STATE_AUTO
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('textAreaBarState_0020', Level.LEVEL1, async (done: Function) => {
      console.info('[textAreaBarState_0020] START');
      await Utils.sleep(100);
      let strJson1 = getInspectorByKey('areaTest2');
      let obj1: ESObject = JSON.parse(strJson1);
      console.info('[textAreaBarState_0020] barState: ' + obj1.$attrs.barState);
      expect(obj1.$attrs.barState).assertEqual('BarState.AUTO');
      console.info('[textAreaBarState_0020] END');
      done();
    })

    /**
     * @tc.name   textAreaBarState_0030
     * @tc.number textAreaBarState_0030
     * @tc.desc   test barState is ARKUI_BAR_STATE_ON
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('textAreaBarState_0030', Level.LEVEL1, async (done: Function) => {
      console.info('[textAreaBarState_0030] START');
      await Utils.sleep(100);
      let strJson1 = getInspectorByKey('areaTest3');
      let obj1: ESObject = JSON.parse(strJson1);
      console.info('[textAreaBarState_0030] barState: ' + obj1.$attrs.barState);
      expect(obj1.$attrs.barState).assertEqual('BarState.ON');
      console.info('[textAreaBarState_0030] END');
      done();
    })

    /**
     * @tc.name   textAreaBarState_0040
     * @tc.number textAreaBarState_0040
     * @tc.desc   test barState is 4
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('textAreaBarState_0040', Level.LEVEL2, async (done: Function) => {
      console.info('[textAreaBarState_0040] START');
      await Utils.sleep(100);
      let strJson1 = getInspectorByKey('areaTest4');
      let obj1: ESObject = JSON.parse(strJson1);
      console.info('[textAreaBarState_0040] barState: ' + obj1.$attrs.barState);
      expect(obj1.$attrs.barState).assertEqual('BarState.AUTO');
      console.info('[textAreaBarState_0040] END');
      done();
    })
  })
}