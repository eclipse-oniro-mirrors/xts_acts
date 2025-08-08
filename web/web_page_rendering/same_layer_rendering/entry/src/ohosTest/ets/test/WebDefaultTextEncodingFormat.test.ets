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

export default function webDefaultTextEncodingFormat() {

  describe('webDefaultTextEncodingFormat', () => {
    beforeAll(async (done: Function) => {
      await Utils.sleep(2000);
      console.info("web beforeAll start");
      done();
    })

    /*
    * @tc.number     : SUB_WEB_WEBDEAULTTEXTENCODINGFORMAT_0100
    * @tc.name       : testWebDefaultTextEncodingFormat001
    * @tc.desc       : test WebDefaultTextEncodingFormat
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('defaultTextEncodingFormat0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("defaultTextEncodingFormat0100", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("defaultTextEncodingFormat0100", "UTF-8", 7701, done);
      let driver = Driver.create();
      await driver.delayMs(1000);
      let StartModel = await driver.findComponent(ON.id("WebDefaultTextEncodingFormat"));
      await StartModel.click();
      await driver.delayMs(1000);
    })

    /*
    * @tc.number     : SUB_WEB_WEBDEAULTTEXTENCODINGFORMAT_0200
    * @tc.name       : testWebDefaultTextEncodingFormat002
    * @tc.desc       : test WebDefaultTextEncodingFormat
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('defaultTextEncodingFormat0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("defaultTextEncodingFormat0200", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("defaultTextEncodingFormat0200", "gb18030", 7702, done);
      let driver = Driver.create();
      await driver.delayMs(1000);
      let StartModel = await driver.findComponent(ON.id("WebDefaultTextEncodingFormat"));
      await StartModel.click();
      await driver.delayMs(1000);
    })

    /*
    * @tc.number     : SUB_WEB_WEBDEAULTTEXTENCODINGFORMAT_0300
    * @tc.name       : testWebDefaultTextEncodingFormat003
    * @tc.desc       : test WebDefaultTextEncodingFormat
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('defaultTextEncodingFormat0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("defaultTextEncodingFormat0300", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("defaultTextEncodingFormat0300", "GBK", 7703, done);
      let driver = Driver.create();
      await driver.delayMs(1000);
      let StartModel = await driver.findComponent(ON.id("WebDefaultTextEncodingFormat"));
      await StartModel.click();
      await driver.delayMs(1000);
    })

    /*
    * @tc.number     : SUB_WEB_WEBDEAULTTEXTENCODINGFORMAT_0300
    * @tc.name       : testWebDefaultTextEncodingFormat003
    * @tc.desc       : test WebDefaultTextEncodingFormat
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('defaultTextEncodingFormat0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("defaultTextEncodingFormat0400", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("defaultTextEncodingFormat0400", "Big5", 7704, done);
      let driver = Driver.create();
      await driver.delayMs(1000);
      let StartModel = await driver.findComponent(ON.id("WebDefaultTextEncodingFormat"));
      await StartModel.click();
      await driver.delayMs(1000);
    })

    /*
    * @tc.number     : SUB_WEB_WEBDEAULTTEXTENCODINGFORMAT_0400
    * @tc.name       : testWebDefaultTextEncodingFormat004
    * @tc.desc       : test WebDefaultTextEncodingFormat
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('defaultTextEncodingFormat0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("defaultTextEncodingFormat0500", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("defaultTextEncodingFormat0500", "windows-1252", 7705, done);
      let driver = Driver.create();
      await driver.delayMs(1000);
      let StartModel = await driver.findComponent(ON.id("WebDefaultTextEncodingFormat"));
      await StartModel.click();
      await driver.delayMs(1000);
    })

    /*
    * @tc.number     : SUB_WEB_WEBDEAULTTEXTENCODINGFORMAT_0500
    * @tc.name       : testWebDefaultTextEncodingFormat005
    * @tc.desc       : test WebDefaultTextEncodingFormat
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('defaultTextEncodingFormat0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("defaultTextEncodingFormat0600", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("defaultTextEncodingFormat0200", "macintosh", 7706, done);
      let driver = Driver.create();
      await driver.delayMs(1000);
      let StartModel = await driver.findComponent(ON.id("WebDefaultTextEncodingFormat"));
      await StartModel.click();
      await driver.delayMs(1000);
    })

    /*
    * @tc.number     : SUB_WEB_WEBDEAULTTEXTENCODINGFORMAT_0700
    * @tc.name       : testWebDefaultTextEncodingFormat007
    * @tc.desc       : test WebDefaultTextEncodingFormat
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('defaultTextEncodingFormat0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("defaultTextEncodingFormat0700", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("defaultTextEncodingFormat0700", "EUC-KR", 7707, done);
      let driver = Driver.create();
      await driver.delayMs(1000);
      let StartModel = await driver.findComponent(ON.id("WebDefaultTextEncodingFormat"));
      await StartModel.click();
      await driver.delayMs(1000);
    })

    /*
    * @tc.number     : SUB_WEB_WEBDEAULTTEXTENCODINGFORMAT_0800
    * @tc.name       : testWebDefaultTextEncodingFormat008
    * @tc.desc       : test WebDefaultTextEncodingFormat
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('defaultTextEncodingFormat0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("defaultTextEncodingFormat0800", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("defaultTextEncodingFormat0800", "ISO-2022-JP", 7708, done);
      let driver = Driver.create();
      await driver.delayMs(1000);
      let StartModel = await driver.findComponent(ON.id("WebDefaultTextEncodingFormat"));
      await StartModel.click();
      await driver.delayMs(1000);
    })

    /*
    * @tc.number     : SUB_WEB_WEBDEAULTTEXTENCODINGFORMAT_0900
    * @tc.name       : testWebDefaultTextEncodingFormat009
    * @tc.desc       : test WebDefaultTextEncodingFormat
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('defaultTextEncodingFormat0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("defaultTextEncodingFormat0900", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("defaultTextEncodingFormat0900", "EUC-JP", 7709, done);
      let driver = Driver.create();
      await driver.delayMs(1000);
      let StartModel = await driver.findComponent(ON.id("WebDefaultTextEncodingFormat"));
      await StartModel.click();
      await driver.delayMs(1000);
    })

    /*
    * @tc.number     : SUB_WEB_WEBDEAULTTEXTENCODINGFORMAT_1000
    * @tc.name       : testWebDefaultTextEncodingFormat010
    * @tc.desc       : test WebDefaultTextEncodingFormat
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('defaultTextEncodingFormat1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("defaultTextEncodingFormat1000", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("defaultTextEncodingFormat1000", "Shift_JIS", 7710, done);
      let driver = Driver.create();
      await driver.delayMs(1000);
      let StartModel = await driver.findComponent(ON.id("WebDefaultTextEncodingFormat"));
      await StartModel.click();
      await driver.delayMs(1000);
    })

    /*
    * @tc.number     : SUB_WEB_WEBDEAULTTEXTENCODINGFORMAT_1100
    * @tc.name       : testWebDefaultTextEncodingFormat011
    * @tc.desc       : test WebDefaultTextEncodingFormat
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('defaultTextEncodingFormat1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("defaultTextEncodingFormat1100", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("defaultTextEncodingFormat1100", "UTF-8", 7711, done);
      let driver = Driver.create();
      await driver.delayMs(1000);
      let StartModel = await driver.findComponent(ON.id("WebDefaultTextEncodingFormat"));
      await StartModel.click();
      await driver.delayMs(1000);
    })

    /*
    * @tc.number     : SUB_WEB_WEBDEAULTTEXTENCODINGFORMAT_1200
    * @tc.name       : testWebDefaultTextEncodingFormat012
    * @tc.desc       : test WebDefaultTextEncodingFormat
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('defaultTextEncodingFormat1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("defaultTextEncodingFormat1200", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("defaultTextEncodingFormat1200", "UTF-8", 7712, done);
      let driver = Driver.create();
      await driver.delayMs(1000);
      let StartModel = await driver.findComponent(ON.id("WebDefaultTextEncodingFormat"));
      await StartModel.click();
      await driver.delayMs(1000);
    })

    /*
    * @tc.number     : SUB_WEB_WEBDEAULTTEXTENCODINGFORMAT_1300
    * @tc.name       : testWebDefaultTextEncodingFormat013
    * @tc.desc       : test WebDefaultTextEncodingFormat
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('defaultTextEncodingFormat1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("defaultTextEncodingFormat1300", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("defaultTextEncodingFormat1300", "UTF-8", 7713, done);
      let driver = Driver.create();
      await driver.delayMs(1000);
      let StartModel = await driver.findComponent(ON.id("WebDefaultTextEncodingFormat"));
      await StartModel.click();
      await driver.delayMs(1000);
    })

    /*
    * @tc.number     : SUB_WEB_WEBDEAULTTEXTENCODINGFORMAT_1400
    * @tc.name       : testWebDefaultTextEncodingFormat014
    * @tc.desc       : test WebDefaultTextEncodingFormat
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('defaultTextEncodingFormat1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("defaultTextEncodingFormat1400", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("defaultTextEncodingFormat1400", "UTF-8", 7714, done);
      let driver = Driver.create();
      await driver.delayMs(1000);
      let StartModel = await driver.findComponent(ON.id("WebDefaultTextEncodingFormat"));
      await StartModel.click();
      await driver.delayMs(1000);
    })

    /*
    * @tc.number     : SUB_WEB_WEBDEAULTTEXTENCODINGFORMAT_1500
    * @tc.name       : testWebDefaultTextEncodingFormat015
    * @tc.desc       : test WebDefaultTextEncodingFormat
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('defaultTextEncodingFormat1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("defaultTextEncodingFormat1500", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("defaultTextEncodingFormat1500", "UTF-8", 7715, done);
      let driver = Driver.create();
      await driver.delayMs(1000);
      let StartModel = await driver.findComponent(ON.id("WebDefaultTextEncodingFormat"));
      await StartModel.click();
      await driver.delayMs(1000);
    })

    /*
    * @tc.number     : SUB_WEB_WEBDEAULTTEXTENCODINGFORMAT_1600
    * @tc.name       : testWebDefaultTextEncodingFormat016
    * @tc.desc       : test WebDefaultTextEncodingFormat
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('defaultTextEncodingFormat1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("defaultTextEncodingFormat1600", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("defaultTextEncodingFormat1600", "UTF-8", 7716, done);
      let driver = Driver.create();
      await driver.delayMs(1000);
      let StartModel = await driver.findComponent(ON.id("WebDefaultTextEncodingFormat"));
      await StartModel.click();
      await driver.delayMs(1000);
    })

    /*
    * @tc.number     : SUB_WEB_WEBDEAULTTEXTENCODINGFORMAT_1700
    * @tc.name       : testWebDefaultTextEncodingFormat017
    * @tc.desc       : test WebDefaultTextEncodingFormat
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('defaultTextEncodingFormat1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("defaultTextEncodingFormat1700", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("defaultTextEncodingFormat1700", "UTF-8", 7717, done);
      let driver = Driver.create();
      await driver.delayMs(1000);
      let StartModel = await driver.findComponent(ON.id("WebDefaultTextEncodingFormat"));
      await StartModel.click();
      await driver.delayMs(1000);
    })

    /*
    * @tc.number     : SUB_WEB_WEBDEAULTTEXTENCODINGFORMAT_1800
    * @tc.name       : testWebDefaultTextEncodingFormat018
    * @tc.desc       : test WebDefaultTextEncodingFormat
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('defaultTextEncodingFormat1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("defaultTextEncodingFormat1800", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("defaultTextEncodingFormat1800", "UTF-8", 7718, done);
      let driver = Driver.create();
      await driver.delayMs(1000);
      let StartModel = await driver.findComponent(ON.id("WebDefaultTextEncodingFormat"));
      await StartModel.click();
      await driver.delayMs(1000);
    })
  })
}
