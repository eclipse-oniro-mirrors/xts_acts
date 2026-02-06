/**
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
import { describe, beforeEach, it, expect, Level } from "@ohos/hypium"
import router from '@ohos.router';
import { Driver, ON } from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common';


export default function BarStateTest() {
  describe('BarStateTest', () => {
    beforeEach(async (done: Function) => {
      console.info("BarStateTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/RichEditor/barState',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get BarStateTest state pages: " + JSON.stringify(pages));
        if (!("barState" == pages.name)) {
          console.info("get BarStateTest state pages.name: " + JSON.stringify(pages.name));
          let result = await router.replaceUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push BarStateTest success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push BarStateTest page error: " + err);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.number    SUB_ACE_BarStateTest_0010
     * @tc.name      BarStateTest_0010
     * @tc.desc      get RichEditor barState: BarState.Auto
     * @tc.level:    Level 0
     * @tc.type :
     * @tc.size :
     */
    it('BarStateTest_0010', Level.LEVEL0, async (done: Function) => {
      console.info('[BarStateTest_0010] START');
      let strJson = getInspectorByKey('RichEditor_BarState_Auto');
      let obj: ESObject = JSON.parse(strJson);
      console.info('[BarStateTest_0010] BarState: ' + JSON.stringify(obj.$attrs.barState));
      expect(obj.$attrs.barState).assertEqual(1);
      console.info('[BarStateTest_0010] END');
      done();
    });

    /**
     * @tc.number    SUB_ACE_BarStateTest_0020
     * @tc.name      BarStateTest_0020
     * @tc.desc      set RichEditor barState: BarState.Off
     * @tc.level:    Level 0
     * @tc.type :
     * @tc.size :
     */
    it('BarStateTest_0020', Level.LEVEL0, async (done: Function) => {
      console.info('[BarStateTest_0020] START');
      let strJson = getInspectorByKey('RichEditor_BarState_Off');
      let obj: ESObject = JSON.parse(strJson);
      console.info('[BarStateTest_0020] BarState: ' + JSON.stringify(obj.$attrs.barState));
      expect(obj.$attrs.barState).assertEqual(0);
      console.info('[BarStateTest_0020] END');
      done();
    });

    /**
     * @tc.number    SUB_ACE_BarStateTest_0030
     * @tc.name      BarStateTest_0030
     * @tc.desc      set RichEditor barState: BarState.On
     * @tc.level:    Level 0
     * @tc.type :
     * @tc.size :
     */
    it('BarStateTest_0030', Level.LEVEL0, async (done: Function) => {
      console.info('[BarStateTest_0030] START');
      let strJson = getInspectorByKey('RichEditor_BarState_On');
      let obj: ESObject = JSON.parse(strJson);
      console.info('[BarStateTest_0030] BarState: ' + JSON.stringify(obj.$attrs.barState));
      expect(obj.$attrs.barState).assertEqual(2);
      console.info('[BarStateTest_0030] END');
      done();
    });

    /**
     * @tc.number    SUB_ACE_BarStateTest_0040
     * @tc.name      BarStateTest_0040
     * @tc.desc      set RichEditor barState: default
     * @tc.level:    Level 0
     * @tc.type :
     * @tc.size :
     */
    it('BarStateTest_0040', Level.LEVEL0, async (done: Function) => {
      console.info('[BarStateTest_0040] START');
      let strJson = getInspectorByKey('RichEditor_barState_default');
      let obj: ESObject = JSON.parse(strJson);
      console.info('[BarStateTest_0040] BarState: ' + JSON.stringify(obj.$attrs.barState));
      expect(obj.$attrs.barState).assertEqual(1);
      console.info('[BarStateTest_0040] END');
      done();
    });

    /**
     * @tc.number    SUB_ACE_BarStateTest_0050
     * @tc.name      BarStateTest_0050
     * @tc.desc      get RichEditor barState: undefined
     * @tc.level:    Level 0
     * @tc.type :
     * @tc.size :
     */
    it('BarStateTest_0050', Level.LEVEL0, async (done: Function) => {
      console.info('[BarStateTest_0050] START');
      let strJson = getInspectorByKey('RichEditor_barState_undefined');
      let obj: ESObject = JSON.parse(strJson);
      console.info('[BarStateTest_0050] BarState: ' + JSON.stringify(obj.$attrs.barState));
      expect(obj.$attrs.barState).assertEqual(1);
      console.info('[BarStateTest_0050] END');
      done();
    });
  })
}