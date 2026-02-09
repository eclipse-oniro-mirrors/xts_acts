'use static';
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
import hilog from '@ohos.hilog';
import { describe,beforeAll, beforeEach, afterEach, it, expect, Level } from "../../../hypium/index"
import events_emitter from '@ohos.events.emitter';
import CommonFunc from '../../ets/MainAbility/common/Common';
import inspector from '@ohos.arkui.inspector'
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest, startAbility, stopApplication } from './Util.test';
import router from '@ohos.router';
import Utils  from "../../ets/MainAbility/common/Utils";

export default function systempromptJsunit() {
  describe('systempromptJsunit', () => {

    beforeAll(() => {
      await UtilsTest.startAbility("com.arkui.ace.picker.static", "EntryAbility")
    })

    beforeEach(async (): Promise<void> => {
      console.info("prompt beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/systemPrompt',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get prompt state pages:" + JSON.stringify(pages));
        if (!("systemPrompt" == pages.name)) {
          console.info("get prompt pages.name:" + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push prompt  page error:" + err);
      }
    });

    afterEach(async () => {
      await Utils.sleep(1000);
      console.info("prompt each called");
    });
    
    /**
     * @tc.number   promptTest_static_0100
     * @tc.name     promptTest_static_0100
     * @tc.desc     promptTest_static_0100
     * @tc.level    Level.LEVEL1
     */
it('promptTest_static_0100', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('promptTest_0100 is start');
      try{
        await Utils.sleep(1500);
      console.info("promptTest_0100 click result is: " + JSON.stringify(inspector.sendEventByKey('button1',10,"")));
      await Utils.sleep(1500);
      }catch(e){
        expect().assertFail()
      }
      
      console.info('promptTest_0100 END');
      done();
    });
    
    /**
     * @tc.number   promptTest_static_0200
     * @tc.name     promptTest_static_0200
     * @tc.desc     promptTest_static_0200
     * @tc.level    Level.LEVEL1
     */
it('promptTest_static_0200', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('promptTest_0200 is start');
      try{
        await Utils.sleep(1500);
      console.info("promptTest_0200 click result is: " + JSON.stringify(inspector.sendEventByKey('button2',10,"")));
      await Utils.sleep(1500);
      }catch(e){
        expect().assertFail()
      }
      console.info('promptTest_0200 END');
      done();
    });
  })
}




