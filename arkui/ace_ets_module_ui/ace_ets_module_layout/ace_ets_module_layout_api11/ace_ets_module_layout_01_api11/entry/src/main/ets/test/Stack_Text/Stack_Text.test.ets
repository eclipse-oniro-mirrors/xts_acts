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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import router from '@ohos.router';
import CommonFunc from "../../MainAbility/common/Common";

export default function Stack_Text() {
  describe('Stack_Text', () => {
    beforeEach(async (done: Function) => {
      console.info("Stack_Text beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Stack_Text/Stack_Text',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get Stack_Text state pages: " + JSON.stringify(pages));
        if (!("Stack_Text" == pages.name)) {
          console.info("get Stack_Text state pages.name: " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push Stack_Text page result: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push Stack_Text page error: " + err);
        expect().assertFail();
      }
      done();
    });

    /* *
      * @tc.number: Stack_Text_001
      * @tc.name  : Stack_Text_001
      * @tc.desc  : set api
      * @tc.level : Level 2
      * @tc.type
      * @tc.size
      */
    it('Stack_Text_001',  Level.LEVEL0, async (done: Function) => {

      console.info('[Stack_Text_001] START');
      await CommonFunc.sleep(1000);

      let strJson1 = getInspectorByKey('Stack_TextInput');
      let obj1: ESObject = JSON.parse(strJson1);
      await CommonFunc.sleep(1000);
      console.info("[Stack_Text_001] Stack_Text obj is: " + JSON.stringify(obj1));
      await CommonFunc.sleep(1000);

      expect(obj1.$attrs.type).assertEqual('InputType.USER_NAME');
      console.info('[Stack_Text_001] END');
      done();
    });

    /* *
      * @tc.number: Stack_Text_002
      * @tc.name  : Stack_Text_002
      * @tc.desc  : set api
      * @tc.level : Level 2
      * @tc.type
      * @tc.size
      */
    it('Stack_Text_002',  Level.LEVEL0, async (done: Function) => {

      console.info('[Stack_Text_002] START');
      await CommonFunc.sleep(1000);

      let strJson1 = getInspectorByKey('Stack_Text_Button1');
      let obj1: ESObject = JSON.parse(strJson1);
      await CommonFunc.sleep(1000);
      console.info("[Stack_Text_002] Stack_Text obj is: " + JSON.stringify(obj1));
      await CommonFunc.sleep(1000);

      expect(obj1.$attrs.controlSize).assertEqual('ControlSize.SMALL');
      expect(obj1.$attrs.buttonStyle).assertEqual('ButtonStyleMode.EMPHASIZED');
      console.info('[Stack_Text_002] END');
      done();
    });

    /* *
      * @tc.number: Stack_Text_003
      * @tc.name  : Stack_Text_003
      * @tc.desc  : set api
      * @tc.level : Level 2
      * @tc.type
      * @tc.size
      */
    it('Stack_Text_003',  Level.LEVEL0, async (done: Function) => {

      console.info('[Stack_Text_003] START');
      await CommonFunc.sleep(1000);

      let strJson1 = getInspectorByKey('Stack_Text_Button2');
      let obj1: ESObject = JSON.parse(strJson1);
      await CommonFunc.sleep(1000);
      console.info("[Stack_Text_003] Stack_Text obj is: " + JSON.stringify(obj1));
      await CommonFunc.sleep(1000);

      expect(obj1.$attrs.controlSize).assertEqual('ControlSize.NORMAL');
      expect(obj1.$attrs.buttonStyle).assertEqual('ButtonStyleMode.NORMAL');
      console.info('[Stack_Text_003] END');
      done();
    });

    /* *
      * @tc.number: Stack_Text_004
      * @tc.name  : Stack_Text_004
      * @tc.desc  : set api
      * @tc.level : Level 2
      * @tc.type
      * @tc.size
      */
    it('Stack_Text_004',  Level.LEVEL0, async (done: Function) => {

      console.info('[Stack_Text_004] START');
      await CommonFunc.sleep(1000);

      let strJson1 = getInspectorByKey('Stack_Text_Button3');
      let obj1: ESObject = JSON.parse(strJson1);
      await CommonFunc.sleep(1000);
      console.info("[Stack_Text_004] Stack_Text obj is: " + JSON.stringify(obj1));
      await CommonFunc.sleep(1000);

      expect(obj1.$attrs.buttonStyle).assertEqual('ButtonStyleMode.TEXTUAL');
      console.info('[Stack_Text_004] END');
      done();
    });

    /* *
      * @tc.number: Stack_Text_005
      * @tc.name  : Stack_Text_005
      * @tc.desc  : set api
      * @tc.level : Level 2
      * @tc.type
      * @tc.size
      */
    it('Stack_Text_005',  Level.LEVEL0, async (done: Function) => {

      console.info('[Stack_Text_005] START');
      await CommonFunc.sleep(1000);

      let strJson1 = getInspectorByKey('Stack_Text');
      let obj1: ESObject = JSON.parse(strJson1);
      await CommonFunc.sleep(1000);
      console.info("[Stack_Text_005] Stack_Text obj is: " + JSON.stringify(obj1));
      await CommonFunc.sleep(1000);

      expect(obj1.$attrs.content).assertEqual('15544889999');
      console.info('[Stack_Text_005] END');
      done();
    });

    /* *
      * @tc.number: Stack_Text_006
      * @tc.name  : Stack_Text_006
      * @tc.desc  : set api
      * @tc.level : Level 2
      * @tc.type
      * @tc.size
      */
    // it('Stack_Text_006',  Level.LEVEL0, async (done: Function) => {
    //
    //   console.info('[Stack_Text_006] START');
    //   await CommonFunc.sleep(1000);
    //
    //   let strJson1 = getInspectorByKey('Stack_TextInput');
    //   let obj1 = JSON.parse(strJson1);
    //   await CommonFunc.sleep(1000);
    //   console.info("[Stack_Text_006] Stack_Text obj is: " + JSON.stringify(obj1));
    //   await CommonFunc.sleep(1000);
    //
    //   expect(obj1.$attrs.enableAutoFill).assertEqual('true');
    //   console.info('[Stack_Text_006] END');
    //   done();
    // });


  })
}
