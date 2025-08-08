/**
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from "@ohos/hypium"
import router from '@ohos.router';
import {
  UiComponent,
  UiDriver,
  Component,
  Driver,
  UiWindow,
  ON,
  BY,
  MatchPattern,
  DisplayRotation,
  ResizeDirection,
  WindowMode,
  PointerMatrix
} from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common';
import events_emitter from '@ohos.events.emitter'


export default function LocalStoagePropTwoJsunit() {
  describe('LocalStoagePropTwoJsunit', () => {
    beforeEach(async (done: Function) => {
      console.info("LocalStoagePropTwoJsunit beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/State/LocalStoagePropTwo',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get LocalStoagePropTwoJsunit state pages: " + JSON.stringify(pages));
        if (!("LocalStoagePropTwo" == pages.name)) {
          console.info("get LocalStoagePropTwoJsunit state pages.name: " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push LocalStoagePropTwoJsunit page result: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push LocalStoagePropTwoJsunit page error: " + err);
        expect().assertFail();
      }
      done();
    });

    it('LocalStoagePropTwoJsunit_0100', 0, async (done: Function) => {

      console.info('[LocalStoagePropTwoJsunit_0100] START');
      let strJson1 = getInspectorByKey('text_getValue4');
      let obj1: ESObject = JSON.parse(strJson1);
      console.info("[LocalStoagePropTwoJsunit_0100] obj1 is: " + JSON.stringify(obj1));

      expect(obj1.$attrs.content)
        .assertEqual('Prop1:{"value":6}, Prop2:1, Prop3:true, Prop4:abc, Prop5:1, Prop6:{"value":66}, Prop7:[{"value":66},{"value":67}], Prop8:[1,2], Prop9:[true,false], Prop10:["abc","efd"], Prop11:[1,2], Prop12:[{"value":66},{"value":67}]')
      console.info('[LocalStoagePropTwoJsunit_0100] END');
      done();
    });

  })
}
