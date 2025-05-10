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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from "@ohos/hypium"
import router from '@ohos.router';
import {
  UiComponent,
  Driver,
  Component,
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
import { MessageManager, Callback } from '../../MainAbility/common/MessageManager';

export default function V2ToV1() {
  describe('V2ToV1', () => {
    beforeEach(async (done: Function) => {
      console.info("V2ToV1 beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/V1V2Mix/V2ToV1",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get V2ToV1 state pages:" + JSON.stringify(pages));
        if (!("StateMap0010" == pages.name)) {
          console.info("get V2ToV1 pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push V2ToV1 page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push V2ToV1 page error:" + err);
      }
      console.info("V2ToV1 beforeEach end");
      done();
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("V2ToV1 after each called");
    });
    /**
     * @tc.number v2Tov1_0100
     * @tc.name v2Tov1_0100
     * @tc.desc test v2 to v1
     * @tc.level Level 1
     * @tc.type
     * @tc.size
     */
    it('v2Tov1_0100', 0, async (done: Function) => {
      console.info('[v2Tov1_0100] START');
      let Json = getInspectorByKey('string_param1');
      let Obj: ESObject = JSON.parse(Json);
      await CommonFunc.sleep(1000);
      console.log('[v2Tov1_0100] Obj ' + JSON.stringify(Obj.$attrs.content));
      expect(Obj.$attrs.content).assertEqual('v1 stringValue1: hello2');
      done();
    })
    it('v2Tov1_0200', 0, async (done: Function) => {
      console.info('[v2Tov1_0200] START');
      let Json = getInspectorByKey('enum_value1');
      let Obj: ESObject = JSON.parse(Json);
      console.log('[v2Tov1_0200] Obj ' + JSON.stringify(Obj.$attrs.content));
      expect(Obj.$attrs.content).assertEqual('v1 enumValue1: 2');
      done();
    })
    it('v2Tov1_0300', 0, async (done: Function) => {
      console.info('[v2Tov1_0300] START');
      let Json = getInspectorByKey('local_value1');
      let Obj: ESObject = JSON.parse(Json);
      await CommonFunc.sleep(1000);
      console.log('[v2Tov1_0300] Obj ' + JSON.stringify(Obj.$attrs.content));
      expect(Obj.$attrs.content).assertEqual('v1 localValue1: TestProvider');
      done();
    })
    it('v2Tov1_0400', 0, async (done: Function) => {
      console.info('[v2Tov1_0400] START');
      let Json = getInspectorByKey('bool_value1');
      let Obj: ESObject = JSON.parse(Json);
      await CommonFunc.sleep(1000);
      console.log('[v2Tov1_0400] Obj ' + JSON.stringify(Obj.$attrs.content));
      expect(Obj.$attrs.content).assertEqual('v1 boolValue1: false');
      done();
    })
    it('v2Tov1_0500', 0, async (done: Function) => {
      console.info('[v2Tov1_0500] START');
      let Json = getInspectorByKey('undefined_value1');
      let Obj: ESObject = JSON.parse(Json);
      await CommonFunc.sleep(1000);
      console.log('[v2Tov1_0500] Obj ' + JSON.stringify(Obj.$attrs.content));
      expect(Obj.$attrs.content).assertEqual('v1 undefinedValue1: undefined');
      done();
    })
    it('v2Tov1_0600', 0, async (done: Function) => {
      console.info('[v2Tov1_0600] START');
      let Json = getInspectorByKey('null_value1');
      let Obj: ESObject = JSON.parse(Json);
      await CommonFunc.sleep(1000);
      console.log('[v2Tov1_0600] Obj4 ' + JSON.stringify(Obj.$attrs.content));
      expect(Obj.$attrs.content).assertEqual('v1 nullValue1: null');
      done();
    })
    it('v2Tov1_0700', 0, async (done: Function) => {
      console.info('[v2Tov1_0700] START');
      let Json = getInspectorByKey('func_value2');
      let Obj: ESObject = JSON.parse(Json);
      await CommonFunc.sleep(1000);
      console.log('[v2Tov1_0700] Obj ' + JSON.stringify(Obj.$attrs.content));
      expect(Obj.$attrs.content).assertEqual('v1 funcValue2: 0');
      done();
    })
    it('v2Tov1_0800', 0, async (done: Function) => {
      console.info('[v2Tov1_0800] START');
      let Json = getInspectorByKey('map_value');
      let Obj: ESObject = JSON.parse(Json);
      await CommonFunc.sleep(1000);
      console.log('[v2Tov1_0800] Obj ' + JSON.stringify(Obj.$attrs.content));
      expect(Obj.$attrs.content).assertEqual('v1 mapValue: v2,v2');
      done();
    })
    it('v2Tov1_0900', 0, async (done: Function) => {
      console.info('[v2Tov1_0900] START');
      let Json = getInspectorByKey('date_value');
      let Obj: ESObject = JSON.parse(Json);
      await CommonFunc.sleep(1000);
      console.log('[v2Tov1_0900] Obj ' + JSON.stringify(Obj.$attrs.content));
      expect(Obj.$attrs.content).assertEqual('v1 dateValue: Mon Nov 11 2024 00:00:00 GMT+0800');
      done();
    })
    it('v2Tov1_1000', 0, async (done: Function) => {
      console.info('[v2Tov1_1000] START');
      let Json = getInspectorByKey('arr_value');
      let Obj: ESObject = JSON.parse(Json);
      await CommonFunc.sleep(1000);
      console.log('[v2Tov1_1000] Obj ' + JSON.stringify(Obj.$attrs.content));
      expect(Obj.$attrs.content).assertEqual('v1 arrValue: 1,2');
      done();
    })
    it('v2Tov1_1100', 0, async (done: Function) => {
      console.info('[v2Tov1_1100] START');
      let Json = getInspectorByKey('set_value');
      let Obj: ESObject = JSON.parse(Json);
      await CommonFunc.sleep(1000);
      console.log('[v2Tov1_1100] Obj ' + JSON.stringify(Obj.$attrs.content));
      expect(Obj.$attrs.content).assertEqual('v1 setValue: v2, v2');
      done();
    })
  })
}