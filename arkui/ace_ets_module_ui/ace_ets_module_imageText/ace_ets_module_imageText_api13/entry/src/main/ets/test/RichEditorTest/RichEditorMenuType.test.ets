/**
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from "@ohos/hypium"
import router from '@ohos.router';
import {UiComponent, Driver, Component, UiWindow, ON, BY, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common';
import { MessageManager, Callback } from '../../MainAbility/common/MessageManager';


export default function RichEditorMenuType() {
  describe('RichEditorMenuType', () => {
    beforeEach(async (done: Function) => {
      console.info("RichEditorMenuType beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/RichEditor/RichEditorMenuType',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get RichEditorMenuType state pages: " + JSON.stringify(pages));
        if (!("RichEditorMenuType" == pages.name)) {
          console.info("get RichEditorMenuType state pages.name: " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push RichEditorMenuType success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push RichEditorMenuType page error: " + err);
        expect().assertFail();
      }
      done();
    });
    
     /**
     * @tc.number    SUB_ACE_RichEditorMenuType_0100
     * @tc.name      RichEditorMenuType_0100
     * @tc.desc      set api
     * @tc.level:    Level 2
     * @tc.type : 
     * @tc.size :
     */
    it('RichEditorMenuType_0100', Level.LEVEL2, async (done: Function) => {
      console.info('RichEditorMenuType_0100 START');
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('richEditorMenuType1');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[RichEditorMenuType_0100] component obj is: " + JSON.stringify(obj));
      expect(obj.$type).assertEqual('RichEditor');
      console.info('[RichEditorMenuType_0100] END');
      done();
    });

    /**
     * @tc.number    SUB_ACE_RichEditorMenuType_0200
     * @tc.name      RichEditorMenuType_0200
     * @tc.desc      set api
     * @tc.level:    Level 2
     * @tc.type : 
     * @tc.size :
     */
    it('RichEditorMenuType_0200', Level.LEVEL2, async (done: Function) => {
      console.info('RichEditorMenuType_0200 START');
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('richEditorMenuType2');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[RichEditorMenuType_0200] component obj is: " + JSON.stringify(obj));
      expect(obj.$type).assertEqual('RichEditor');
      console.info('[RichEditorMenuType_0200] END');
      done();
    });
  })
}

