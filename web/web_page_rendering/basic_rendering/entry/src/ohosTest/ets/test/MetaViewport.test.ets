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
import { beforeAll, beforeEach, describe, it , TestType, Size, Level } from '@ohos/hypium';
import Utils from './Utils';
import { Driver, ON } from '@ohos.UiTest';
import router from '@ohos.router';
import { accessibility, config } from '@kit.AccessibilityKit';
import { waitAndClickComponent, waitForComponent } from './WaitTest.test';
const driver = Driver.create();
const CAPACITY: accessibility.Capability[] = ['retrieve', 'gesture'];
const BUNDLE_NAME = 'com.example.myaccessibilityapp/AccessibilityExtAbility';
export default function MetaViewport() {

  describe('MetaViewport', () => {
    beforeAll(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'testability/pages/MetaViewport',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get MetaViewport state success " + JSON.stringify(pages));
        if (!("MetaViewport" == pages.name)) {
          console.info("get MetaViewport state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          console.info("push MetaViewport page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push MetaViewport page error: " + err);
      }
      await waitForComponent("MetaViewport");
      done()
    });
    beforeEach(async (done: Function) => {
      await config.enableAbility(BUNDLE_NAME, CAPACITY).then(() => {
        console.info(`enable success`);
        }).catch((err: object) => {
        console.error(`failed to enable, ${err}`);
      })
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
    it('metaViewport0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("metaViewport0100", 150290)
      Utils.registerEvent("metaViewport0100", true, 150300, done);
      waitAndClickComponent("MetaViewport",driver);
    })

    /*
    * @tc.number     : Acts_metaViewport_0200
    * @tc.name       : testMetaViewport002
    * @tc.desc       : test MetaViewport
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 2
    */
    it('metaViewport0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("metaViewport0200", 150290)
      Utils.registerEvent("metaViewport0200", true, 150310, done);
      waitAndClickComponent("MetaViewport",driver);

    })

    /*
    * @tc.number     : Acts_metaViewport_0300
    * @tc.name       : testMetaViewport003
    * @tc.desc       : test MetaViewport
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 2
    */
    it('metaViewport0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("metaViewport0300", 150290)
      Utils.registerEvent("metaViewport0300", true, 150320, done);
      waitAndClickComponent("MetaViewport",driver);
    })

    /*
    * @tc.number     : Acts_metaViewport_0400
    * @tc.name       : testMetaViewport004
    * @tc.desc       : test MetaViewport
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 2
    */
    it('metaViewport0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("metaViewport0400", 150290)
      Utils.registerEvent("metaViewport0400", true, 150330, done);
      waitAndClickComponent("MetaViewport",driver);
    })

    /*
    * @tc.number     : Acts_metaViewport_0500
    * @tc.name       : testMetaViewport005
    * @tc.desc       : test MetaViewport
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 2
    */
   it('metaViewport0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("metaViewport0500", 150290)
      Utils.registerEvent("metaViewport0500", true, 150340, done);
     waitAndClickComponent("MetaViewport",driver);
    })

    /*
    * @tc.number     : Acts_metaViewport_0600
    * @tc.name       : testMetaViewport006
    *
    * @tc.desc       : test MetaViewport
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 2
    */
    it('metaViewport0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("metaViewport0600", 150290)
      Utils.registerEvent("metaViewport0600", true, 150350, done);
      waitAndClickComponent("MetaViewport",driver);
    })

    /*
    * @tc.number     : Acts_metaViewport_0700
    * @tc.name       : testMetaViewport007
    * @tc.desc       : test MetaViewport
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 2
    */
    it('metaViewport0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("metaViewport0700", 150290)
      Utils.registerEvent("metaViewport0700", true, 150360, done);
      waitAndClickComponent("MetaViewport",driver);
    })

    /*
    * @tc.number     : Acts_metaViewport_0800
    * @tc.name       : testMetaViewport008
    * @tc.desc       : test MetaViewport
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 2
    */
    it('metaViewport0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("metaViewport0800", 150290)
      Utils.registerEvent("metaViewport0800", true, 150370, done);
      waitAndClickComponent("MetaViewport",driver);
    })

    /*
    * @tc.number     : Acts_metaViewport_0900
    * @tc.name       : testMetaViewport009
    * @tc.desc       : test MetaViewport
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 2
    */
    it('metaViewport0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("metaViewport0900", 150290)
      Utils.registerEvent("metaViewport0900", true, 150380, done);
      waitAndClickComponent("MetaViewport",driver);
    })

    /*
    * @tc.number     : Acts_metaViewport_1000
    * @tc.name       : testMetaViewport010
    * @tc.desc       : test MetaViewport
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 2
    */
    it('metaViewport1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("metaViewport1000", 150290)
      Utils.registerEvent("metaViewport1000", true, 150390, done);
      waitAndClickComponent("MetaViewport",driver);
    })
  })
}

