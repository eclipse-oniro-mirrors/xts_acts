/*
 * Copyright (c) 2023 Huawei Device Co., Ltd.
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

import router from '@ohos.router';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import events_emitter from '@ohos.events.emitter';

export default function RefreshTest() {
  describe('RefreshTest', () => {
    beforeEach(async (done: Function) => {
      console.info("flex beforeEach start");
      let options: router.RouterOptions = {
        url: 'testability/pages/Index',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get Index state success " + JSON.stringify(pages));
        if (!("Index" == pages.name)) {
          console.info("get Index state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          console.info("push Index page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push Index page error: " + err);
      }
      done()
    });

    /*
      *@tc.number ArkUX_Refresh_Visual_0010
      *@tc.name   Support modifying the refresh promptText change of refresh component
      *@tc.desc   Sets the promptText property parameter to different text
      *@tc.size       : MediumTest
      *@tc.type       : Function
      *@tc.level      : Level 0  
      */


    it('ArkUX_Refresh_Visual_0010', Level.LEVEL0, async (done: Function) => {
      console.info('ArkUX_Refresh_Visual_0010 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Refresh_Visual_0010');
          console.info('ArkUX_Refresh_Visual_0010 START  :' + JSON.stringify(strJson));
          let obj: ESObject = JSON.parse(strJson);
          console.info("ArkUX_Refresh_Visual_0010 obj is: " + JSON.stringify(obj));
          let promptText:string = obj.$attrs.promptText
          console.info("ArkUX_Refresh_Visual_0010 promptText: " + JSON.stringify(obj.$attrs.promptText));
          expect(promptText).assertEqual("pull down and refresh : 0");
          console.info('ArkUX_Refresh_Visual_0010 END ');
        } catch (err) {
          expect().assertFail()
          console.info('ArkUX_Refresh_Visual_0010 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 5000)
    });

    /*
      *@tc.number ArkUX_Refresh_Visual_0020
      *@tc.name   Support modifying the refresh promptText change of refresh component
      *@tc.desc   Sets the promptText property parameter to different text
      *@tc.size       : MediumTest
      *@tc.type       : Function
      *@tc.level      : Level 0  
      */


    it('ArkUX_Refresh_Visual_0020', Level.LEVEL0, async (done: Function) => {
      console.info('ArkUX_Refresh_Visual_0020 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Refresh_Visual_0020');
          console.info('ArkUX_Refresh_Visual_0020 START  :' + JSON.stringify(strJson));
          let obj: ESObject = JSON.parse(strJson);
          console.info("ArkUX_Refresh_Visual_0020 obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Refresh_Visual_0020 promptText: " + JSON.stringify(obj.$attrs.promptText));
          let promptText:string = obj.$attrs.promptText
          expect(promptText).assertEqual("*************************");
          console.info('ArkUX_Refresh_Visual_0020 END ');
        } catch (err) {
          expect().assertFail()
          console.info('ArkUX_Refresh_Visual_0020 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 5000)
    });

    /*
      *@tc.number ArkUX_Refresh_Visual_0030
      *@tc.name   Support modifying the refresh promptText change of refresh component
      *@tc.desc   Sets the promptText property parameter to different text
      *@tc.size       : MediumTest
      *@tc.type       : Function
      *@tc.level      : Level 0  
      */


    it('ArkUX_Refresh_Visual_0030', Level.LEVEL0, async (done: Function) => {
      console.info('ArkUX_Refresh_Visual_0030 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Refresh_Visual_0030');
          console.info('ArkUX_Refresh_Visual_0030 START  :' + JSON.stringify(strJson));
          let obj: ESObject = JSON.parse(strJson);
          console.info("ArkUX_Refresh_Visual_0030 obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Refresh_Visual_0030 promptText: " + JSON.stringify(obj.$attrs.promptText));
          let promptText:string = obj.$attrs.promptText
          expect(promptText).assertEqual("1234567890987654321");
          console.info('ArkUX_Refresh_Visual_0030 END ');
        } catch (err) {
          expect().assertFail()
          console.info('ArkUX_Refresh_Visual_0030 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 5000)
    });

    /*
      *@tc.number ArkUX_Refresh_Visual_0040
      *@tc.name   Support modifying the refresh promptText change of refresh component
      *@tc.desc   Sets the promptText property parameter to different text
      *@tc.size       : MediumTest
      *@tc.type       : Function
      *@tc.level      : Level 0  
      */


    it('ArkUX_Refresh_Visual_0040', Level.LEVEL0, async (done: Function) => {
      console.info('ArkUX_Refresh_Visual_0040 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Refresh_Visual_0040');
          console.info('ArkUX_Refresh_Visual_0040 START  :' + JSON.stringify(strJson));
          let obj: ESObject = JSON.parse(strJson);
          console.info("ArkUX_Refresh_Visual_0040 obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Refresh_Visual_0040 promptText: " + JSON.stringify(obj.$attrs.promptText));
          let promptText:string = obj.$attrs.promptText
          expect(promptText).assertEqual("");
          console.info('ArkUX_Refresh_Visual_0040 END ');
        } catch (err) {
          expect().assertFail()
          console.info('ArkUX_Refresh_Visual_0040 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 5000)
    });

    /*
     *@tc.number ArkUX_Refresh_Visual_0050
     *@tc.name   Support modifying the refresh promptText change of refresh component
     *@tc.desc   Sets the promptText property parameter to different text
      *@tc.size       : MediumTest
      *@tc.type       : Function
      *@tc.level      : Level 0  
     */


    it('ArkUX_Refresh_Visual_0050', Level.LEVEL0, async (done: Function) => {
      console.info('ArkUX_Refresh_Visual_0050 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Refresh_Visual_0050');
          console.info('ArkUX_Refresh_Visual_0050 START  :' + JSON.stringify(strJson));
          let obj: ESObject = JSON.parse(strJson);
          console.info("ArkUX_Refresh_Visual_0050 obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Refresh_Visual_0050 promptText: " + JSON.stringify(obj.$attrs.promptText));
          let promptText:string = obj.$attrs.promptText
          expect(promptText).assertEqual("测试是否可以显示汉字");
          console.info('ArkUX_Refresh_Visual_0050 END ');
        } catch (err) {
          expect().assertFail()
          console.info('ArkUX_Refresh_Visual_0050 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 5000)
    });

  })
}