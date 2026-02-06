'use static';
/**
 * Copyright (c) 2025-2026 Huawei Device Co., Ltd.
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, Level, expect } from '../../../../hypium/index';
import router from '@ohos.router';
import { Driver, Component, UiWindow, ON, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix } from '@ohos.UiTest';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import inspector from '@ohos.arkui.inspector';
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { BusinessError } from '@ohos.base';
import { UtilsTest } from '../Util.test';
import emitter from '@ohos.events.emitter';
import Utils from '../../../ets/MainAbility/common/Utils'
import { RecordData } from '@ohos.base';

let emitKey = "emitUserAgent";
export default function web9Jsunit() {
  describe('web9Jsunit', () => {
    beforeAll(() => {
      console.info("web9Jsunit beforeAll start");
      await UtilsTest.msSleep(4000)
      await UtilsTest.startAbility("com.arkui.ace.global.api11.static", "EntryAbility")
      await UtilsTest.msSleep(4000)
    });

    beforeEach(async (): Promise<void> => {
      console.info("web9Jsunit beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/web/web_api_9',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get web9Jsunit state pages:" + JSON.stringify(pages));
        if (!("web_api_9" == pages.name)) {
          console.info("get web9Jsunit pages.name:" + JSON.stringify(pages.name));
          // await router 有已知问题，先注释,使用 routerInstance.pushUrl(options);
          // let result = await routerInstance.pushUrl(options);
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
          // console.info("push web9Jsunit page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push web9Jsunit page error:" + err);
      }
      console.info("web9Jsunit beforeEach end");
    });

    afterEach(async () => {
      console.info("web afterEach start:" + emitKey);
      try {
        let backData: emitter.EventData = {
          data: {
            "ACTION": emitKey
          } as Record<String,RecordData>
        }
        let backEvent: emitter.InnerEvent = {
          eventId: 10,
          priority: emitter.EventPriority.LOW
        }
        console.info("start send emitKey");
        emitter.emit(backEvent, backData);
      } catch (err) {
        console.info("emit emitKey  err: " + JSON.stringify(err));
      }
      await Utils.sleep(2000);
    })

    
    
    
/**
     * @tc.number   webContextMenuResultTest_static_001
     * @tc.name     webContextMenuResultTest_static_001
     * @tc.desc     webContextMenuResultTest_static_001
     * @tc.level    Level.LEVEL0
     */
it('webContextMenuResultTest_static_001', Level.LEVEL0, async () => {
      try {
        emitKey = "emitwebContextMenuResult";
        // Utils.registerContainEvent("webContextMenuResult", true, 1101);
      }catch(Error) {
        expect().assertFail();
      }
    })

    

    
    
/**
     * @tc.number   setWebControllerTest_static_002
     * @tc.name     setWebControllerTest_static_002
     * @tc.desc     setWebControllerTest_static_002
     * @tc.level    Level.LEVEL0
     */
it('setWebControllerTest_static_002', Level.LEVEL0, async () => {
            try {
              emitKey = "emitsetWebController";
              // Utils.registerContainEvent("setWebController", true, 1102);
            }catch(Error) {
                expect().assertFail();
            }
    })

    

    
  
/**
     * @tc.number   setWebControllerTest_static_003
     * @tc.name     setWebControllerTest_static_003
     * @tc.desc     setWebControllerTest_static_003
     * @tc.level    Level.LEVEL0
     */
it('setWebControllerTest_static_003', Level.LEVEL0, async () => {
            try {
              emitKey = "emitHitTestValue";
              // Utils.registerContainEvent("HitTestValue", true, 1103);
              inspector.sendEventByKey('web2', 10, '');
            }catch(Error) {
                expect().assertFail();
            }
    })
  })
}