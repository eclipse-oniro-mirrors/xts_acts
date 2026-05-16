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
    /**
     * @tc.name   systemAppTest_0100
     * @tc.number systemAppTest_0100
     * @tc.desc   systemAppTest
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
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
    /**
     * @tc.name   systemAppTest_0200
     * @tc.number systemAppTest_0200
     * @tc.desc   systemAppTest
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
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
    /**
     * @tc.name   systemAppTest_0300
     * @tc.number systemAppTest_0300
     * @tc.desc   systemAppTest
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
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
    /**
     * @tc.name   systemAppTest_0400
     * @tc.number systemAppTest_0400
     * @tc.desc   systemAppTest
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
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
    /**
     * @tc.name   systemAppTest_0500
     * @tc.number systemAppTest_0500
     * @tc.desc   systemAppTest
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
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
    /**
     * @tc.name   systemAppTest_0600
     * @tc.number systemAppTest_0600
     * @tc.desc   systemAppTest
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('systemAppTest_0600', Level.LEVEL0, async (done: Function) => {
      console.info('systemAppTest_0600 START');
      let a = 100;
      app.setImageCacheCount(a);
      console.info('systemAppTest_0600 END');
      done();
    });

    /**
     * @tc.name   systemAppTest_0601
     * @tc.number SUB_ARKUI_SYSTEMAPP_SETIMAGECACHECOUNT_0100
     * @tc.desc   systemAppTest
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('systemAppTest_0601', Level.LEVEL0, async (done: Function) => {
      console.info('systemAppTest_0601 START');
      let a = app.setImageCacheCount(undefined);
      app.setImageCacheCount(undefined);
      console.info('systemAppTest_0601 info:' + app.setImageCacheCount(undefined));
      expect(a == null).assertTrue();
      console.info('systemAppTest_0601 END');
      done();
    });

    /**
     * @tc.name   systemAppTest_0602
     * @tc.number SUB_ARKUI_SYSTEMAPP_SETIMAGECACHECOUNT_0200
     * @tc.desc   systemAppTest
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('systemAppTest_0602', Level.LEVEL0, async (done: Function) => {
      console.info('systemAppTest_0602 START');
      let a = app.setImageCacheCount(null);
      app.setImageCacheCount(null);
      console.info('systemAppTest_0602 info:' + app.setImageCacheCount(null));
      expect(a == null).assertTrue();
      console.info('systemAppTest_0602 END');
      done();
    });

    /**
     * @tc.name   systemAppTest_0603
     * @tc.number SUB_ARKUI_SYSTEMAPP_SETIMAGECACHECOUNT_0300
     * @tc.desc   systemAppTest
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('systemAppTest_0603', Level.LEVEL0, async (done: Function) => {
      console.info('systemAppTest_0603 START');
      let a = app.setImageCacheCount(0);
      app.setImageCacheCount(0);
      console.info('systemAppTest_0603 info:' + app.setImageCacheCount(0));
      expect(a == null).assertTrue();
      console.info('systemAppTest_0603 END');
      done();
    });

    /**
     * @tc.name   systemAppTest_0604
     * @tc.number SUB_ARKUI_SYSTEMAPP_SETIMAGECACHECOUNT_0400
     * @tc.desc   systemAppTest
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('systemAppTest_0604', Level.LEVEL0, async (done: Function) => {
      console.info('systemAppTest_0604 START');
      let a = app.setImageCacheCount(-1);
      app.setImageCacheCount(-1);
      console.info('systemAppTest_0604 info:' + app.setImageCacheCount(-1));
      expect(a == null).assertTrue();
      console.info('systemAppTest_0604 END');
      done();
    });

    /**
     * @tc.name   systemAppTest_0605
     * @tc.number SUB_ARKUI_SYSTEMAPP_SETIMAGECACHECOUNT_0500
     * @tc.desc   systemAppTest
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('systemAppTest_0605', Level.LEVEL0, async (done: Function) => {
      console.info('systemAppTest_0605 START');
      let a = app.setImageCacheCount(101);
      app.setImageCacheCount(101);
      console.info('systemAppTest_0605 info:' + app.setImageCacheCount(101));
      expect(a == null).assertTrue();
      console.info('systemAppTest_0605 END');
      done();
    });

    /**
     * @tc.name   systemAppTest_0700
     * @tc.number systemAppTest_0700
     * @tc.desc   systemAppTest
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('systemAppTest_0700', Level.LEVEL0, async (done: Function) => {
      console.info('systemAppTest_0700 START');
      let a = 104857600;
      app.setImageRawDataCacheSize(a);
      console.info('systemAppTest_0700 END');
      done();
    });

    /**
     * @tc.name   systemAppTest_0701
     * @tc.number SUB_ARKUI_SYSTEMAPP_SETIMAGERAWDATACACHESIZE_0100
     * @tc.desc   systemAppTest
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('systemAppTest_0701', Level.LEVEL0, async (done: Function) => {
      console.info('systemAppTest_0701 START');
      let a = app.setImageRawDataCacheSize(undefined);
      app.setImageRawDataCacheSize(undefined);
      console.info('systemAppTest_0701 info:' + app.setImageRawDataCacheSize(undefined));
      expect(a == null).assertTrue();
      console.info('systemAppTest_0701 END');
      done();
    });

    /**
     * @tc.name   systemAppTest_0702
     * @tc.number SUB_ARKUI_SYSTEMAPP_SETIMAGERAWDATACACHESIZE_0200
     * @tc.desc   systemAppTest
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('systemAppTest_0702', Level.LEVEL0, async (done: Function) => {
      console.info('systemAppTest_0702 START');
      let a = app.setImageRawDataCacheSize(null);
      app.setImageRawDataCacheSize(null);
      console.info('systemAppTest_0702 info:' + app.setImageRawDataCacheSize(null));
      expect(a == null).assertTrue();
      console.info('systemAppTest_0702 END');
      done();
    });

    /**
     * @tc.name   systemAppTest_0703
     * @tc.number SUB_ARKUI_SYSTEMAPP_SETIMAGERAWDATACACHESIZE_0300
     * @tc.desc   systemAppTest
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('systemAppTest_0703', Level.LEVEL0, async (done: Function) => {
      console.info('systemAppTest_0703 START');
      let a = app.setImageRawDataCacheSize(0);
      app.setImageRawDataCacheSize(0);
      console.info('systemAppTest_0703 info:' + app.setImageRawDataCacheSize(0));
      expect(a == null).assertTrue();
      console.info('systemAppTest_0703 END');
      done();
    });

    /**
     * @tc.name   systemAppTest_0704
     * @tc.number SUB_ARKUI_SYSTEMAPP_SETIMAGERAWDATACACHESIZE_0400
     * @tc.desc   systemAppTest
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('systemAppTest_0704', Level.LEVEL0, async (done: Function) => {
      console.info('systemAppTest_0704 START');
      let a = app.setImageRawDataCacheSize(-1);
      app.setImageRawDataCacheSize(-1);
      console.info('systemAppTest_0704 info:' + app.setImageRawDataCacheSize(-1));
      expect(a == null).assertTrue();
      console.info('systemAppTest_0704 END');
      done();
    });

    /**
     * @tc.name   systemAppTest_0705
     * @tc.number SUB_ARKUI_SYSTEMAPP_SETIMAGERAWDATACACHESIZE_0500
     * @tc.desc   systemAppTest
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('systemAppTest_0705', Level.LEVEL0, async (done: Function) => {
      console.info('systemAppTest_0705 START');
      let a = app.setImageRawDataCacheSize(104857601);
      app.setImageRawDataCacheSize(104857601);
      console.info('systemAppTest_0705 info:' + app.setImageRawDataCacheSize(104857601));
      expect(a == null).assertTrue();
      console.info('systemAppTest_0705 END');
      done();
    });

    /**
     * @tc.name   systemAppTest_0800
     * @tc.number systemAppTest_0800
     * @tc.desc   systemAppTest
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('systemAppTest_0800', Level.LEVEL0, async (done: Function) => {
      console.info('systemAppTest_0800 START');
      let a = 1048;
      app.setImageFileCacheSize(a);
      console.info('systemAppTest_0800 END');
      done();
    });

    /**
     * @tc.name   systemAppTest_0801
     * @tc.number SUB_ARKUI_SYSTEMAPP_SETIMAGEFILECACHESIZE_0100
     * @tc.desc   systemAppTest
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('systemAppTest_0801', Level.LEVEL0, async (done: Function) => {
      console.info('systemAppTest_0801 START');
      let a = app.setImageFileCacheSize(undefined);
      app.setImageFileCacheSize(undefined);
      console.info('systemAppTest_0801 info:' + app.setImageFileCacheSize(undefined));
      expect(a == null).assertTrue();
      console.info('systemAppTest_0801 END');
      done();
    });

    /**
     * @tc.name   systemAppTest_0802
     * @tc.number SUB_ARKUI_SYSTEMAPP_SETIMAGEFILECACHESIZE_0200
     * @tc.desc   systemAppTest
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('systemAppTest_0802', Level.LEVEL0, async (done: Function) => {
      console.info('systemAppTest_0802 START');
      let a = app.setImageFileCacheSize(null);
      app.setImageFileCacheSize(null);
      console.info('systemAppTest_0802 info:' + app.setImageFileCacheSize(null));
      expect(a == null).assertTrue();
      console.info('systemAppTest_0802 END');
      done();
    });

    /**
     * @tc.name   systemAppTest_0803
     * @tc.number SUB_ARKUI_SYSTEMAPP_SETIMAGEFILECACHESIZE_0300
     * @tc.desc   systemAppTest
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('systemAppTest_0803', Level.LEVEL0, async (done: Function) => {
      console.info('systemAppTest_0803 START');
      let a = app.setImageFileCacheSize(0);
      app.setImageFileCacheSize(0);
      console.info('systemAppTest_0803 info:' + app.setImageFileCacheSize(0));
      expect(a == null).assertTrue();
      console.info('systemAppTest_0803 END');
      done();
    });

    /**
     * @tc.name   systemAppTest_0804
     * @tc.number SUB_ARKUI_SYSTEMAPP_SETIMAGEFILECACHESIZE_0400
     * @tc.desc   systemAppTest
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('systemAppTest_0804', Level.LEVEL0, async (done: Function) => {
      console.info('systemAppTest_0804 START');
      let a = app.setImageFileCacheSize(-1);
      app.setImageFileCacheSize(-1);
      console.info('systemAppTest_0804 info:' + app.setImageFileCacheSize(-1));
      expect(a == null).assertTrue();
      console.info('systemAppTest_0804 END');
      done();
    });

    /**
     * @tc.name   systemAppTest_0805
     * @tc.number SUB_ARKUI_SYSTEMAPP_SETIMAGEFILECACHESIZE_0500
     * @tc.desc   systemAppTest
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('systemAppTest_0805', Level.LEVEL0, async (done: Function) => {
      console.info('systemAppTest_0805 START');
      let a = app.setImageFileCacheSize(209715200);
      app.setImageFileCacheSize(209715200);
      console.info('systemAppTest_0805 info:' + app.setImageFileCacheSize(209715200));
      expect(a == null).assertTrue();
      console.info('systemAppTest_0805 END');
      done();
    });

    /**
     * @tc.name   systemAppTest_0806
     * @tc.number SUB_ARKUI_SYSTEMAPP_SETIMAGEFILECACHESIZE_0600
     * @tc.desc   systemAppTest
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('systemAppTest_0806', Level.LEVEL0, async (done: Function) => {
      console.info('systemAppTest_0806 START');
      let a = app.setImageFileCacheSize(209715201);
      app.setImageFileCacheSize(209715201);
      console.info('systemAppTest_0806 info:' + app.setImageFileCacheSize(209715201));
      expect(a == null).assertTrue();
      console.info('systemAppTest_0806 END');
      done();
    });

    /**
     * @tc.name   systemAppTest_0900
     * @tc.number systemAppTest_0900
     * @tc.desc   systemAppTest
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('systemAppTest_0900', Level.LEVEL0, async (done: Function) => {
      console.info('systemAppTest_0900 START');
      app.terminate();
      console.info('systemAppTest_0900 END');
      done();
    });
  })
}