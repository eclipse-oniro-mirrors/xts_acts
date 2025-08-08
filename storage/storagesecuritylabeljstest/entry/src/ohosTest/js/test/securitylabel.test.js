/*
 * Copyright (C) 2021-2022 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import {
    describe, it, expect, securityLabel, nextFileName, fileio, fileIO
} from './Common';
import { Level } from '@ohos/hypium';

export default function security_label() {
describe('security_label', function () {

  /**
   * @tc.number SUB_DF_SECURITYLABEL_SET_SECURITY_LABEL_SYNC_0000
   * @tc.name securitylabel_test_set_security_label_sync_000
   * @tc.desc Test the setSecurityLabelSync() interface, and the getSecurityLabelSync() interface to get the data label.
   * @tc.size MEDIUM
   * @tc.type Function
   * @tc.level Level 0
   * @tc.require
   */
  it('securitylabel_test_set_security_label_sync_000', Level.LEVEL0, async function () {

    try {
      let dataLevel = ["s0","s1","s2","s3","s4"];
      for (let i = 0; i < dataLevel.length; i++) {
        let fpath = await nextFileName("test" + dataLevel[i] + '.txt');
        fileIO.openSync(fpath, fileIO.OpenMode.CREATE | fileIO.OpenMode.READ_WRITE);
        securityLabel.setSecurityLabelSync(fpath, dataLevel[i]);
        let level = securityLabel.getSecurityLabelSync(fpath);
        expect(level == dataLevel[i]).assertTrue();
        fileio.unlinkSync(fpath);
      }
    } catch (e) {
      console.log('securitylabel_test_set_security_label_sync_000 has failed for ' + e.message + ', code: ' + e.code);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.number SUB_DF_SECURITYLABEL_SET_SECURITY_LABEL_SYNC_0100
   * @tc.name securitylabel_test_set_security_label_sync_001
   * @tc.desc Test the setSecurityLabelSync() interface, when the dataLevel is wrong.
   * @tc.size MEDIUM
   * @tc.type Function
   * @tc.level Level 0
   * @tc.require
   */
  it('securitylabel_test_set_security_label_sync_001', Level.LEVEL0, async function () {
    let fpath = await nextFileName("test.txt");
    fileIO.openSync(fpath, fileIO.OpenMode.CREATE | fileIO.OpenMode.READ_WRITE);

    try {
      securityLabel.setSecurityLabelSync(fpath, "abc");
      expect(false).assertTrue();
    } catch (e) {
      fileio.unlinkSync(fpath);
      console.log('securitylabel_test_set_security_label_sync_001 has failed for ' + e.message + ', code: ' + e.code);
      expect(e.code == 13900020 && e.message == 'Invalid argument').assertTrue();
    }
  });

  /**
   * @tc.number SUB_DF_SECURITYLABEL_SET_SECURITY_LABEL_SYNC_0200
   * @tc.name securitylabel_test_set_security_label_sync_002
   * @tc.desc Test the setSecurityLabelSync() interface, when the path does not exist.
   * @tc.size MEDIUM
   * @tc.type Function
   * @tc.level Level 0
   * @tc.require
   */
  it('securitylabel_test_set_security_label_sync_002', Level.LEVEL0, async function () {

    try {
      securityLabel.setSecurityLabelSync("/data/aaa.txt", "s0");
      expect(false).assertTrue();
    } catch (e) {
      console.log('securitylabel_test_set_security_label_sync_002 has failed for ' + e.message + ', code: ' + e.code);
      expect(e.code == 13900002 && e.message == 'No such file or directory').assertTrue();
    }
  });

  /**
   * @tc.number SUB_DF_SECURITYLABEL_SET_SECURITY_LABEL_SYNC_0300
   * @tc.name securitylabel_test_set_security_label_sync_003
   * @tc.desc Test the setSecurityLabelSync() interface, when the dataLevel type is wrong.
   * @tc.size MEDIUM
   * @tc.type Function
   * @tc.level Level 0
   * @tc.require
   */
  it('securitylabel_test_set_security_label_sync_003', Level.LEVEL0, async function () {
    let fpath = await nextFileName("test.txt");
    fileIO.openSync(fpath, fileIO.OpenMode.CREATE | fileIO.OpenMode.READ_WRITE);

    try {
      securityLabel.setSecurityLabelSync(fpath, 1);
      expect(false).assertTrue();
    } catch (e) {
      fileio.unlinkSync(fpath);
      console.log('securitylabel_test_set_security_label_sync_003 has failed for ' + e.message + ', code: ' + e.code);
      expect(e.code == 13900020 && e.message == 'Invalid argument').assertTrue();
    }
  });

  /**
   * @tc.number SUB_DF_SECURITYLABEL_SET_SECURITY_LABEL_SYNC_0400
   * @tc.name securitylabel_test_set_security_label_sync_004
   * @tc.desc Test the setSecurityLabelSync() interface, when there is no datalevel parameter.
   * @tc.size MEDIUM
   * @tc.type Function
   * @tc.level Level 0
   * @tc.require
   */
  it('securitylabel_test_set_security_label_sync_004', Level.LEVEL0, async function () {
    let fpath = await nextFileName("test.txt");
    fileIO.openSync(fpath, fileIO.OpenMode.CREATE | fileIO.OpenMode.READ_WRITE);

    try {
      securityLabel.setSecurityLabelSync(fpath);
      expect(false).assertTrue();
    } catch (e) {
      fileio.unlinkSync(fpath);
      console.log('securitylabel_test_set_security_label_sync_004 has failed for ' + e.message + ', code: ' + e.code);
      expect(e.code == 13900020 && e.message == "Invalid argument").assertTrue();
    }
  });

    /**
   * @tc.number SUB_DF_SECURITYLABEL_SET_SECURITY_LABEL_SYNC_0500
   * @tc.name securitylabel_test_set_security_label_sync_005
   * @tc.desc Test the setSecurityLabelSync() interface, return false when the securitylabel is lower than before.
   * @tc.size MEDIUM
   * @tc.type Function
   * @tc.level Level 0
   * @tc.require
   */
    it('securitylabel_test_set_security_label_sync_005', Level.LEVEL0, async function () {
      let fpath = await nextFileName("test5.txt");
      fileIO.openSync(fpath, fileIO.OpenMode.CREATE | fileIO.OpenMode.READ_WRITE);

      try {
        securityLabel.setSecurityLabelSync(fpath, 's4');
        securityLabel.setSecurityLabelSync(fpath, 's3');
        expect(false).assertTrue();
      } catch (e) {
        fileio.unlinkSync(fpath);
        console.log('securitylabel_test_set_security_label_sync_005 has failed for ' + e.message + ', code: ' + e.code);
        expect(e.code == 13900020 && e.message == "Invalid argument").assertTrue();
      }
    });

  /**
   * @tc.number SUB_DF_SECURITYLABEL_SET_SECURITY_LABEL_0000
   * @tc.name securitylabel_test_set_security_label_async_000
   * @tc.desc Test that the setSecurityLabel() interface callback to set the data label.
   * Test the getSecurityLabel() interface callback to get the data label.
   * @tc.size MEDIUM
   * @tc.type Function
   * @tc.level Level 0
   * @tc.require
   */
  it('securitylabel_test_set_security_label_async_000', Level.LEVEL0, async function (done) {
    let fpath = await nextFileName('test.txt');
    fileIO.openSync(fpath, fileIO.OpenMode.CREATE | fileIO.OpenMode.READ_WRITE);

    try {
      securityLabel.setSecurityLabel(fpath, 's0', (err) => {
        if (err) {
          console.log('securitylabel_test_set_security_label_async_000 error package1: ' + JSON.stringify(err));
          expect(false).assertTrue();
        }
        securityLabel.getSecurityLabel(fpath, (err, dataLevel) => {
          if (err) {
            console.log('securitylabel_test_set_security_label_async_000 error package2: ' + JSON.stringify(err));
            expect(false).assertTrue();
          }
          expect(dataLevel == 's0').assertTrue();
          fileio.unlinkSync(fpath);
          done();
        })
      })
    } catch (e) {
      console.log('securitylabel_test_set_security_label_async_000 has failed for ' + e.message + ', code: ' + e.code);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.number SUB_DF_SECURITYLABEL_SET_SECURITY_LABEL_0100
   * @tc.name securitylabel_test_set_security_label_async_001
   * @tc.desc Test that the setSecurityLabel() interface callback to set the data label.
   * Test the getSecurityLabel() interface promises to get the data label.
   * @tc.size MEDIUM
   * @tc.type Function
   * @tc.level Level 0
   * @tc.require
   */
  it('securitylabel_test_set_security_label_async_001', Level.LEVEL0, async function (done) {
    let fpath = await nextFileName('test1.txt');
    fileIO.openSync(fpath, fileIO.OpenMode.CREATE | fileIO.OpenMode.READ_WRITE);

    try {
      securityLabel.setSecurityLabel(fpath, 's1', (err) => {
        if (err) {
          console.log('securitylabel_test_set_security_label_async_001 error package1: ' + JSON.stringify(err));
          expect(false).assertTrue();
        }
        securityLabel.getSecurityLabel(fpath, (err, dataLevel) => {
          if (err) {
            console.log('securitylabel_test_set_security_label_async_001 error package2: ' + JSON.stringify(err));
            expect(false).assertTrue();
          }
          expect(dataLevel == 's1').assertTrue();
          fileio.unlinkSync(fpath);
          done();
        });
      })
    } catch (e) {
      console.log('securitylabel_test_set_security_label_async_001 has failed for ' + e.message + ', code: ' + e.code);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.number SUB_DF_SECURITYLABEL_SET_SECURITY_LABEL_0200
   * @tc.name securitylabel_test_set_security_label_async_002
   * @tc.desc Test that the setSecurityLabel() interface promises to set the data label.
   * Test the getSecurityLabel() interface callback to get the data label.
   * @tc.size MEDIUM
   * @tc.type Function
   * @tc.level Level 0
   * @tc.require
   */
  it('securitylabel_test_set_security_label_async_002', Level.LEVEL0, async function (done) {
    let fpath = await nextFileName('test2.txt');
    fileIO.openSync(fpath, fileIO.OpenMode.CREATE | fileIO.OpenMode.READ_WRITE);

    try {
      await securityLabel.setSecurityLabel(fpath, 's2');
      securityLabel.getSecurityLabel(fpath, (err, dataLevel) => {
        if(err) {
          console.log('securitylabel_test_set_security_label_async_002 error package: ' + JSON.stringify(err));
          expect(false).assertTrue();
        }
        expect(dataLevel == 's2').assertTrue();
        fileio.unlinkSync(fpath);
        done();
      })
    } catch (e) {
      console.log('securitylabel_test_set_security_label_async_002 has failed for ' + e.message + ', code: ' + e.code);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.number SUB_DF_SECURITYLABEL_SET_SECURITY_LABEL_0300
   * @tc.name securitylabel_test_set_security_label_async_003
   * @tc.desc Test that the setSecurityLabel() interface promises to set the data label.
   * Test the getSecurityLabel() interface promises to get the data label.
   * @tc.size MEDIUM
   * @tc.type Function
   * @tc.level Level 0
   * @tc.require
   */
  it('securitylabel_test_set_security_label_async_003', Level.LEVEL0, async function (done) {
    let fpath = await nextFileName('test3.txt');
    fileIO.openSync(fpath, fileIO.OpenMode.CREATE | fileIO.OpenMode.READ_WRITE);

    try {
      await securityLabel.setSecurityLabel(fpath, 's3');
      let dataLevel = await securityLabel.getSecurityLabel(fpath);
      expect(dataLevel == 's3').assertTrue();
      fileio.unlinkSync(fpath);
      done();
    } catch (e) {
      console.log('securitylabel_test_set_security_label_async_003 has failed for ' + e.message + ', code: ' + e.code);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.number SUB_DF_SECURITYLABEL_SET_SECURITY_LABEL_0400
   * @tc.name securitylabel_test_set_security_label_async_004
   * @tc.desc Test that the setSecurityLabel() interface promises to set the data label.
   * Test the getSecurityLabel() interface promises to get the data label.
   * @tc.size MEDIUM
   * @tc.type Function
   * @tc.level Level 0
   * @tc.require
   */
  it('securitylabel_test_set_security_label_async_004', Level.LEVEL0, async function (done) {
    let fpath = await nextFileName('test4.txt');
    fileIO.openSync(fpath, fileIO.OpenMode.CREATE | fileIO.OpenMode.READ_WRITE);

    try {
      await securityLabel.setSecurityLabel(fpath, 's4');
      let dataLevel = await securityLabel.getSecurityLabel(fpath);
      expect(dataLevel == 's4').assertTrue();
      fileio.unlinkSync(fpath);
      done();
    } catch (e) {
      console.log('securitylabel_test_set_security_label_async_004 has failed for ' + e.message + ', code: ' + e.code);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.number SUB_DF_SECURITYLABEL_SET_SECURITY_LABEL_0500
   * @tc.name securitylabel_test_set_security_label_async_005
   * @tc.desc Test setSecurityLabel() interfaces, when the path type is wrong.
   * @tc.size MEDIUM
   * @tc.type Function
   * @tc.level Level 0
   * @tc.require
   */
  it('securitylabel_test_set_security_label_async_005', Level.LEVEL0, async function (done) {

    try {
      await securityLabel.setSecurityLabel(123, 's0');
      expect(false).assertTrue();
    } catch (e) {
      console.log('securitylabel_test_set_security_label_async_005 has failed for ' + e.message + ', code: ' + e.code);
      expect(e.code == 13900020 && e.message == "Invalid argument").assertTrue();
      done();
    }
  });

  /**
   * @tc.number SUB_DF_SECURITYLABEL_SET_SECURITY_LABEL_0600
   * @tc.name securitylabel_test_set_security_label_async_006
   * @tc.desc Test setSecurityLabel() interfaces, return false when the path is invalid.
   * @tc.size MEDIUM
   * @tc.type Function
   * @tc.level Level 0
   * @tc.require
   */
  it('securitylabel_test_set_security_label_async_006', Level.LEVEL0, async function (done) {

    try {
      await securityLabel.setSecurityLabel('/data/test.txt', 's0');
      expect(false).assertTrue();
    } catch (e) {
      console.log('securitylabel_test_set_security_label_async_006 has failed for ' + e.message + ', code: ' + e.code);
      expect(e.code == 13900002 && e.message == 'No such file or directory').assertTrue();
      done();
    }
  });

  /**
   * @tc.number SUB_DF_SECURITYLABEL_SET_SECURITY_LABEL_0700
   * @tc.name securitylabel_test_set_security_label_async_007
   * @tc.desc Test setSecurityLabel() interfaces. Throw exception when path is empty.
   * @tc.size MEDIUM
   * @tc.type Function
   * @tc.level Level 0
   * @tc.require
   */
  it('securitylabel_test_set_security_label_async_007', Level.LEVEL0, async function (done) {

    try {
      await securityLabel.setSecurityLabel('s0');
      expect(false).assertTrue();
    } catch (e) {
      console.log('securitylabel_test_set_security_label_async_007 has failed for ' + e.message + ', code: ' + e.code);
      expect(e.code == 13900020 && e.message == "Invalid argument").assertTrue();
      done();
    }
  });

  /**
   * @tc.number SUB_DF_SECURITYLABEL_SET_SECURITY_LABEL_0800
   * @tc.name securitylabel_test_set_security_label_async_008
   * @tc.desc Test setSecurityLabel() interfaces, when the dataLevel type is wrong.
   * @tc.size MEDIUM
   * @tc.type Function
   * @tc.level Level 0
   * @tc.require
   */
  it('securitylabel_test_set_security_label_async_008', Level.LEVEL0, async function (done) {
    let fpath = await nextFileName('test5.txt');
    fileIO.openSync(fpath, fileIO.OpenMode.CREATE | fileIO.OpenMode.READ_WRITE);

    try {
      await securityLabel.setSecurityLabel(fpath, 1);
      expect(false).assertTrue();
    } catch (e) {
      fileio.unlinkSync(fpath);
      console.log('securitylabel_test_set_security_label_async_008 has failed for ' + e.message + ', code: ' + e.code);
      expect(e.code == 13900020 && e.message == "Invalid argument").assertTrue();
      done();
    }
  });

  /**
   * @tc.number SUB_DF_SECURITYLABEL_SET_SECURITY_LABEL_0900
   * @tc.name securitylabel_test_set_security_label_async_009
   * @tc.desc Test setSecurityLabel() interfaces, return false when the dataLevel is invalid.
   * @tc.size MEDIUM
   * @tc.type Function
   * @tc.level Level 0
   * @tc.require
   */
  it('securitylabel_test_set_security_label_async_009', Level.LEVEL0, async function (done) {
    let fpath = await nextFileName('test6.txt');
    fileIO.openSync(fpath, fileIO.OpenMode.CREATE | fileIO.OpenMode.READ_WRITE);

    try {
      await securityLabel.setSecurityLabel(fpath, 'ss');
      expect(false).assertTrue();
    } catch (e) {
      fileio.unlinkSync(fpath);
      console.log('securitylabel_test_set_security_label_async_009 has failed for ' + e.message + ', code: ' + e.code);
      expect(e.code == 13900020 && e.message == "Invalid argument").assertTrue();
      done();
    }
  });

  /**
   * @tc.number SUB_DF_SECURITYLABEL_SET_SECURITY_LABEL_1000
   * @tc.name securitylabel_test_set_security_label_async_010
   * @tc.desc Test setSecurityLabel() interfaces. Throw exception when dataLevel is empty.
   * @tc.size MEDIUM
   * @tc.type Function
   * @tc.level Level 0
   * @tc.require
   */
  it('securitylabel_test_set_security_label_async_010', Level.LEVEL0, async function (done) {
    let fpath = await nextFileName('test7.txt');
    fileIO.openSync(fpath, fileIO.OpenMode.CREATE | fileIO.OpenMode.READ_WRITE);

    try {
      await securityLabel.setSecurityLabel(fpath);
      expect(false).assertTrue();
    } catch (e) {
      fileio.unlinkSync(fpath);
      console.log('securitylabel_test_set_security_label_async_010 has failed for ' + e.message + ', code: ' + e.code);
      expect(e.code == 13900020 && e.message == "Invalid argument").assertTrue();
      done();
    }
  });

  /**
   * @tc.number SUB_DF_SECURITYLABEL_SET_SECURITY_LABEL_1100
   * @tc.name securitylabel_test_set_security_label_async_011
   * @tc.desc Test setSecurityLabel() interfaces. Throws an exception when passing multiple parameters.
   * @tc.size MEDIUM
   * @tc.type Function
   * @tc.level Level 0
   * @tc.require
   */
  it('securitylabel_test_set_security_label_async_011', Level.LEVEL0, async function (done) {
    let fpath = await nextFileName('test8.txt');
    fileIO.openSync(fpath, fileIO.OpenMode.CREATE | fileIO.OpenMode.READ_WRITE);

    try {
      securityLabel.setSecurityLabel(fpath, 's0', '', () => {
        expect(false).assertTrue();
      })
    } catch (e) {
      fileio.unlinkSync(fpath);
      console.log('securitylabel_test_set_security_label_async_011 has failed for ' + e.message + ', code: ' + e.code);
      expect(e.code == 13900020 && e.message == "Invalid argument").assertTrue();
      done();
    }
  });

  /**
   * @tc.number SUB_DF_SECURITYLABEL_SET_SECURITY_LABEL_1200
   * @tc.name securitylabel_test_set_security_label_async_012
   * @tc.desc Test setSecurityLabel() interfaces, return false when the path is invalid.
   * @tc.size MEDIUM
   * @tc.type Function
   * @tc.level Level 0
   * @tc.require
   */
  it('securitylabel_test_set_security_label_async_012', Level.LEVEL0, async function (done) {

    try {
      securityLabel.setSecurityLabel('/data/test.txt', 's0', (err) => {
        if (err) {
          console.log(
            'securitylabel_test_set_security_label_async_012 error package: {'
            + err.message + ', code: ' + err.code + '}');
          expect(err.code == 13900002 && err.message == 'No such file or directory').assertTrue();
          done();
        }
      });
    } catch (e) {
      console.log('securitylabel_test_set_security_label_async_006 has failed for ' + e.message + ', code: ' + e.code);
      expect(false).assertTrue();
    }
  });

    /**
   * @tc.number SUB_DF_SECURITYLABEL_SET_SECURITY_LABEL_1300
   * @tc.name securitylabel_test_set_security_label_async_013
   * @tc.desc Test setSecurityLabel() interfaces, return false when the securitylabel is lower than before.
   * @tc.size MEDIUM
   * @tc.type Function
   * @tc.level Level 0
   * @tc.require
   */
    it('securitylabel_test_set_security_label_async_013', Level.LEVEL0, async function (done) {
      let fpath = await nextFileName('test13.txt');
      fileIO.openSync(fpath, fileIO.OpenMode.CREATE | fileIO.OpenMode.READ_WRITE);

      try {
        securityLabel.setSecurityLabelSync(fpath, 's4');
        securityLabel.setSecurityLabel(fpath, 's3', (err) => {
          if (err) {
            expect(err.code == 13900020 && err.message == 'Invalid argument').assertTrue();
            done();
          }
        });
      } catch (e) {
        console.log('securitylabel_test_set_security_label_async_006 has failed for ' + e.message + ', code: ' + e.code);
        expect(false).assertTrue();
      }
    });

  /**
   * @tc.number SUB_DF_SECURITYLABEL_GET_SECURITY_LABEL_SYNC_0000
   * @tc.name securitylabel_test_get_security_label_sync_000
   * @tc.desc Test getSecurityLabelSync() interfaces, return empty when path is empty string.
   * @tc.size MEDIUM
   * @tc.type Function
   * @tc.level Level 0
   * @tc.require
   */
  it('securitylabel_test_get_security_label_sync_000', Level.LEVEL0, function () {

    try {
      let dataLevel = securityLabel.getSecurityLabelSync('');
      expect(dataLevel == 's3').assertTrue();
    } catch (e) {
      console.log('securitylabel_test_get_security_label_sync_000 has failed for ' + e.message + ', code: ' + e.code);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.number SUB_DF_SECURITYLABEL_GET_SECURITY_LABEL_SYNC_0100
   * @tc.name securitylabel_test_get_security_label_sync_001
   * @tc.desc Test getSecurityLabelSync() interfaces, return empty when the path is invalid.
   * @tc.size MEDIUM
   * @tc.type Function
   * @tc.level Level 0
   * @tc.require
   */
  it('securitylabel_test_get_security_label_sync_001', Level.LEVEL0, function () {

    try {
      let dataLevel = securityLabel.getSecurityLabelSync('/data/test.txt');
      expect(dataLevel == 's3').assertTrue();
    } catch (e) {
      console.log('securitylabel_test_get_security_label_sync_001 has failed for ' + e.message + ', code: ' + e.code);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.number SUB_DF_SECURITYLABEL_GET_SECURITY_LABEL_SYNC_0200
   * @tc.name securitylabel_test_get_security_label_sync_002
   * @tc.desc Test getSecurityLabelSync() interfaces, when there are no parameters.
   * @tc.size MEDIUM
   * @tc.type Function
   * @tc.level Level 0
   * @tc.require
   */
  it('securitylabel_test_get_security_label_sync_002', Level.LEVEL0, function () {

    try {
      securityLabel.getSecurityLabelSync();
      expect(false).assertTrue();
    } catch (e) {
      console.log('securitylabel_test_get_security_label_sync_002 has failed for ' + e.message + ', code: ' + e.code);
      expect(e.code == 13900020 && e.message == "Invalid argument").assertTrue();
    }
  });

  /**
   * @tc.number SUB_DF_SECURITYLABEL_GET_SECURITY_LABEL_SYNC_0300
   * @tc.name securitylabel_test_get_security_label_sync_003
   * @tc.desc Test getSecurityLabelSync() interfaces, when the path type is wrong.
   * @tc.size MEDIUM
   * @tc.type Function
   * @tc.level Level 0
   * @tc.require
   */
  it('securitylabel_test_get_security_label_sync_003', Level.LEVEL0, function () {

    try {
      securityLabel.getSecurityLabelSync(123);
      expect(false).assertTrue();
    } catch (e) {
      console.log('securitylabel_test_get_security_label_sync_003 has failed for ' + e.message + ', code: ' + e.code);
      expect(e.code == 13900020 && e.message == "Invalid argument").assertTrue();
    }
  });

  /**
   * @tc.number SUB_DF_SECURITYLABEL_GET_SECURITY_LABEL_0000
   * @tc.name securitylabel_test_get_security_label_async_000
   * @tc.desc Test getSecurityLabel() interfaces, when the path type is wrong.
   * @tc.size MEDIUM
   * @tc.type Function
   * @tc.level Level 0
   * @tc.require
   */
  it('securitylabel_test_get_security_label_async_000', Level.LEVEL0, async function (done) {

    try {
      await securityLabel.getSecurityLabel(123);
      expect(false).assertTrue();
    } catch (e) {
      console.log('securitylabel_test_get_security_label_async_000 has failed for ' + e.message + ', code: ' + e.code);
      expect(e.code == 13900020 && e.message == "Invalid argument").assertTrue();
      done();
    }
  });

  /**
   * @tc.number SUB_DF_SECURITYLABEL_GET_SECURITY_LABEL_0100
   * @tc.name securitylabel_test_get_security_label_async_001
   * @tc.desc Test getSecurityLabel() interfaces, return empty when the path is invalid.
   * @tc.size MEDIUM
   * @tc.type Function
   * @tc.level Level 0
   * @tc.require
   */
  it('securitylabel_test_get_security_label_async_001', Level.LEVEL0, async function (done) {

    try {
      let dataLevel = await securityLabel.getSecurityLabel('/data/test.txt');
      expect(dataLevel == 's3').assertTrue();
      done();
    } catch (e) {
      console.log('securitylabel_test_get_security_label_async_001 has failed for ' + e.message + ', code: ' + e.code);
      expect(false).assertTrue();
    }
  });


  /**
   * @tc.number SUB_DF_SECURITYLABEL_GET_SECURITY_LABEL_0200
   * @tc.name securitylabel_test_get_security_label_async_002
   * @tc.desc Test getSecurityLabel() interfaces. Throw exception when path is empty.
   * @tc.size MEDIUM
   * @tc.type Function
   * @tc.level Level 0
   * @tc.require
   */
  it('securitylabel_test_get_security_label_async_002', Level.LEVEL0, async function (done) {

    try {
      await securityLabel.getSecurityLabel();
      expect(false).assertTrue();
    } catch (e) {
      console.log('securitylabel_test_get_security_label_async_002 has failed for ' + e.message + ', code: ' + e.code);
      expect(e.code == 13900020 && e.message == "Invalid argument").assertTrue();
      done();
    }
  });

  /**
   * @tc.number SUB_DF_SECURITYLABEL_GET_SECURITY_LABEL_0300
   * @tc.name securitylabel_test_get_security_label_async_003
   * @tc.desc Test getSecurityLabel() interfaces. Throws an exception when passing multiple parameters.
   * @tc.size MEDIUM
   * @tc.type Function
   * @tc.level Level 0
   * @tc.require
   */
  it('securitylabel_test_get_security_label_async_003', Level.LEVEL0, async function (done) {
    let fpath = await nextFileName('test9.txt');
    fileIO.openSync(fpath, fileIO.OpenMode.CREATE | fileIO.OpenMode.READ_WRITE);

    try {
      securityLabel.getSecurityLabel(fpath, '', () => {
        expect(false).assertTrue();
      });
    } catch (e) {
      fileio.unlinkSync(fpath);
      console.log('securitylabel_test_get_security_label_async_003 has failed for ' + e.message + ', code: ' + e.code);
      expect(e.code == 13900020 && e.message == "Invalid argument").assertTrue();
      done();
    }
  });
});
}
