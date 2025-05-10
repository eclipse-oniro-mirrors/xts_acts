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
import CommonFunc from '../../MainAbility/common/Common';


export default function RichEditorStopBackPressTest() {
  describe('RichEditorStopBackPressTest', () => {
    beforeEach(async (done: Function) => {
      console.info("RichEditorStopBackPressTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/RichEditor/RichEditorStopBackPress',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get RichEditorStopBackPressTest state pages: " + JSON.stringify(pages));
        if (!("RichEditorStopBackPress" == pages.name)) {
          console.info("get RichEditorStopBackPressTest state pages.name: " + JSON.stringify(pages.name));
          let result = await router.replaceUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push RichEditorStopBackPressTest success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push RichEditorStopBackPressTest page error: " + err);
        expect().assertFail();
      }
      done();
    });
    
    /**
     * @tc.number    SUB_ACE_RichEditorStopBackPressTest_0010
     * @tc.name      RichEditorStopBackPressTest_0010
     * @tc.desc      test RichEditor StopBackPress: true
     * @tc.level:    Level 2
     * @tc.type : 
     * @tc.size :
     */
    it('RichEditorStopBackPressTest_0010', Level.LEVEL2, async (done: Function) => {
      console.info('[RichEditorStopBackPressTest_0010] START');
      let strJson = getInspectorByKey('RichEditor_stopBackPress_true');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[RichEditorStopBackPressTest_0010] component obj is: " + JSON.stringify(obj.$attrs));
      expect(obj.$attrs.stopBackPress).assertEqual('true');      
      console.info('[RichEditorStopBackPressTest_0010] END');
      done();
    });

    /**
     * @tc.number    SUB_ACE_RichEditorStopBackPressTest_0020
     * @tc.name      RichEditorStopBackPressTest_0020
     * @tc.desc      test RichEditor StopBackPress: false
     * @tc.level:    Level 2
     * @tc.type :
     * @tc.size :
     */
    it('RichEditorStopBackPressTest_0020', Level.LEVEL2, async (done: Function) => {
      console.info('[RichEditorStopBackPressTest_0020] START');
      let strJson = getInspectorByKey('RichEditor_stopBackPress_false');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[RichEditorStopBackPressTest_0020] component obj is: " + JSON.stringify(obj.$attrs));
      expect(obj.$attrs.stopBackPress).assertEqual('false');
      console.info('[RichEditorStopBackPressTest_0020] END');
      done();
    });

    /**
     * @tc.number    SUB_ACE_RichEditorStopBackPressTest_0030
     * @tc.name      RichEditorStopBackPressTest_0030
     * @tc.desc      test RichEditor StopBackPress: default
     * @tc.level:    Level 2
     * @tc.type :
     * @tc.size :
     */
    it('RichEditorStopBackPressTest_0030', Level.LEVEL2, async (done: Function) => {
      console.info('[RichEditorStopBackPressTest_0030] START');
      let strJson = getInspectorByKey('RichEditor_stopBackPress_default');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[RichEditorStopBackPressTest_0030] component obj is: " + JSON.stringify(obj.$attrs));
      expect(obj.$attrs.stopBackPress).assertEqual('true');
      console.info('[RichEditorStopBackPressTest_0030] END');
      done();
    });

    /**
     * @tc.number    SUB_ACE_RichEditorStopBackPressTest_0040
     * @tc.name      RichEditorStopBackPressTest_0040
     * @tc.desc      test RichEditor StopBackPress: undefined
     * @tc.level:    Level 2
     * @tc.type :
     * @tc.size :
     */
    it('RichEditorStopBackPressTest_0040', Level.LEVEL2, async (done: Function) => {
      console.info('[RichEditorStopBackPressTest_0040] START');
      let strJson = getInspectorByKey('RichEditor_stopBackPress_undefined');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[RichEditorStopBackPressTest_0040] component obj is: " + JSON.stringify(obj.$attrs));
      expect(obj.$attrs.stopBackPress).assertEqual('true');
      console.info('[RichEditorStopBackPressTest_0040] END');
      done();
    });
  })
}

