/*
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
import { beforeAll, beforeEach, describe, it } from '@ohos/hypium';
import Utils from './Utils';
import { Driver, ON } from '@ohos.UiTest';
import router from '@ohos.router';

export default function MetaViewport() {

  describe('MetaViewport', () => {
    beforeAll(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/MetaViewport',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get MetaViewport state success " + JSON.stringify(pages));
        if (!("MetaViewport" == pages.name)) {
          console.info("get MetaViewport state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await Utils.sleep(2000);
          console.info("push MetaViewport page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push MetaViewport page error: " + err);
      }
      done()
    });
    beforeEach(async (done: Function) => {
      await Utils.sleep(2000);
      console.info("web beforeEach start");
      done();
    })

    /*
    * @tc.number     : Acts_metaViewport_0100
    * @tc.name       : testMetaViewport001
    * @tc.desc       : test MetaViewport
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 2
    */
    it('metaViewport0100', 0, async (done: Function) => {
      Utils.emitEvent("metaViewport0100", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("metaViewport0100", true, 3701, done);
      let driver = Driver.create();
      await driver.delayMs(1000);
      let StartModel = await driver.findComponent(ON.id("MetaViewport"));
      await StartModel.click();
      await driver.delayMs(1000);
    })

    /*
    * @tc.number     : Acts_metaViewport_0200
    * @tc.name       : testMetaViewport002
    * @tc.desc       : test MetaViewport
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 2
    */
    it('metaViewport0200', 0, async (done: Function) => {
      Utils.emitEvent("metaViewport0200", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("metaViewport0200", true, 3702, done);
      let driver = Driver.create();
      await driver.delayMs(1000);
      let StartModel = await driver.findComponent(ON.id("MetaViewport"));
      await StartModel.click();
      await driver.delayMs(1000);
    })

    /*
    * @tc.number     : Acts_metaViewport_0300
    * @tc.name       : testMetaViewport003
    * @tc.desc       : test MetaViewport
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 2
    */
    it('metaViewport0300', 0, async (done: Function) => {
      Utils.emitEvent("metaViewport0300", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("metaViewport0300", true, 3703, done);
      let driver = Driver.create();
      await driver.delayMs(1000);
      let StartModel = await driver.findComponent(ON.id("MetaViewport"));
      await StartModel.click();
      await driver.delayMs(1000);
    })

    /*
    * @tc.number     : Acts_metaViewport_0400
    * @tc.name       : testMetaViewport004
    * @tc.desc       : test MetaViewport
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 2
    */
    it('metaViewport0400', 0, async (done: Function) => {
      Utils.emitEvent("metaViewport0400", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("metaViewport0400", true, 3704, done);
      let driver = Driver.create();
      await driver.delayMs(1000);
      let StartModel = await driver.findComponent(ON.id("MetaViewport"));
      await StartModel.click();
      await driver.delayMs(1000);
    })

    /*
    * @tc.number     : Acts_metaViewport_0500
    * @tc.name       : testMetaViewport005
    * @tc.desc       : test MetaViewport
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 2
    */
    it('metaViewport0500', 0, async (done: Function) => {
      Utils.emitEvent("metaViewport0500", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("metaViewport0500", true, 3705, done);
      let driver = Driver.create();
      await driver.delayMs(1000);
      let StartModel = await driver.findComponent(ON.id("MetaViewport"));
      await StartModel.click();
      await driver.delayMs(1000);
    })

    /*
    * @tc.number     : Acts_metaViewport_0600
    * @tc.name       : testMetaViewport006
    * @tc.desc       : test MetaViewport
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 2
    */
    it('metaViewport0600', 0, async (done: Function) => {
      Utils.emitEvent("metaViewport0600", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("metaViewport0600", true, 3706, done);
      let driver = Driver.create();
      await driver.delayMs(1000);
      let StartModel = await driver.findComponent(ON.id("MetaViewport"));
      await StartModel.click();
      await driver.delayMs(1000);
    })

    /*
    * @tc.number     : Acts_metaViewport_0700
    * @tc.name       : testMetaViewport007
    * @tc.desc       : test MetaViewport
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 2
    */
    it('metaViewport0700', 0, async (done: Function) => {
      Utils.emitEvent("metaViewport0700", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("metaViewport0700", true, 3707, done);
      let driver = Driver.create();
      await driver.delayMs(1000);
      let StartModel = await driver.findComponent(ON.id("MetaViewport"));
      await StartModel.click();
      await driver.delayMs(1000);
    })

    /*
    * @tc.number     : Acts_metaViewport_0800
    * @tc.name       : testMetaViewport008
    * @tc.desc       : test MetaViewport
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 2
    */
    it('metaViewport0800', 0, async (done: Function) => {
      Utils.emitEvent("metaViewport0800", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("metaViewport0800", true, 3708, done);
      let driver = Driver.create();
      await driver.delayMs(1000);
      let StartModel = await driver.findComponent(ON.id("MetaViewport"));
      await StartModel.click();
      await driver.delayMs(1000);
    })

    /*
    * @tc.number     : Acts_metaViewport_0900
    * @tc.name       : testMetaViewport009
    * @tc.desc       : test MetaViewport
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 2
    */
    it('metaViewport0900', 0, async (done: Function) => {
      Utils.emitEvent("metaViewport0900", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("metaViewport0900", true, 3709, done);
      let driver = Driver.create();
      await driver.delayMs(1000);
      let StartModel = await driver.findComponent(ON.id("MetaViewport"));
      await StartModel.click();
      await driver.delayMs(1000);
    })

    /*
    * @tc.number     : Acts_metaViewport_1000
    * @tc.name       : testMetaViewport010
    * @tc.desc       : test MetaViewport
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 2
    */
    it('metaViewport1000', 0, async (done: Function) => {
      Utils.emitEvent("metaViewport1000", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("metaViewport1000", true, 3710, done);
      let driver = Driver.create();
      await driver.delayMs(1000);
      let StartModel = await driver.findComponent(ON.id("MetaViewport"));
      await StartModel.click();
      await driver.delayMs(1000);
    })
  })
}
