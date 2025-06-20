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
import { describe, it, Level, expect } from "@ohos/hypium"
import app, { ScreenOnVisibleOptions } from '@system.app';
export default function systemAppJsunit() {
  describe('appInfoTest_four_9', () => {
/*
     * @tc.number     : systemAppTest_0100
     * @tc.name       : systemAppTest_0100
     * @tc.desc       : systemAppTest
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : LEVEL0
     */
    it('systemAppTest_0100', Level.LEVEL0, async (done: Function) => {
      console.info('systemAppTest_0100 START');
      let a: ESObject = app.getInfo();
      console.log('systemAppTest_0100 END' + JSON.stringify(a));
      if (a != null) {
        expect(a.appID == "com.open.harmony.acetestfour").assertTrue();
        console.info('systemAppTest_0100 END');
      } else {
        expect(a == null).assertTrue();
      }
      done();
    });
    /*
     * @tc.number     : systemAppTest_0200
     * @tc.name       : systemAppTest_0200
     * @tc.desc       : systemAppTest
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : LEVEL0
     */
    it('systemAppTest_0200', Level.LEVEL0, async (done: Function) => {
      console.info('systemAppTest_0200 START');
      let a: ESObject = app.getInfo();
      console.log('systemAppTest_0200 END' + JSON.stringify(a));
      if (a != null) {
        expect(a.appName == "$string:entry_MainAbility").assertTrue();
      } else {
        expect(a == null).assertTrue();
      }
      console.info('systemAppTest_0200 END');
      done();
    });
    /*
     * @tc.number     : systemAppTest_0300
     * @tc.name       : systemAppTest_0300
     * @tc.desc       : systemAppTest
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : LEVEL0
     */
    it('systemAppTest_0300', Level.LEVEL0, async (done: Function) => {
      console.info('systemAppTest_0300 START');
      let a: ESObject = app.getInfo();
      console.log('systemAppTest_0300 END' + JSON.stringify(a));
      if (a != null) {
        expect(a.versionName == "1.0.0").assertTrue();
      } else {
        expect(a == null).assertTrue();
      }
      console.info('systemAppTest_0300 END');
      done();
    });
    /*
     * @tc.number     : systemAppTest_0400
     * @tc.name       : systemAppTest_0400
     * @tc.desc       : systemAppTest
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : LEVEL0
     */
    it('systemAppTest_0400', Level.LEVEL0, async (done: Function) => {
      console.info('systemAppTest_0400 START');
      try {
        app.requestFullWindow({
          duration: 2000
        });
      } catch (err) {
        console.log("systemAppTest_0400 error: " + err);
      }
      console.info('systemAppTest_0400 END');
      done();
    });
    /*
     * @tc.number     : systemAppTest_0500
     * @tc.name       : systemAppTest_0500
     * @tc.desc       : systemAppTest
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : LEVEL0
     */
    it('systemAppTest_0500', Level.LEVEL0, async (done: Function) => {
      console.info('systemAppTest_0500 START');
      try {
        let visible: ScreenOnVisibleOptions = {
          visible: true
        };
        app.screenOnVisible(visible);
      } catch (err) {
        console.log("systemAppTest_0500 error: " + err);
      }
      console.info('systemAppTest_0500 END');
      done();
    });
  /*
     * @tc.number     : systemAppTest_0600
     * @tc.name       : systemAppTest_0600
     * @tc.desc       : systemAppTest
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : LEVEL0
     */
    it('systemAppTest_0600', Level.LEVEL0, async (done: Function) => {
      console.info('systemAppTest_0600 START');
      let a = 100;
      app.setImageCacheCount(a);
      console.info('systemAppTest_0600 END');
      done();
    });
/*
     * @tc.number     : systemAppTest_0700
     * @tc.name       : systemAppTest_0700
     * @tc.desc       : systemAppTest
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : LEVEL0
     */
    it('systemAppTest_0700', Level.LEVEL0, async (done: Function) => {
      console.info('systemAppTest_0700 START');
      let a = 104857600;
      app.setImageRawDataCacheSize(a);
      console.info('systemAppTest_0700 END');
      done();
    });
/*
     * @tc.number     : systemAppTest_0800
     * @tc.name       : systemAppTest_0800
     * @tc.desc       : systemAppTest
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : LEVEL0
     */
    it('systemAppTest_0800', Level.LEVEL0, async (done: Function) => {
      console.info('systemAppTest_0800 START');
      let a = 1048;
      app.setImageFileCacheSize(a);
      console.info('systemAppTest_0800 END');
      done();
    });
/*
     * @tc.number     : systemAppTest_0900
     * @tc.name       : systemAppTest_0900
     * @tc.desc       : systemAppTest
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : LEVEL0
     */
    it('systemAppTest_0900', Level.LEVEL0, async (done: Function) => {
      console.info('systemAppTest_0900 START');
      app.terminate();
      console.info('systemAppTest_0900 END');
      done();
    });
  })
}