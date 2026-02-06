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
import { Driver, ON } from '@kit.TestKit';
import router from '@ohos.router';
import { waitForComponent } from './WaitTest.test';
const driver = Driver.create();
export default function webDefaultTextEncodingFormat() {

  describe('webDefaultTextEncodingFormat', () => {
    beforeAll(async (done: Function) => {
      console.info("web beforeAll start");
      await waitForComponent("WebDefaultTextEncodingFormat");
      done();
    })

    /**
     * @tc.name   defaultTextEncodingFormat0100
     * @tc.number SUB_WEB_WEBDEAULTTEXTENCODINGFORMAT_0100
     * @tc.desc   test WebDefaultTextEncodingFormat
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('defaultTextEncodingFormat0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("defaultTextEncodingFormat0100", 153320)
      Utils.registerEvent("defaultTextEncodingFormat0100", "UTF-8", 153330, done);
      sendEventByKey('WebDefaultTextEncodingFormat', 10, '');
    })



    /**
     * @tc.name   defaultTextEncodingFormat0200
     * @tc.number SUB_WEB_WEBDEAULTTEXTENCODINGFORMAT_0200
     * @tc.desc   test WebDefaultTextEncodingFormat
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('defaultTextEncodingFormat0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("defaultTextEncodingFormat0200", 153320)
      Utils.registerEvent("defaultTextEncodingFormat0200", "gb18030", 153340, done);
      sendEventByKey('WebDefaultTextEncodingFormat', 10, '');
    })

    /**
     * @tc.name   defaultTextEncodingFormat0300
     * @tc.number SUB_WEB_WEBDEAULTTEXTENCODINGFORMAT_0300
     * @tc.desc   test WebDefaultTextEncodingFormat
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('defaultTextEncodingFormat0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("defaultTextEncodingFormat0300", 153320)
      Utils.registerEvent("defaultTextEncodingFormat0300", "GBK", 153350, done);
      let component = await driver.findComponent(ON.id("WebDefaultTextEncodingFormat"));
      await component.click();
    })

    /**
     * @tc.name   defaultTextEncodingFormat0400
     * @tc.number SUB_WEB_WEBDEAULTTEXTENCODINGFORMAT_0300
     * @tc.desc   test WebDefaultTextEncodingFormat
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('defaultTextEncodingFormat0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("defaultTextEncodingFormat0400", 153320)
      Utils.registerEvent("defaultTextEncodingFormat0400", "Big5", 153360, done);
      sendEventByKey('WebDefaultTextEncodingFormat', 10, '');
    })

    /**
     * @tc.name   defaultTextEncodingFormat0500
     * @tc.number SUB_WEB_WEBDEAULTTEXTENCODINGFORMAT_0400
     * @tc.desc   test WebDefaultTextEncodingFormat
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('defaultTextEncodingFormat0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("defaultTextEncodingFormat0500", 153320)
      Utils.registerEvent("defaultTextEncodingFormat0500", "windows-1252", 153370, done);
      sendEventByKey('WebDefaultTextEncodingFormat', 10, '');
    })

    /**
     * @tc.name   defaultTextEncodingFormat0600
     * @tc.number SUB_WEB_WEBDEAULTTEXTENCODINGFORMAT_0500
     * @tc.desc   test WebDefaultTextEncodingFormat
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('defaultTextEncodingFormat0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("defaultTextEncodingFormat0600", 153320)
      Utils.registerEvent("defaultTextEncodingFormat0200", "macintosh", 153380, done);
      sendEventByKey('WebDefaultTextEncodingFormat', 10, '');
    })

    /**
     * @tc.name   defaultTextEncodingFormat0700
     * @tc.number SUB_WEB_WEBDEAULTTEXTENCODINGFORMAT_0700
     * @tc.desc   test WebDefaultTextEncodingFormat
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('defaultTextEncodingFormat0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("defaultTextEncodingFormat0700", 153320)
      Utils.registerEvent("defaultTextEncodingFormat0700", "EUC-KR", 153390, done);
      sendEventByKey('WebDefaultTextEncodingFormat', 10, '');
    })

    /**
     * @tc.name   defaultTextEncodingFormat0800
     * @tc.number SUB_WEB_WEBDEAULTTEXTENCODINGFORMAT_0800
     * @tc.desc   test WebDefaultTextEncodingFormat
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('defaultTextEncodingFormat0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("defaultTextEncodingFormat0800", 153320)
      Utils.registerEvent("defaultTextEncodingFormat0800", "ISO-2022-JP", 153400, done);
      sendEventByKey('WebDefaultTextEncodingFormat', 10, '');
    })

    /**
     * @tc.name   defaultTextEncodingFormat0900
     * @tc.number SUB_WEB_WEBDEAULTTEXTENCODINGFORMAT_0900
     * @tc.desc   test WebDefaultTextEncodingFormat
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('defaultTextEncodingFormat0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("defaultTextEncodingFormat0900", 153320)
      Utils.registerEvent("defaultTextEncodingFormat0900", "EUC-JP", 153410, done);
      sendEventByKey('WebDefaultTextEncodingFormat', 10, '');
    })

    /**
     * @tc.name   defaultTextEncodingFormat1000
     * @tc.number SUB_WEB_WEBDEAULTTEXTENCODINGFORMAT_1000
     * @tc.desc   test WebDefaultTextEncodingFormat
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('defaultTextEncodingFormat1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("defaultTextEncodingFormat1000", 153320)
      Utils.registerEvent("defaultTextEncodingFormat1000", "Shift_JIS", 153420, done);
      sendEventByKey('WebDefaultTextEncodingFormat', 10, '');
    })

    /**
     * @tc.name   defaultTextEncodingFormat1100
     * @tc.number SUB_WEB_WEBDEAULTTEXTENCODINGFORMAT_1100
     * @tc.desc   test WebDefaultTextEncodingFormat
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('defaultTextEncodingFormat1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("defaultTextEncodingFormat1100", 153320)
      Utils.registerEvent("defaultTextEncodingFormat1100", "UTF-8", 153430, done);
      sendEventByKey('WebDefaultTextEncodingFormat', 10, '');
    })

    /**
     * @tc.name   defaultTextEncodingFormat1200
     * @tc.number SUB_WEB_WEBDEAULTTEXTENCODINGFORMAT_1200
     * @tc.desc   test WebDefaultTextEncodingFormat
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('defaultTextEncodingFormat1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("defaultTextEncodingFormat1200", 153320)
      Utils.registerEvent("defaultTextEncodingFormat1200", "UTF-8", 153440, done);
      sendEventByKey('WebDefaultTextEncodingFormat', 10, '');
    })

    /**
     * @tc.name   defaultTextEncodingFormat1300
     * @tc.number SUB_WEB_WEBDEAULTTEXTENCODINGFORMAT_1300
     * @tc.desc   test WebDefaultTextEncodingFormat
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('defaultTextEncodingFormat1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("defaultTextEncodingFormat1300", 153320)
      Utils.registerEvent("defaultTextEncodingFormat1300", "UTF-8", 153450, done);
      sendEventByKey('WebDefaultTextEncodingFormat', 10, '');
    })

    /**
     * @tc.name   defaultTextEncodingFormat1400
     * @tc.number SUB_WEB_WEBDEAULTTEXTENCODINGFORMAT_1400
     * @tc.desc   test WebDefaultTextEncodingFormat
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('defaultTextEncodingFormat1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("defaultTextEncodingFormat1400", 153320)
      Utils.registerEvent("defaultTextEncodingFormat1400", "UTF-8", 153460, done);
      sendEventByKey('WebDefaultTextEncodingFormat', 10, '');
    })

    /**
     * @tc.name   defaultTextEncodingFormat1500
     * @tc.number SUB_WEB_WEBDEAULTTEXTENCODINGFORMAT_1500
     * @tc.desc   test WebDefaultTextEncodingFormat
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('defaultTextEncodingFormat1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("defaultTextEncodingFormat1500", 153320)
      Utils.registerEvent("defaultTextEncodingFormat1500", "UTF-8", 153470, done);
      sendEventByKey('WebDefaultTextEncodingFormat', 10, '');
    })

    /**
     * @tc.name   defaultTextEncodingFormat1600
     * @tc.number SUB_WEB_WEBDEAULTTEXTENCODINGFORMAT_1600
     * @tc.desc   test WebDefaultTextEncodingFormat
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('defaultTextEncodingFormat1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("defaultTextEncodingFormat1600", 153320)
      Utils.registerEvent("defaultTextEncodingFormat1600", "UTF-8", 153480, done);
      sendEventByKey('WebDefaultTextEncodingFormat', 10, '');
    })

    /**
     * @tc.name   defaultTextEncodingFormat1700
     * @tc.number SUB_WEB_WEBDEAULTTEXTENCODINGFORMAT_1700
     * @tc.desc   test WebDefaultTextEncodingFormat
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('defaultTextEncodingFormat1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("defaultTextEncodingFormat1700", 153320)
      Utils.registerEvent("defaultTextEncodingFormat1700", "UTF-8", 153490, done);
      sendEventByKey('WebDefaultTextEncodingFormat', 10, '');
    })

    /**
     * @tc.name   defaultTextEncodingFormat1800
     * @tc.number SUB_WEB_WEBDEAULTTEXTENCODINGFORMAT_1800
     * @tc.desc   test WebDefaultTextEncodingFormat
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('defaultTextEncodingFormat1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("defaultTextEncodingFormat1800", 153320)
      Utils.registerEvent("defaultTextEncodingFormat1800", "UTF-8", 153500, done);
      sendEventByKey('WebDefaultTextEncodingFormat', 10, '');
    })
  })
}

