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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import router from '@ohos.router';
import {UiComponent, Driver, Component, UiWindow, ON, BY, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common';

export default function LocalStorageReturnValue() {
  describe('LocalStorageReturnValue', () => {
    beforeEach(async (done: Function) => {
      console.info("LocalStorageReturnValue beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/Storage/LocalStorageReturnValue",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get LocalStorageReturnValue state pages:" + JSON.stringify(pages));
        if (!("LocalStorageReturnValue" == pages.name)) {
          console.info("get LocalStorageReturnValue pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push LocalStorageReturnValue page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push LocalStorageReturnValue page error:" + err);
      }
      console.info("LocalStorageReturnValue beforeEach end");
      done();
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("LocalStorageReturnValue after each called");
    });

    /**
     * @tc.name   LocalStorageReturnValue_001
     * @tc.number LocalStorageReturnValue_001
     * @tc.desc   all keys in LocalStorage.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('LocalStorageReturnValue_001', Level.LEVEL0, async (done: Function) => {
      console.info('[LocalStorageReturnValue_001] START');
      await CommonFunc.sleep(1000);
      let para: Record<string, number> = { 'LocalStorageReturnValue_001': 47 };
      let storage: LocalStorage = new LocalStorage(para);
      let refToPropA1: AbstractProperty<number> | undefined = storage.ref('LocalStorageReturnValue_001_no');
      console.info("[LocalStorageReturnValue_001] component refToPropA1: " + JSON.stringify(refToPropA1));
      expect(refToPropA1).assertEqual(undefined);
      let delFlag: boolean = storage.delete('LocalStorageReturnValue_001');
      let delFlag_no: boolean = storage.delete('LocalStorageReturnValue_001_no');
      console.info("[LocalStorageReturnValue_001] component delFlag: " + JSON.stringify(delFlag));
      console.info("[LocalStorageReturnValue_001] component delFlag_no: " + JSON.stringify(delFlag_no));
      expect(delFlag).assertTrue();
      expect(delFlag_no).assertFalse();
      console.info('[LocalStorageReturnValue_001] END');
      done();
    });

    /**
     * @tc.name   LocalStorageReturnValue_002
     * @tc.number LocalStorageReturnValue_002
     * @tc.desc   all keys in LocalStorage.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('LocalStorageReturnValue_002', Level.LEVEL0, async (done: Function) => {
      console.info('[LocalStorageReturnValue_002] START');
      await CommonFunc.sleep(1000);
      let para: Record<string, number> = { 'LocalStorageReturnValue_002': 47 };
      let storage: LocalStorage = new LocalStorage(para);
      let res_0021: boolean = storage.has('LocalStorageReturnValue_002');
      let res_0022: boolean = storage.has('LocalStorageReturnValue_002_no');
      let res_0023: string|undefined = storage.get<string>('LocalStorageReturnValue_002_no');
      console.info("[LocalStorageReturnValue_002] component res_0021: " + JSON.stringify(res_0021));
      console.info("[LocalStorageReturnValue_002] component res_0022: " + JSON.stringify(res_0022));
      console.info("[LocalStorageReturnValue_002] component res_0023: " + JSON.stringify(res_0023));
      expect(res_0021).assertTrue();
      expect(res_0022).assertFalse();
      expect(res_0023).assertEqual(undefined);
      storage.delete('LocalStorageReturnValue_002');
      console.info('[LocalStorageReturnValue_002] END');
      done();
    });

    /**
     * @tc.name   LocalStorageReturnValue_003
     * @tc.number LocalStorageReturnValue_003
     * @tc.desc   all keys in LocalStorage.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('LocalStorageReturnValue_003', Level.LEVEL0, async (done: Function) => {
      console.info('[LocalStorageReturnValue_003] START');
      await CommonFunc.sleep(1000);
      let para: Record<string, number> = { 'LocalStorageReturnValue_003': 47 };
      let storage: LocalStorage = new LocalStorage(para);
      let res_0031: boolean = storage.set('LocalStorageReturnValue_003', 48);
      let res_0032: boolean = storage.set('LocalStorageReturnValue_003_no', 50);
      console.info("[LocalStorageReturnValue_003] component res_0031: " + JSON.stringify(res_0031));
      console.info("[LocalStorageReturnValue_003] component res_0032: " + JSON.stringify(res_0032));
      expect(res_0031).assertTrue();
      expect(res_0032).assertFalse();
      storage.delete('LocalStorageReturnValue_003');
      console.info('[LocalStorageReturnValue_003] END');
      done();
    });

    /**
     * @tc.name   LocalStorageReturnValue_004
     * @tc.number LocalStorageReturnValue_004
     * @tc.desc   all keys in LocalStorage.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('LocalStorageReturnValue_004', Level.LEVEL0, async (done: Function) => {
      console.info('[LocalStorageReturnValue_004] START');
      await CommonFunc.sleep(1000);
      let para: Record<string, number> = { 'LocalStorageReturnValue_004': 47 };
      let storage: LocalStorage = new LocalStorage(para);
      let x = storage.link<number>('LocalStorageReturnValue_004');
      let res_0040: boolean = storage.clear();
      console.info("[LocalStorageReturnValue_004] component res_0040: " + JSON.stringify(res_0040) + " keys:" + storage.keys());
      x.aboutToBeDeleted();
      let res_0041: boolean = storage.clear();
      console.info("[LocalStorageReturnValue_004] component res_0041: " + JSON.stringify(res_0041) + " keys:" + storage.keys());
      expect(res_0040).assertFalse();
      expect(res_0041).assertTrue();
      storage.delete('LocalStorageReturnValue_004');
      console.info('[LocalStorageReturnValue_004] END');
      done();
    });

    /**
     * @tc.name   LocalStorageReturnValue_005
     * @tc.number LocalStorageReturnValue_005
     * @tc.desc   all keys in LocalStorage.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('LocalStorageReturnValue_005', Level.LEVEL0, async (done: Function) => {
      console.info('[LocalStorageReturnValue_005] START');
      await CommonFunc.sleep(1000);
      let driver: Driver = Driver.create();
      let btn1: Component = await driver.findComponent(ON.id("getSharedLocalStorage_001"));
      await btn1.click();
      await CommonFunc.sleep(1000);
      let res_0051: undefined | LocalStorage = AppStorage.get<undefined | LocalStorage>('getSharedLocalStorage_001');
      console.info("[LocalStorageReturnValue_005] component res_0051: " + JSON.stringify(res_0051));
      expect(res_0051).assertEqual(undefined);
      console.info("[LocalStorageReturnValue_005] component appstorage.clear: " + JSON.stringify(AppStorage.clear()));
      console.info('[LocalStorageReturnValue_005] END');
      done();
    });

  })
}
