/*
 * Copyright (C) 2021 Huawei Device Co., Ltd.
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

import fileio from '@ohos.fileio';
import file from '@system.file';
import document from '@ohos.document';
import {
  describe,
  it,
  expect,
  Level
}
from '@ohos/hypium'
import {
  FILE_CONTENT,
  prepareFile,
  fileName,
  randomString,
  cacheFileName,
  prepareEmptyFile,
  nextFileName,
  sleep
}
from './Common'

export default function fileTest() {
describe('fileTest', function () {

  /**
   * @tc.name   File_Delete_001
   * @tc.number SUB_STORAGE_File_Delete_0100
   * @tc.desc   Function of API, delete file.The test file is exist.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('File_Delete_001', Level.LEVEL0, async function (done) {
    let fpath = await fileName('File_Delete_001');
    expect(prepareFile(fpath, 'hello')).assertTrue();
    file.delete({
      uri: 'internal://cache/../files/File_Delete_001',
      success: function () {
        console.info('File_Delete_001 call delete success');
        done();
      },
      fail: function (data, code) {
        console.info('File_Delete_001 call delete fail, code: ' + code + ', data: ' + data);
        expect(null).assertFail();
        done();
      },
    });
  });

  /**
   * @tc.name   File_Delete_002
   * @tc.number SUB_STORAGE_File_Delete_0200
   * @tc.desc   Function of API, delete dir.The dir is empty.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('File_Delete_002', Level.LEVEL0, async function (done) {
    file.mkdir({
      uri: 'internal://cache/File_Delete_002',
      success: function () {
        console.info('File_Delete_002 call mkdir success.');
        file.delete({
          uri: 'internal://cache/File_Delete_002',
          success: function () {
            console.info('File_Delete_002 call delete success.');
            done();
          },
          fail: function (data, code) {
            console.info('File_Delete_002 call delete fail, code: ' + code + ', data: ' + data);
            expect(null).assertFail();
          },
        });
      },
      fail: function (data, code) {
        console.info('File_Delete_002 call mkdir fail, code: ' + code + ', data: ' + data);
        expect(null).assertFail();
      },
    });
  });

  /**
   * @tc.name   File_Delete_003
   * @tc.number SUB_STORAGE_File_Delete_0300
   * @tc.desc   Function of API, error code: 202 The test file or dir are exist.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('File_Delete_003', Level.LEVEL0, async function (done) {
    file.delete({
      uri: 'internal://ohos/workspace/text.txt',
      success: function () {
        console.info('File_Delete_003 call delete success.');
        expect(null).assertFail();
      },
      fail: function (data, code) {
        console.info('File_Delete_003 call delete fail, code: ' + code + ', data: ' + data);
        expect(code == 202).assertTrue();
        done();
      },
    });

  });

  /**
   * @tc.name   File_Delete_004
   * @tc.number SUB_STORAGE_File_Delete_0400
   * @tc.desc   Function of API, error code: 300 The dir is exist with files.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('File_Delete_004', Level.LEVEL0, async function (done) {
    let dpath = await fileName('File_Delete_004');
    let fpath = dpath + '/File_Delete_004';
    fileio.mkdirSync(dpath);
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
    file.delete({
      uri: 'internal://app/File_Delete_004',
      success: function () {
        console.info('File_Delete_004 call delete success.');
        expect(null).assertFail();
      },
      fail: function (data, code) {
        console.info('File_Delete_004 call delete fail, code: ' + code + ', data: ' + data);
        expect(code == 300).assertTrue();
        done();
      },
    });
  });

  /**
   * @tc.name   File_Delete_005
   * @tc.number SUB_STORAGE_File_Delete_0500
   * @tc.desc   Function of API, error code: 301 The file and dir are not exist.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('File_Delete_005', Level.LEVEL0, async function (done) {
    file.delete({
      uri: 'internal://app/File_Delete_005',
      success: function () {
        console.info('File_Delete_005 call delete success.');
        expect(null).assertFail();
      },
      fail: function (data, code) {
        console.info('File_Delete_005 call delete fail, code: ' + code + ', data: ' + data);
        expect(code == 301).assertTrue();
        done();
      },
    });
  });

  /**
   * @tc.name   File_Delete_006
   * @tc.number SUB_STORAGE_File_Delete_0600
   * @tc.desc   uri address length more than 4096 The test file is exist.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('File_Delete_006', Level.LEVEL0, async function (done) {
    let firstPath = randomString(32);
    let dpath = await fileName(firstPath);
    let uri = 'internal://cache/' + firstPath;
    fileio.mkdirSync(dpath);
    for (let i = 0; i < 16; i++) {
      console.info('frequency' + i);
      let sonPath = randomString(251);
      uri = uri + '/f' + sonPath;
    }
    file.delete({
      uri: uri,
      success: function () {
        console.info('File_Delete_006 call delete success');
        expect(null).assertFail();
      },
      fail: function (data, code) {
        console.info('File_Delete_006 call delete fail, code: ' + code + ', data: ' + data);
        expect(code == 300).assertTrue();
        done();
      },
    });
  });

  /**
   * @tc.name   File_Delete_007
   * @tc.number SUB_STORAGE_File_Delete_0700
   * @tc.desc   Function of API, delete file from cache.The test file on cache.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('File_Delete_007', Level.LEVEL0, async function (done) {
    file.writeText({
      uri: 'internal://cache/File_Delete_007',
      text: 'test',
      success: function () {
        console.info('File_Delete_007 call writeText success');
        file.delete({
          uri: 'internal://cache/File_Delete_007',
          success: function () {
            console.info('File_Delete_007 call delete success');
            done();
          },
          fail: function (data, code) {
            console.info('File_Delete_007 call delete fail, code: ' + code + ', data: ' + data);
            expect(null).assertFail();
          },
        });
      },
      fail: function (data, code) {
        console.info('File_Delete_007 call writeText fail, code: ' + code + ', data: ' + data);
        expect(null).assertFail();
      },
    });
  });

  /**
   * @tc.name   File_Delete_008
   * @tc.number SUB_STORAGE_File_Delete_0800
   * @tc.desc   Function of API, delete file from Virtual path.The test file is exist.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('File_Delete_008', Level.LEVEL0, async function (done) {
    file.writeText({
      uri: 'internal://cache/../cache/File_Delete_008',
      text: 'Text that just for test.',
      success: function () {
        console.info('File_Delete_008 call writeText success');
        file.delete({
          uri: 'internal://cache/../cache/File_Delete_008',
          success: function () {
            console.info('File_Delete_008 call delete success');
            done();
          },
          fail: function (data, code) {
            console.info('File_Delete_008 call delete fail, code: ' + code + ', data: ' + data);
            expect(null).assertFail();
          },
          complete: function () {
            console.info('delete completed');
          }
        });
      },
      fail: function (data, code) {
        console.info('File_Delete_008 call writeText fail, code: ' + code + ', data: ' + data);
        expect(null).assertFail();
      },
    });
  });

  /**
   * @tc.name   File_writeText_001
   * @tc.number SUB_STORAGE_File_writeText_0100
   * @tc.desc   Function of API, write to file(app path).The test file is not exist.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('File_writeText_001', Level.LEVEL0, async function (done) {
    file.writeText({
      uri: 'internal://cache/File_writeText_001',
      text: 'sawyerwang.',
      success: function () {
        console.info('File_writeText_001 call writeText success');
        file.readText({
          uri: 'internal://cache/File_writeText_001',
          success: function (data) {
            console.info('File_writeText_001 call read success. Content: ' );
            file.delete({
              uri: 'internal://cache/File_writeText_001',
              success: function () {
                console.info('File_writeText_001 call delete success');
                done();
              },
              fail: function (data, code) {
                console.info('File_writeText_001 call delete fail, code: ' + code + ', data: ' + data);
                expect(null).assertFail();
              },
            });
          },
          fail: function (data, code) {
            console.info('File_writeText_001 call read fail , code: ' + code + ', data: ' + data);
            expect(null).assertFail();
          },
        });
      },
      fail: function (data, code) {
        console.info('File_writeText_001 call writeText fail , code: ' + code + ', data: ' + data);
        expect(null).assertFail();
      },
    });
  });

  /**
   * @tc.name   File_writeText_002
   * @tc.number SUB_STORAGE_File_writeText_0200
   * @tc.desc   Function of API, write to file.The test file is exist, it can be edited.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('File_writeText_002', Level.LEVEL0, async function (done) {
    file.writeText({
      uri: 'internal://cache/File_writeText_002',
      text: 'Text1.',
      success: function () {
        console.info('File_writeText_002 call writeText success.');
        file.writeText({
            uri: 'internal://cache/File_writeText_002',
            text: 'Text2.',
            append: true,
            success: function () {
              console.info('File_writeText_002 call writeText success.');
              file.readText({
                uri: 'internal://cache/File_writeText_002',
                success: function (data) {
                  console.info('File_writeText_002 call read success. Content: ' );
                  file.delete({
                    uri: 'internal://cache/File_writeText_002',
                    success: function () {
                      console.info('File_writeText_002 call delete success');
                      done();
                    },
                    fail: function (data, code) {
                      console.info('File_writeText_002 call delete fail, code: ' + code + ', data: ' + data);
                      expect(null).assertFail();
                    },
                  });
                },
                fail: function (data, code) {
                  console.info('File_writeText_002 call read fail, code: ' + code + ', data: ' + data);
                  expect(null).assertFail();
                },
              });
            },
            fail: function (data, code) {
              console.info('File_writeText_002 call writeText fail, code: ' + code + ', data: ' + data);
              expect(null).assertFail();
            },
          });
      },
      fail: function (data, code) {
        console.info('File_writeText_002 call writeText fail, code: ' + code + ', data: ' + data);
        expect(null).assertFail();
      },
    });
  });

  /**
   * @tc.name   File_writeText_003
   * @tc.number SUB_STORAGE_File_writeText_0300
   * @tc.desc   Different types of strings for text.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('File_writeText_003', Level.LEVEL0, async function (done) {
    let txt = 'hello 你好 ????? こんにちは ?????.'
    file.writeText({
      uri: 'internal://cache/File_writeText_003',
      text: txt,
      success: function () {
        console.info('File_writeText_003 call writeText success.');
        file.readText({
          uri: 'internal://cache/File_writeText_003',
          success: function (data) {
            console.info('File_writeText_003 call read success. Content: ' );
            file.delete({
              uri: 'internal://cache/File_writeText_003',
              success: function () {
                console.info('File_writeText_003 call delete success');
                done();
              },
              fail: function (data, code) {
                console.info('File_writeText_003 call delete fail, code: ' + code + ', data: ' + data);
                expect(null).assertFail();
              },
            });
          },
          fail: function (data, code) {
            console.info('File_writeText_003 call read fail, code: ' + code + ', data: ' + data);
            expect(null).assertFail();
          },
        });
      },
      fail: function (data, code) {
        console.info('File_writeText_003 call writeText fail, code: ' + code + ', data: ' + data);
        expect(null).assertFail();
      },
    });
  });

  /**
   * @tc.name   File_writeText_004
   * @tc.number SUB_STORAGE_File_writeText_0400
   * @tc.desc   Defferent encoding(UTF-8).
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('File_writeText_004', Level.LEVEL0, async function (done) {
    file.writeText({
      uri: 'internal://cache/File_writeText_004',
      text: 'hello',
      encoding: 'UTF-8',
      success: function () {
        console.info('File_writeText_004 call writeText success.');
        file.readText({
          uri: 'internal://cache/File_writeText_004',
          encoding: 'UTF-8',
          success: function (data) {
            console.info('File_writeText_004 call readText success. Content: ' );
            file.delete({
              uri: 'internal://cache/File_writeText_004',
              success: function () {
                console.info('File_writeText_004 delete success');
                done();
              },
              fail: function (data, code) {
                console.info('File_writeText_004 delete fail, code: ' + code + ', data: ' + data);
                expect(null).assertFail();
              },
            });
          },
          fail: function (data, code) {
            console.info('File_writeText_004 call readText fail, code: ' + code + ', data: ' + data);
            expect(null).assertFail();
          },
        });
      },
      fail: function (data, code) {
        console.info('File_writeText_004 call writeText fail, code: ' + code + ', data: ' + data);
        expect(null).assertFail();
      },
    });
  });

  /**
   * @tc.name   File_writeText_005
   * @tc.number SUB_STORAGE_File_writeText_0500
   * @tc.desc   Function of API, append mode.The test file is exist and it can be edited.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('File_writeText_005', Level.LEVEL0, async function (done) {
    file.writeText({
      uri: 'internal://cache/File_writeText_005',
      text: 'hello,world',
      success: function () {
        console.info('File_writeText_005 call writeText success.');
        file.writeText({
            uri: 'internal://cache/File_writeText_005',
            text: 'hello',
            append: true,
            success: function () {
              console.info('File_writeText_005 call writeText success.');
              file.readText({
                uri: 'internal://cache/File_writeText_005',
                success: function (data) {
                  console.info('File_writeText_005 call read success ' );
                  file.delete({
                    uri: 'internal://cache/File_writeText_005',
                    success: function () {
                      console.info('File_writeText_005 call delete success');
                      done();
                    },
                    fail: function (data, code) {
                      console.info('File_writeText_005 call delete fail, code: ' + code + ', data: ' + data);
                      expect(null).assertFail();
                    },
                  });
                },
                fail: function (data, code) {
                  console.info('File_writeText_005 call readText fail , code: ' + code + ', data: ' + data);
                  expect(null).assertFail();
                },
              });
            },
            fail: function (data, code) {
              console.info('File_writeText_005 call writeText fail, code: ' + code + ', data: ' + data);
              expect(null).assertFail();
            },
          });
      },
      fail: function (data, code) {
        console.info('File_writeText_005 call writeText fail, code: ' + code + ', data: ' + data);
        expect(null).assertFail();
      },
    });
  });

  /**
   * @tc.name   File_writeText_006
   * @tc.number SUB_STORAGE_File_writeText_0600
   * @tc.desc   Function of API, non-append mode.The test file is exist and it can be edited.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('File_writeText_006', Level.LEVEL0, async function (done) {
    file.writeText({
      uri: 'internal://cache/File_writeText_006',
      text: 'hello',
      success: function () {
        console.info('File_writeText_006 call writeText success.');
        file.readText({
          uri: 'internal://cache/File_writeText_006',
          success: function (data) {
            console.info('File_writeText_006 call read success ' );
            file.delete({
              uri: 'internal://cache/File_writeText_006',
              success: function () {
                console.info('File_writeText_006 delete success');
                done();
              },
              fail: function (data, code) {
                console.info('File_writeText_006 delete fail, code: ' + code + ', data: ' + data);
                expect(null).assertFail();
              },
            });
          },
          fail: function (data, code) {
            console.info('File_writeText_006 call readText fail, code: ' + code + ', data: ' + data);
            expect(null).assertFail();
          },
        });
      },
      fail: function (data, code) {
        console.info('File_writeText_006 call writeText fail, code: ' + code + ', data: ' + data);
        expect(null).assertFail();
      },
    });
  });

  /**
   * @tc.name   File_writeText_007
   * @tc.number SUB_STORAGE_File_writeText_0700
   * @tc.desc   Function of API, error code: 202 The test file and dir are exist.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('File_writeText_007', Level.LEVEL0, async function (done) {
    file.writeText({
      uri: '/data/accounts/account_0/appdata',
      text: 'hello',
      success: function () {
        console.info('File_writeText_007 call writeText success.');
        expect(null).assertFail();
      },
      fail: function (data, code) {
        console.info('File_writeText_007, code: ' + code + ', data: ' + data);
        expect(code == 202).assertTrue();
        done();
      },
    });
  });

  /**
   * @tc.name   File_writeText_008
   * @tc.number SUB_STORAGE_File_writeText_0800
   * @tc.desc   Function of API, error code: 300 The uri path is dir path.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('File_writeText_008', Level.LEVEL0, async function (done) {
    let dpath = await nextFileName('File_writeText_008d');
    fileio.mkdirSync(dpath);
    file.writeText({
      uri: 'internal://cache/File_writeText_008d/',
      text: 'hello',
      success: function () {
        console.info('File_writeText_008 call writeText success.');
        expect(null).assertFail();
      },
      fail: function (data, code) {
        console.info('File_writeText_008 , code: ' + code + ', data: ' + data);
        expect(code == 300).assertTrue();
        done();
      },
    });
  });

  /**
   * @tc.name   File_writeText_009
   * @tc.number SUB_STORAGE_File_writeText_0900
   * @tc.desc   Function of API, error code: 300.The file path is not exist.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('File_writeText_009', Level.LEVEL0, async function (done) {
    file.writeText({
      uri: 'internal://app/File_writeText_009d/File_writeText_009',
      text: 'test',
      success: function () {
        console.info('File_writeText_009 call writeText success.');
        expect(null).assertFail();
      },
      fail: function (data, code) {
        console.info('File_writeText_009 , code: ' + code + ', data: ' + data);
        expect(code == 300).assertTrue();
        done();
      },
    });
  });

  /**
   * @tc.name   File_writeText_010
   * @tc.number SUB_STORAGE_File_writeText_1000
   * @tc.desc   Function of API, write to file(cache path).The test file is not exist.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('File_writeText_010', Level.LEVEL0, async function (done) {
    file.writeText({
      uri: 'internal://cache/File_writeText_010',
      text: 'test',
      success: function () {
        console.info('File_writeText_010 mkdir success');
        file.delete({
          uri: 'internal://cache/File_writeText_010',
          success: function () {
            console.info('File_writeText_010 delete success');
            done();
          },
          fail: function (data, code) {
            console.info('File_writeText_010 delete fail, code: ' + code + ', data: ' + data);
            expect(null).assertFail();
          },
        });
      },
      fail: function (data, code) {
        console.info('File_writeText_010 writeText fail, code: ' + code + ', data: ' + data);
        expect(null).assertFail();
      },
    });
  });

  /**
   * @tc.name   File_writeText_011
   * @tc.number SUB_STORAGE_File_writeText_1100
   * @tc.desc   Function of API, Virtual path.The test file is exist.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('File_writeText_011', Level.LEVEL0, async function (done) {
    file.writeText({
      uri: 'internal://cache/../cache/File_writeText_011',
      text: 'sawyerwang',
      success: function () {
        console.info('File_writeText_011 writeText success ');
        file.readText({
          uri: 'internal://cache/../cache/File_writeText_011',
          success: function (data) {
            console.info('File_writeText_011 readText success ' );
            file.delete({
              uri: 'internal://cache/../cache/File_writeText_011',
              success: function () {
                console.info('File_writeText_011 delete success');
                done();
              },
              fail: function (data, code) {
                console.info('File_writeText_011 delete fail, code: ' + code + ', data: ' + data);
                expect(null).assertFail();
              },
            });
          },
          fail: function (data, code) {
            console.info('File_writeText_011 readText fail, code: ' + code + ', data: ' + data);
            expect(null).assertFail();
          },
        });
      },
      fail: function (data, code) {
        console.info('File_writeText_011 writeText fail, code: ' + code + ', data: ' + data);
        expect(null).assertFail();
      },
    });
  });

  /**
   * @tc.name   File_writeText_013
   * @tc.number SUB_STORAGE_File_writeText_1300
   * @tc.desc   Function of API, write file out of package, Virtual path, save the dir authority.The test file is exist.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('File_writeText_013', Level.LEVEL0, async function (done) {
    file.writeText({
      uri: 'internal://app/notdir/File_writeText_013',
      text: 'sawyerwang',
      success: function () {
        console.info('File_writeText_013 mkdir success');
        expect(null).assertFail();
      },
      fail: function (data, code) {
        expect(code == 300).assertTrue();
        console.info('File_writeText_013 , code: ' + code + ', data: ' + data);
        done();
      },
      complete: function () {
        console.info('writeText completed');
      }
    });
  });

  /**
   * @tc.name   File_writeArrayBuffer_001
   * @tc.number SUB_STORAGE_File_writeArrayBuffer_0100
   * @tc.desc   Write the buffer content to file.(cache path, append mode) The file path is not exist.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('File_writeArrayBuffer_001', Level.LEVEL0, async function (done) {
    let buf = new Uint8Array([48, 49, 50, 51, 65, 66, 67, 68, 32, 33]);
    file.writeArrayBuffer({
      uri: 'internal://cache/File_writeArrayBuffer_001',
      buffer: buf,
      append: true,
      success: function () {
        console.info('File_writeArrayBuffer_001 call writeArrayBuffer success.');
        file.readArrayBuffer({
          uri: 'internal://cache/File_writeArrayBuffer_001',
          success: function (data) {
            console.info('File_writeArrayBuffer_001 call readArrayBuffer success.' );
            file.delete({
              uri: 'internal://cache/File_writeArrayBuffer_001',
              success: function () {
                console.info('File_writeArrayBuffer_001 delete success');
                done();
              },
              fail: function (data, code) {
                console.info('File_writeArrayBuffer_001 delete fail, code: ' + code + ', data: ' + data);
                expect(null).assertFail();
              },
            });
          },
          fail: function (data, code) {
            console.info('File_writeArrayBuffer_001 readArrayBuffer fail, code: ' + code + ', data: ' + data);
            expect(null).assertFail();
          },
        });
      },
      fail: function (data, code) {
        console.info('File_writeArrayBuffer_001 writeArrayBuffer fail, code: ' + code + ', data: ' + data);
        expect(null).assertFail();
      },
    });
  });

  /**
   * @tc.name   File_writeArrayBuffer_002
   * @tc.number SUB_STORAGE_File_writeArrayBuffer_0200
   * @tc.desc   Write the buffer content to file.(cache path, non-append mode) The file path is not exist.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('File_writeArrayBuffer_002', Level.LEVEL0, async function (done) {
    let buf = new Uint8Array([48, 49, 50, 51, 65, 66, 67, 68, 32, 33]);
    file.writeArrayBuffer({
      uri: 'internal://cache/File_writeArrayBuffer_002',
      buffer: buf,
      success: function () {
        console.info('File_writeArrayBuffer_002 call writeArrayBuffer success.');
        file.readArrayBuffer({
          uri: 'internal://cache/File_writeArrayBuffer_002',
          success: function (data) {
            console.info('File_writeArrayBuffer_002 call readArrayBuffer success.' );
            file.delete({
              uri: 'internal://cache/File_writeArrayBuffer_002',
              success: function () {
                console.info('File_writeArrayBuffer_002 delete success');
                done();
              },
              fail: function (data, code) {
                console.info('File_writeArrayBuffer_002 delete fail, code: ' + code + ', data: ' + data);
                expect(null).assertFail();
              },
            });
          },
          fail: function (data, code) {
            console.info('File_writeArrayBuffer_002 readArrayBuffer fail, code: ' + code + ', data: ' + data);
            expect(null).assertFail();
          },
        });
      },
      fail: function (data, code) {
        console.info('File_writeArrayBuffer_002 writeArrayBuffer fail, code: ' + code + ', data: ' + data);
        expect(null).assertFail();
      },
    });
  });

  /**
   * @tc.name   File_writeArrayBuffer_003
   * @tc.number SUB_STORAGE_File_writeArrayBuffer_0300
   * @tc.desc   Write the buffer content to file.(cache path, append mode) The file path is not exist.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('File_writeArrayBuffer_003', Level.LEVEL0, async function (done) {
    let buf = new Uint8Array([48, 49, 50, 51, 65, 66, 67, 68, 32, 33, 48, 49, 50, 51, 65, 66, 67, 68, 32, 33]);
    file.writeArrayBuffer({
      uri: 'internal://cache/File_writeArrayBuffer_003',
      buffer: buf,
      success: function () {
        console.info('File_writeArrayBuffer_003 call writeText success.');
        file.writeArrayBuffer({
          uri: 'internal://cache/File_writeArrayBuffer_003',
          buffer: buf,
          append: true,
          success: function () {
            console.info('File_writeArrayBuffer_003 call writeArrayBuffer success.');
            file.readArrayBuffer({
              uri: 'internal://cache/File_writeArrayBuffer_003',
              success: function (data) {
                console.info('File_writeArrayBuffer_003 readArrayBuffer success:' );
                done();
              },
              fail: function (data, code) {
                console.info('File_writeArrayBuffer_003 readArrayBuffer fail, code: ' + code + ', data: ' + data);
                expect(null).assertFail();
              },
            });
          },
          fail: function (data, code) {
            console.info('File_writeArrayBuffer_003 writeArrayBuffer append fail, code: ' + code + ', data: ' + data);
            expect(null).assertFail();
          },
        });
      },
      fail: function (data, code) {
        console.info('File_writeArrayBuffer_003 writeArrayBuffer fail, code: ' + code + ', data: ' + data);
        expect(null).assertFail();
      },
    });
  });

  /**
   * @tc.name   File_writeArrayBuffer_004
   * @tc.number SUB_STORAGE_File_writeArrayBuffer_0400
   * @tc.desc   Write the buffer content to file.(cache path, non-append mode) The file path is exist.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('File_writeArrayBuffer_004', Level.LEVEL0, async function (done) {
    let buf = new Uint8Array([48, 49, 50, 51, 65, 66, 67, 68, 32, 33]);
    file.writeArrayBuffer({
      uri: 'internal://cache/File_writeArrayBuffer_004',
      buffer: buf,
      append: false,
      success: function () {
        console.info('File_writeArrayBuffer_004 success call writeText success.');
        file.writeArrayBuffer({
          uri: 'internal://cache/File_writeArrayBuffer_004',
          buffer: buf,
          append: false,
          success: function () {
            console.info('File_writeArrayBuffer_004 call writeArrayBuffer success.');
            file.readArrayBuffer({
              uri: 'internal://cache/File_writeArrayBuffer_004',
              success: function (data) {
                console.info('File_writeArrayBuffer_004: readArrayBuffer success ' );
                file.delete({
                  uri: 'internal://cache/File_writeArrayBuffer_004',
                  success: function () {
                    console.info('File_writeArrayBuffer_004 call delete success');
                    done();
                  },
                  fail: function (data, code) {
                    console.info('File_writeArrayBuffer_004 delete fail, code: ' + code + ', data: ' + data);
                    expect(null).assertFail();
                  },
                });
              },
              fail: function (data, code) {
                console.info('File_writeArrayBuffer_004 readArrayBuffer fail, code: ' + code + ', data: ' + data);
                expect(null).assertFail();
              },
            });
          },
          fail: function (data, code) {
            console.info('File_writeArrayBuffer_004 writeArrayBuffer fail, code: ' + code + ', data: ' + data);
            expect(null).assertFail();
          },
        });
      },
      fail: function (data, code) {
        console.info('File_writeArrayBuffer_004 writeText fail, code: ' + code + ', data: ' + data);
        expect(null).assertFail();
      },
    });
  });

  /**
   * @tc.name   File_writeArrayBuffer_005
   * @tc.number SUB_STORAGE_File_writeArrayBuffer_0500
   * @tc.desc   Function of API, set value for position.The file path is exist.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('File_writeArrayBuffer_005', Level.LEVEL0, async function (done) {
    let buf = new Uint8Array([48, 49, 50, 51, 65, 66, 67, 68, 32, 33, 44, 55, 66, 77]);
    file.writeArrayBuffer({
      uri: 'internal://cache/File_writeArrayBuffer_005',
      buffer: buf,
      success: function () {
        console.info('File_writeArrayBuffer_005 call writeText success.');
        file.writeArrayBuffer({
            uri: 'internal://cache/File_writeArrayBuffer_005',
            buffer: buf,
            position: 10,
            success: function () {
              console.info('File_writeArrayBuffer_005 call writeArrayBuffer success.');
              file.readArrayBuffer({
                uri: 'internal://cache/File_writeArrayBuffer_005',
                success: function (data) {
                  console.info('File_writeArrayBuffer_005 read success:' );
                  file.delete({
                    uri: 'internal://cache/File_writeArrayBuffer_005',
                    success: function () {
                      console.info('File_writeArrayBuffer_005 call delete success');
                      done();
                    },
                    fail: function (data, code) {
                      console.info('File_writeArrayBuffer_005 delete fail, code: ' + code + ', data: ' + data);
                      expect(null).assertFail();
                    },
                  });
                },
                fail: function (data, code) {
                  console.info('File_writeArrayBuffer_005 read fail, code: ' + code + ', data: ' + data);
                  expect(null).assertFail();
                },
              });
            },
            fail: function (data, code) {
              console.info('File_writeArrayBuffer_005 writeArrayBuffer fail, code: ' + code + ', data: ' + data);
              expect(null).assertFail();
            },
          });
      },
      fail: function (data, code) {
        console.info('File_writeArrayBuffer_005 writeText fail, code: ' + code + ', data: ' + data);
        expect(null).assertFail();
      },
    });
  });

  /**
   * @tc.name   File_writeArrayBuffer_006
   * @tc.number SUB_STORAGE_File_writeArrayBuffer_0600
   * @tc.desc   Function of API, not set value for position & append.The file path is exist.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('File_writeArrayBuffer_006', Level.LEVEL0, async function (done) {
    let buf = new Uint8Array([48, 49, 50, 51, 65, 66, 67, 68, 32, 33]);
    file.writeArrayBuffer({
      uri: 'internal://cache/File_writeArrayBuffer_006',
      buffer: buf,
      success: function () {
        console.info('File_writeArrayBuffer_006 call writeText success.');
        file.writeArrayBuffer({
            uri: 'internal://cache/File_writeArrayBuffer_006',
            buffer: buf,
            success: function () {
              console.info('File_writeArrayBuffer_006 call writeArrayBuffer success.');
              file.readArrayBuffer({
                uri: 'internal://cache/File_writeArrayBuffer_006',
                success: function () {
                  console.info('File_writeArrayBuffer_006 call readArrayBuffer pass');
                  done();
                },
                fail: function (data, code) {
                  console.info('File_writeArrayBuffer_006 readArrayBuffer fail, code: ' + code + ', data: ' + data);
                  expect(null).assertFail();
                },
              });
            },
            fail: function (data, code) {
              console.info('File_writeArrayBuffer_006 writeArrayBuffer fail, code: ' + code + ', data: ' + data);
              expect(null).assertFail();
            },
        });
      },
      fail: function (data, code) {
        console.info('File_writeArrayBuffer_006 writeText fail, code: ' + code + ', data: ' + data);
        expect(null).assertFail();
      },
    });
  });

  /**
   * @tc.name   File_writeArrayBuffer_007
   * @tc.number SUB_STORAGE_File_writeArrayBuffer_0700
   * @tc.desc   Function of API, error code: 202
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('File_writeArrayBuffer_007', Level.LEVEL0, async function (done) {
    let buf = new Uint8Array([48, 49, 50, 51, 65, 66, 67, 68, 32, 33]);
    file.writeArrayBuffer({
      uri: '',
      buffer: buf,
      success: function () {
        console.info('File_writeArrayBuffer_007 call writeArrayBuffer success.');
        expect(null).assertFail();
      },
      fail: function (data, code) {
        console.info('File_writeArrayBuffer_007 , code: ' + code + ', data: ' + data);
        expect(code == 202).assertTrue();
        done();
      },
    });
  });

  /**
   * @tc.name   File_writeArrayBuffer_008
   * @tc.number SUB_STORAGE_File_writeArrayBuffer_0800
   * @tc.desc   Function of API, error code: 300
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('File_writeArrayBuffer_008', Level.LEVEL0, async function (done) {
    let buf = new Uint8Array([48, 49, 50, 51, 65, 66, 67, 68, 32, 33]);
    file.mkdir({
      uri: 'internal://app/File_writeArrayBuffer_008',
      success: function () {
        console.info('call mkdir success.');
        done();
      },
      fail: function (data, code) {
        console.error('call fail callback fail, code: ' + code + ', data: ' + data);
      },
    });
    file.writeArrayBuffer({
      uri: 'internal://app/notdir/File_writeArrayBuffer_008',
      buffer: buf,
      success: function () {
        console.info('File_writeArrayBuffer_008 call writeArrayBuffer success.');
        expect(null).assertFail();
      },
      fail: function (data, code) {
        console.info('File_writeArrayBuffer_008 , code: ' + code + ', data: ' + data);
        expect(code == 300).assertTrue();
        done();
      },
    });
  });

  /**
   * @tc.name   File_writeArrayBuffer_009
   * @tc.number SUB_STORAGE_File_writeArrayBuffer_0900
   * @tc.desc   Function of API, error code: 300
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('File_writeArrayBuffer_009', Level.LEVEL0, async function (done) {
    let buf = new Uint8Array([1, 2, 3, 4, 5, 6, 7, 8]);
    file.writeArrayBuffer({
      uri: 'internal://cache/File_writeArrayBuffer_009',
      buffer: buf,
      success: function () {
        console.info('File_writeArrayBuffer_009 call writeArrayBuffer success');
        file.readArrayBuffer({
          uri: 'internal://cache/File_writeArrayBuffer_009',
          success: function (data) {
            console.info('File_writeArrayBuffer_009 call readArrayBuffer pass');
            file.delete({
              uri: 'internal://cache/File_writeArrayBuffer_009',
              success: function () {
                console.info('File_writeArrayBuffer_009 call delete success');
                done();
              },
              fail: function (data, code) {
                console.info('File_writeArrayBuffer_009 delete fail, code: ' + code + ', data: ' + data);
                expect(null).assertFail();
              },
            });
          },
          fail: function (data, code) {
            console.info('File_writeArrayBuffer_009 readArrayBuffer fail, code: ' + code + ', data: ' + data);
            expect(null).assertFail();
          },
        });
      },
      fail: function (data, code) {
        console.info('File_writeArrayBuffer_009 writeArrayBuffer fail, code: ' + code + ', data: ' + data);
        expect(null).assertFail();
      },
    });
  });

  /**
   * @tc.name   File_writeArrayBuffer_010
   * @tc.number SUB_STORAGE_File_writeArrayBuffer_1000
   * @tc.desc   Function of API, path = cache, virtual path The test file is exist.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('File_writeArrayBuffer_010', Level.LEVEL0, async function (done) {
    let buf = new Uint8Array([48, 49, 50, 51, 65, 66, 67, 68, 32, 33]);
    file.writeArrayBuffer({
      uri: 'internal://cache/../cache/File_writeArrayBuffer_010',
      buffer: buf,
      append: true,
      success: function () {
        console.info('File_writeArrayBuffer_010 call writeArrayBuffer success.');
        file.readArrayBuffer({
          uri: 'internal://cache/../cache/File_writeArrayBuffer_010',
          success: function (data) {
            console.info('File_writeArrayBuffer_010 call readArrayBuffer pass');
            done();
          },
          fail: function (data, code) {
            console.info('File_writeArrayBuffer_010 readArrayBuffer fail, code: ' + code + ', data: ' + data);
            expect(null).assertFail();
          },
        });
      },
      fail: function (data, code) {
        console.info('File_writeArrayBuffer_010 writeArrayBuffer fail, code: ' + code + ', data: ' + data);
        expect(null).assertFail();
      },
    });
  });

  /**
   * @tc.name   File_writeArrayBuffer_012
   * @tc.number SUB_STORAGE_File_writeArrayBuffer_1200
   * @tc.desc   Function of API, out of package, Virtual path, save the dir authority.The test file is exist.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('File_writeArrayBuffer_012', Level.LEVEL0, async function (done) {
    let buf = new Uint8Array([48, 49, 50, 51, 65, 66, 67, 68, 32, 33]);
    file.writeArrayBuffer({
      uri: 'internal://app/notdir/File_writeArrayBuffer_012',
      buffer: buf,
      append: true,
      success: function () {
        console.info('File_writeArrayBuffer_012  => pass');
        expect(null).assertFail();
      },
      fail: function (data, code) {
        console.info('File_writeArrayBuffer_012 , code: ' + code + ', data: ' + data);
        expect(code == 300).assertTrue();
        done();
      },
      complete: function () {
        console.info('writeArrayBuffer completed');
      }
    });
  });

  /**
   * @tc.name   File_readText_001
   * @tc.number SUB_STORAGE_File_readText_0100
   * @tc.desc   Function of API, readText, app path.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('File_readText_001', Level.LEVEL0, async function (done) {
    file.writeText({
      uri: 'internal://cache/File_readText_001',
      text: 'Text that just for test.',
      success: function () {
        console.info('File_readText_001 call writeText success.');
        file.readText({
          uri: 'internal://cache/File_readText_001',
          success: function (data) {
            console.info('File_readText_001 call readText success.');
            done();
          },
          fail: function (data, code) {
            console.info('File_readText_001 readText fail, code: ' + code + ', data: ' + data);
            expect(null).assertFail();
          },
        });
      },
      fail: function (data, code) {
        console.info('File_readText_001 writeText fail, code: ' + code + ', data: ' + data);
        expect(null).assertFail();
      },
    });
  });

  /**
   * @tc.name   File_readText_002
   * @tc.number SUB_STORAGE_File_readText_0200
   * @tc.desc   Function of API, encoding = UTF-8.The test file is exist.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('File_readText_002', Level.LEVEL0, async function (done) {
    file.writeText({
      uri: 'internal://cache/File_readText_002',
      text: 'Text that just for test.',
      encoding: 'utf-8',
      success: function () {
        console.info('File_readText_002 call writeText success.');
        file.readText({
          uri: 'internal://cache/File_readText_002',
          encoding: 'utf-8',
          success: function (data) {
            console.info('File_readText_002 call readText success.');
            done();
          },
          fail: function (data, code) {
            console.info('File_readText_002 readText fail, code: ' + code + ', data: ' + data);
            expect(null).assertFail();
          },
        });
      },
      fail: function (data, code) {
        console.info('File_readText_002 writeText fail, code: ' + code + ', data: ' + data);
        expect(null).assertFail();
      },
    });
  });

  /**
   * @tc.name   File_readText_003
   * @tc.number SUB_STORAGE_File_readText_0300
   * @tc.desc   Function of API, error code: 202.The test file and dir is exist.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('File_readText_003', Level.LEVEL0, async function (done) {
    file.readText({
      uri: '',
      success: function (data) {
        console.info(data.text);
        expect(null).assertFail();
      },
      fail: function (data, code) {
        console.info('File_readText_003 , code: ' + code + ', data: ' + data);
        expect(code == 202).assertTrue();
        done();
      },
    });
  });

  /**
   * @tc.name   File_readText_004
   * @tc.number SUB_STORAGE_File_readText_0400
   * @tc.desc   Function of API, error code: 300.The test dir is exist.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('File_readText_004', Level.LEVEL0, async function (done) {
    file.readText({
      uri: 'internal://cache/',
      success: function (data) {
        console.info(data.text);
        expect(null).assertFail();
      },
      fail: function (data, code) {
        console.info('File_readText_004 , code: ' + code + ', data: ' + data);
        expect(code == 300).assertTrue();
        done();
      },
    });
  });

  /**
   * @tc.name   File_readText_005
   * @tc.number SUB_STORAGE_File_readText_0500
   * @tc.desc   Function of API, error code: 301.The test file and dir is exist.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('File_readText_005', Level.LEVEL0, async function (done) {
    file.readText({
      uri: 'internal://cache/workspace/text.txt',
      success: function (data) {
        console.info(data.text);
        expect(null).assertFail();
      },
      fail: function (data, code) {
        console.info('File_readText_005 , code: ' + code + ', data: ' + data);
        expect(code == 301).assertTrue();
        done();
      },
    });
  });

  /**
   * @tc.name   File_readText_006
   * @tc.number SUB_STORAGE_File_readText_0600
   * @tc.desc   Function of API, readText, cache path.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('File_readText_006', Level.LEVEL0, async function (done) {
    file.writeText({
      uri: 'internal://cache/File_readText_006',
      text: 'test',
      success: function () {
        console.info('File_readText_006 call success');
        file.readText({
          uri: 'internal://cache/File_readText_006',
          success: function (data) {
            console.info('File_readText_006 call success' );
            file.delete({
              uri: 'internal://cache/File_readText_006',
              success: function () {
                console.info('File_readText_006 call success');
                done();
              },
              fail: function (data, code) {
                console.info('File_readText_006 delete fail, code: ' + code + ', data: ' + data);
                expect(null).assertFail();
              },
            });
          },
          fail: function (data, code) {
            console.info('File_readText_006 readText fail, code: ' + code + ', data: ' + data);
            expect(null).assertFail();
          },
        });
      },
      fail: function (data, code) {
        console.info('File_readText_006 writeText fail, code: ' + code + ', data: ' + data);
        expect(null).assertFail();
      },
    });
  });

  /**
   * @tc.name   File_readText_007
   * @tc.number SUB_STORAGE_File_readText_0700
   * @tc.desc   Function of API, virtual path.The test file is exist.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('File_readText_007', Level.LEVEL0, async function (done) {
    file.writeText({
      uri: 'internal://cache/../files/../files/File_readText_007',
      text: 'Text that just for test.',
      success: function () {
        console.info('File_readText_007 call writeText success.');
        file.readText({
          uri: 'internal://cache/../files/../files/File_readText_007',
          success: function (data) {
            console.info('File_readText_007 call readText success. data.text:' );
            file.delete({
              uri: 'internal://cache/../files/../files/File_readText_007',
              success: function () {
                console.info('File_readText_007 call delete success');
                done();
              },
              fail: function (data, code) {
                console.info('File_readText_007 delete fail, code: ' + code + ', data: ' + data);
                expect(null).assertFail();
              },
            });
          },
          fail: function (data, code) {
            console.info('File_readText_007 readText fail, code: ' + code + ', data: ' + data);
            expect(null).assertFail();
          },
        });
      },
      fail: function (data, code) {
        console.info('File_readText_007 writeText fail, code: ' + code + ', data: ' + data);
        expect(null).assertFail();
      },
    });
  });

  /**
   * @tc.name   File_readText_008
   * @tc.number SUB_STORAGE_File_readText_0800
   * @tc.desc   Function of API, virtual path.Test whether the files returned are equal.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it("File_readText_008", Level.LEVEL0, async function (done) {
    let fpath = await nextFileName("File_readText_008");
    let text = "0123456789abcdefg";
    expect(prepareFile(fpath, text)).assertTrue();
    sleep(10);
    try {
      file.readText({
        uri: "internal://cache/File_readText_008",
        success: function (data) {
          console.info("call readText success: " + data.text);
          expect(text == data.text).assertTrue();
          fileio.unlinkSync(fpath);
          done();
        },
        fail: function (data, code) {
          console.error("call fail callback fail, code: " + code + ", data: " + data);
          expect(null).assertFail();
        },
        complete: function () {
          console.info('readText completed');
        }
      });
    } catch (e) {
      console.info("File_readText_008 has failed for " + e);
      expect(null).assertFail();
    }
  });

  /**
   * @tc.name   File_read_array_buffer_001
   * @tc.number SUB_STORAGE_File_read_array_buffer_0100
   * @tc.desc   Function of API, readArrayBuffer, cache path.position = 0, length = 10.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('File_read_array_buffer_001', Level.LEVEL0, async function (done) {
    var buffer = new Uint8Array([48, 49, 50, 51, 65, 66, 67, 68, 32, 33]);
    file.writeArrayBuffer({
      uri: 'internal://cache/File_read_array_buffer_001',
      buffer: buffer,
      success: function () {
        console.info('File_read_array_buffer_001 call writeArrayBuffer success.');
        file.readArrayBuffer({
          uri: 'internal://cache/File_read_array_buffer_001',
          position: 0,
          length: 10,
          success: function (data) {
            console.info('File_read_array_buffer_001 call readArrayBuffer pass');
            file.delete({
              uri: 'internal://cache/File_read_array_buffer_001',
              success: function () {
                console.info('File_read_array_buffer_001 call delete success');
                done();
              },
              fail: function (data, code) {
                console.info('File_read_array_buffer_001 delete fail, code: ' + code + ', data: ' + data);
                expect(null).assertFail();
              },
            });
          },
          fail: function (data, code) {
            console.info('File_read_array_buffer_001 readArrayBuffer fail, code: ' + code + ', data: ' + data);
            expect(null).assertFail();
          },
        });
      },
      fail: function (data, code) {
        console.info('File_read_array_buffer_001 writeArrayBuffer fail, code: ' + code + ', data: ' + data);
        expect(null).assertFail();
      },
    });
  });

  /**
   * @tc.name   File_read_array_buffer_002
   * @tc.number SUB_STORAGE_File_read_array_buffer_0200
   * @tc.desc   Function of API, readArrayBuffer,
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('File_read_array_buffer_002', Level.LEVEL0, async function (done) {
    var buffer = new Uint8Array([48, 49, 50, 51, 65, 66, 67, 68, 32, 33]);
    file.writeArrayBuffer({
      uri: 'internal://cache/File_read_array_buffer_002',
      buffer: buffer,
      success: function () {
        console.info('File_read_array_buffer_002 call writeArrayBuffer success.');
        file.readArrayBuffer({
          uri: 'internal://cache/File_read_array_buffer_002',
          success: function (data) {
            console.info('File_read_array_buffer_002 call readArrayBuffer pass');
            done();
          },
          fail: function (data, code) {
            console.info('File_read_array_buffer_002 readArrayBuffer fail, code: ' + code + ', data: ' + data);
            expect(null).assertFail();
          },
        });
      },
      fail: function (data, code) {
        console.info('File_read_array_buffer_002 writeArrayBuffer fail, code: ' + code + ', data: ' + data);
        expect(null).assertFail();
      },
    });
  });

  /**
   * @tc.name   File_read_array_buffer_003
   * @tc.number SUB_STORAGE_File_read_array_buffer_0300
   * @tc.desc   Function of API, readArrayBuffer, wrong uri.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('File_read_array_buffer_003', Level.LEVEL0, async function (done) {
    file.readArrayBuffer({
      uri: '',
      success: function (data) {
        console.info('File_read_array_buffer_003 call readArrayBuffer success: ' );
        expect(null).assertFail();
      },
      fail: function (data, code) {
        console.info('File_read_array_buffer_003 , code: ' + code + ', data: ' + data);
        expect(code == 202).assertTrue();
        done();
      },
    });
  });

  /**
   * @tc.name   File_read_array_buffer_004
   * @tc.number SUB_STORAGE_File_read_array_buffer_0400
   * @tc.desc   Function of API, readArrayBuffer, wrong position.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('File_read_array_buffer_004', Level.LEVEL0, async function (done) {
    let fpath = await fileName('File_read_array_buffer_004');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
    file.readArrayBuffer({
      uri: fpath,
      position: 100,
      success: function (data) {
        console.info('File_read_array_buffer_004 call readArrayBuffer success: ' );
        expect(null).assertFail();
      },
      fail: function (data, code) {
        console.info('File_read_array_buffer_004 , code: ' + code + ', data: ' + data);
        expect(code == 202).assertTrue();
        done();
      },
    });
  });

  /**
   * @tc.name   File_read_array_buffer_005
   * @tc.number SUB_STORAGE_File_read_array_buffer_0500
   * @tc.desc   Function of API, readArrayBuffer, wrong length.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('File_read_array_buffer_005', Level.LEVEL0, async function (done) {
    let fpath = await fileName('File_read_array_buffer_005');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
    file.readArrayBuffer({
      uri: fpath,
      length: -1,
      success: function (data) {
        console.info('File_read_array_buffer_005 call readArrayBuffer success: ' );
        expect(null).assertFail();
      },
      fail: function (data, code) {
        console.info('File_read_array_buffer_005 , code: ' + code + ', data: ' + data);
        expect(code == 202).assertTrue();
        done();
      },
    });
  });

  /**
   * @tc.name   File_read_array_buffer_006
   * @tc.number SUB_STORAGE_File_read_array_buffer_0600
   * @tc.desc   Function of API, error code: 202 Set uri is dir path.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('File_read_array_buffer_006', Level.LEVEL0, async function (done) {
    file.readArrayBuffer({
      uri: 'internal://app',
      success: function (data) {
        console.info('File_read_array_buffer_006 call readArrayBuffer success: ' );
        expect(null).assertFail();
      },
      fail: function (data, code) {
        console.info('File_read_array_buffer_006 , code: ' + code + ', data: ' + data);
        expect(code == 202).assertTrue();
        done();
      },
    });
  });

  /**
   * @tc.name   File_read_array_buffer_007
   * @tc.number SUB_STORAGE_File_read_array_buffer_0700
   * @tc.desc   Function of API, error code: 301
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('File_read_array_buffer_007', Level.LEVEL0, async function (done) {
    file.readArrayBuffer({
      uri: 'internal://cache/File_read_array_buffer_007',
      success: function (data) {
        console.info('File_read_array_buffer_007 call readArrayBuffer success: ' );
        expect(null).assertFail();
      },
      fail: function (data, code) {
        console.info('File_read_array_buffer_007 , code: ' + code + ', data: ' + data);
        expect(code == 301).assertTrue();
        done();
      },
    });
  });

  /**
   * @tc.name   File_read_array_buffer_008
   * @tc.number SUB_STORAGE_File_read_array_buffer_0800
   * @tc.desc   Function of API, cache path.The test file is exist.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('File_read_array_buffer_008', Level.LEVEL0, async function (done) {
    let buf = new Uint8Array([1, 2, 3, 4, 5, 6, 7, 8]);
    file.writeArrayBuffer({
      uri: 'internal://cache/File_read_array_buffer_008',
      buffer: buf,
      success: function () {
        console.info('File_read_array_buffer_008 call writeArrayBuffer success');
        file.readArrayBuffer({
          uri: 'internal://cache/File_read_array_buffer_008',
          success: function (data) {
            console.info('File_read_array_buffer_008 call readArrayBuffer success ' );
            file.delete({
              uri: 'internal://cache/File_read_array_buffer_008',
              success: function () {
                console.info('File_read_array_buffer_008 call delete success');
                done();
              },
              fail: function (data, code) {
                console.info('File_read_array_buffer_008 delete fail, code: ' + code + ', data: ' + data);
                expect(null).assertFail();
              },
            });
          },
          fail: function (data, code) {
            console.info('File_read_array_buffer_008 readArrayBuffer fail, code: ' + code + ', data: ' + data);
            expect(null).assertFail();
          },
        });
      },
      fail: function (data, code) {
        console.info('File_read_array_buffer_008 writeArrayBuffer fail, code: ' + code + ', data: ' + data);
        expect(null).assertFail();
      },
    });
  });

  /**
   * @tc.name   File_read_array_buffer_009
   * @tc.number SUB_STORAGE_File_read_array_buffer_0900
   * @tc.desc   Function of API, virtual path.The test file is exist.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('File_read_array_buffer_009', Level.LEVEL0, async function (done) {
    var buffer = new Uint8Array([48, 49, 50, 51, 65, 66, 67, 68, 32, 33]);
    file.writeArrayBuffer({
      uri: 'internal://cache/../cache/File_read_array_buffer_009',
      buffer: buffer,
      success: function () {
        console.info('File_read_array_buffer_009 call writeArrayBuffer success.');
        file.readArrayBuffer({
          uri: 'internal://cache/../cache/File_read_array_buffer_009',
          position: 0,
          length: 10,
          success: function (data) {
            console.info('File_read_array_buffer_009 call readArrayBuffer success. data.buffer:' );
            file.delete({
              uri: 'internal://cache/../cache/File_read_array_buffer_009',
              success: function () {
                console.info('File_read_array_buffer_009 call delete success');
                done();
              },
              fail: function (data, code) {
                console.info('File_read_array_buffer_009 delete fail, code: ' + code + ', data: ' + data);
                expect(null).assertFail();
              },
            });
          },
          fail: function (data, code) {
            console.info('File_read_array_buffer_009 readArrayBuffer fail, code: ' + code + ', data: ' + data);
            expect(null).assertFail();
          },
          complete: function () {
            console.info('readArrayBuffer completed');
          }
        });
      },
      fail: function (data, code) {
        console.info('File_read_array_buffer_009 writeArrayBuffer fail, code: ' + code + ', data: ' + data);
        expect(null).assertFail();
      },
    });
  });

  /**
   * @tc.name   File_access_001
   * @tc.number SUB_STORAGE_File_access_0100
   * @tc.desc   Function of API, access, cache path.The test file is exist.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('File_access_001', Level.LEVEL0, async function (done) {
    file.writeText({
      uri: 'internal://cache/File_access_001',
      text: 'Text that just for test.',
      success: function () {
        console.info('File_access_001 call writeText success.');
        file.access({
          uri: 'internal://cache/File_access_001',
          success: function () {
            console.info('File_access_001 call access success.');
            file.delete({
              uri: 'internal://cache/File_access_001',
              success: function () {
                console.info('File_access_001 call delete success.');
                done();
              },
              fail: function (data, code) {
                console.info('File_access_001 delete fail, code: ' + code + ', data: ' + data);
                expect(null).assertFail();
              },
            });
          },
          fail: function (data, code) {
            console.info('File_access_001 access fail, code: ' + code + ', data: ' + data);
            expect(null).assertFail();
          },
        });
      },
      fail: function (data, code) {
        console.info('File_access_001 writeText fail, code: ' + code + ', data: ' + data);
        expect(null).assertFail();
      },
    });
  });

  /**
   * @tc.name   File_access_002
   * @tc.number SUB_STORAGE_File_access_0200
   * @tc.desc   Function of API, access, app path.The test file is exist.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('File_access_002', Level.LEVEL0, async function (done) {
    file.mkdir({
      uri: 'internal://cache/File_access_002',
      success: function () {
        console.info('File_access_002 call mkdir success.');
        file.access({
          uri: 'internal://cache/File_access_002',
          success: function () {
            console.info('File_access_002 call access success.');
            file.rmdir({
              uri: 'internal://cache/File_access_002',
              success: function () {
                console.info('File_access_002 call rmdir success.');
                done();
              },
              fail: function (data, code) {
                console.info('File_access_002 rmdir fail, code: ' + code + ', data: ' + data);
                expect(null).assertFail();
              },
            });
          },
          fail: function (data, code) {
            console.info('File_access_002 access fail, code: ' + code + ', data: ' + data);
            expect(null).assertFail();
          },
        });
      },
      fail: function (data, code) {
        console.info('File_access_002 mkdir fail, code: ' + code + ', data: ' + data);
        expect(null).assertFail();
      },
    });
  });

  /**
   * @tc.name   File_access_003
   * @tc.number SUB_STORAGE_File_access_0300
   * @tc.desc   Function of API, error code: 202 The test file and dir are exist.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('File_access_003', Level.LEVEL0, async function (done) {
    let fpath = await fileName('File_access_003');
    file.access({
      uri: fpath,
      success: function () {
        console.info('File_access_003 call access success.');
        expect(null).assertFail();
      },
      fail: function (data, code) {
        console.info('File_access_003 , code: ' + code + ', data: ' + data);
        expect(code == 202).assertTrue();
        done();
      },
    });
  });

  /**
   * @tc.name   File_access_004
   * @tc.number SUB_STORAGE_File_access_0400
   * @tc.desc   Function of API, error code: 301
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('File_access_004', Level.LEVEL0, async function (done) {
    file.access({
      uri: 'internal://app/File_access_004.txt',
      success: function () {
        console.info('File_access_004 call access success.');
        expect(null).assertFail();
      },
      fail: function (data, code) {
        console.info('File_access_004 , code: ' + code + ', data: ' + data);
        expect(code == 301).assertTrue();
        done();
      },
    });
  });

  /**
   * @tc.name   File_access_005
   * @tc.number SUB_STORAGE_File_access_0500
   * @tc.desc   Function of API, error code: 301
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('File_access_005', Level.LEVEL0, async function (done) {
    file.access({
      uri: 'internal://app/File_access_005',
      success: function () {
        console.info('File_access_005 call access success.');
        expect(null).assertFail();
      },
      fail: function (data, code) {
        console.info('File_access_005 , code: ' + code + ', data: ' + data);
        expect(code == 301).assertTrue();
        done();
      },
    });
  });

  /**
   * @tc.name   File_access_006
   * @tc.number SUB_STORAGE_File_access_0600
   * @tc.desc   Function of API, parameter more than 4096.The test file and dir are exist.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('File_access_006', Level.LEVEL0, async function (done) {
    let firstPath = randomString(32);
    let dpath = await fileName(firstPath);
    let uri = 'internal://cache/' + firstPath;
    fileio.mkdirSync(dpath);
    for (let i = 0; i < 16; i++) {
      console.info('time' + i);
      let sonPath = randomString(251);
      uri = uri + '/f' + sonPath;
    }
    file.access({
      uri: uri,
      success: function () {
        console.info('File_access_006 => pass');
        expect(null).assertFail();
      },
      fail: function (data, code) {
        console.info('File_access_006 , code: ' + code + ', data: ' + data);
        expect(code == 300).assertTrue();
        fileio.rmdirSync(dpath);
        done();
      },
    });

  });

  /**
   * @tc.name   File_access_007
   * @tc.number SUB_STORAGE_File_access_0700
   * @tc.desc   Function of API, app path.The test file is exist.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('File_access_007', Level.LEVEL0, async function (done) {
    file.writeText({
      uri: 'internal://cache/File_access_007',
      text: 'hello',
      success: function () {
        console.info('File_access_007 writeText success ');
        file.access({
          uri: 'internal://cache/File_access_007',
          success: function () {
            console.info('File_access_007 access success');
            file.delete({
              uri: 'internal://cache/File_access_007',
              success: function () {
                console.info('File_access_007 delete success');
                done();
              },
              fail: function (data, code) {
                console.info('File_access_007 delete fail, code: ' + code + ', data: ' + data);
                expect(null).assertFail();
              },
            });
          },
          fail: function (data, code) {
            console.info('File_access_007 access fail, code: ' + code + ', data: ' + data);
            expect(null).assertFail();
          },
        });
      },
      fail: function (data, code) {
        console.info('File_access_007 writeText fail, code: ' + code + ', data: ' + data);
        expect(null).assertFail();
      },
    });
  });

  /**
   * @tc.name   File_access_008
   * @tc.number SUB_STORAGE_File_access_0800
   * @tc.desc   Function of API, virtual path.The test file is exist.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('File_access_008', Level.LEVEL0, async function (done) {
    file.writeText({
      uri: 'internal://cache/../cache/File_access_008',
      text: 'Text that just for test.',
      success: function () {
        console.info('File_access_008 writeText success.');
        file.access({
          uri: 'internal://cache/../cache/File_access_008',
          success: function () {
            console.info('File_access_008 call access success.');
            file.delete({
              uri: 'internal://cache/../cache/File_access_008',
              success: function () {
                console.info('File_access_008 call delete success.');
                done();
              },
              fail: function (data, code) {
                console.info('File_access_008 delete fail, code: ' + code + ', data: ' + data);
                expect(null).assertFail();
              }
            });
          },
          fail: function (data, code) {
            console.info('File_access_008 access fail, code: ' + code + ', data: ' + data);
            expect(null).assertFail();
          },
          complete: function () {
            console.info('access completed');
          }
        });
      },
      fail: function (data, code) {
        console.info('File_access_008 writeText fail, code: ' + code + ', data: ' + data);
        expect(null).assertFail();
      },
    });
  });

  /**
   * @tc.name   File_mkdir_001
   * @tc.number SUB_STORAGE_File_mkdir_0100
   * @tc.desc   Function of API, mkdir, app path.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('File_mkdir_001', Level.LEVEL0, async function (done) {
    file.mkdir({
      uri: 'internal://cache/File_mkdir_001',
      success: function () {
        console.info('File_mkdir_001 call mkdir success.');
        file.rmdir({
          uri: 'internal://cache/File_mkdir_001',
          success: function () {
            console.info('File_mkdir_001 call rmdir success.');
            done();
          },
          fail: function (data, code) {
            console.info('File_mkdir_001 rmdir fail, code: ' + code + ', data: ' + data);
            expect(null).assertFail();
          },
        });
      },
      fail: function (data, code) {
        console.info('File_mkdir_001 mkdir fail, code: ' + code + ', data: ' + data);
        expect(null).assertFail();
      },
    });
  });

  /**
   * @tc.name   File_mkdir_002
   * @tc.number SUB_STORAGE_File_mkdir_0200
   * @tc.desc   Function of API, mkdir, recursive not set value.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('File_mkdir_002', Level.LEVEL0, async function (done) {
    file.mkdir({
      uri: 'internal://app/test/File_mkdir_002',
      success: function () {
        console.info('File_mkdir_002 call mkdir success.');
        expect(null).assertFail();
      },
      fail: function (data, code) {
        console.info('File_mkdir_002 , code: ' + code + ', data: ' + data);
        expect(code == 300).assertTrue();
        done();
      },
    });
  });

  /**
   * @tc.name   File_mkdir_003
   * @tc.number SUB_STORAGE_File_mkdir_0300
   * @tc.desc   Function of API, mkdir, recursive.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('File_mkdir_003', Level.LEVEL0, async function (done) {
    file.mkdir({
      uri: 'internal://cache/test/File_mkdir_003d',
      recursive: true,
      success: function () {
        console.info('File_mkdir_003 call mkdir success.');
        done();
      },
      fail: function (data, code) {
        console.info('File_mkdir_003 , code: ' + code + ', data: ' + data);
        expect(null).assertFail();
      },
    });
  });

  /**
   * @tc.name   File_mkdir_004
   * @tc.number SUB_STORAGE_File_mkdir_0400
   * @tc.desc   Function of API, error code: 202
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('File_mkdir_004', Level.LEVEL0, async function (done) {
    file.mkdir({
      uri: 'internal://files/test/File_mkdir_002d',
      success: function () {
        console.info('File_mkdir_004 call mkdir success.');
        expect(null).assertFail();
      },
      fail: function (data, code) {
        console.info('File_mkdir_004, code: ' + code + ', data: ' + data);
        expect(code == 202).assertTrue();
        done();
      },
    });
  });

  /**
   * @tc.name   File_mkdir_005
   * @tc.number SUB_STORAGE_File_mkdir_0500
   * @tc.desc   Function of API, special characters.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('File_mkdir_005', Level.LEVEL0, async function (done) {
    file.mkdir({
      uri: 'internal://cache/！@/<>',
      success: function () {
        console.info('File_mkdir_005 mkdir success');
        expect(null).assertFail();
      },
      fail: function (data, code) {
        console.info('File_mkdir_005 fail, code: ' + code + ', data: ' + data);
        expect(code == 300).assertTrue();
        done();
      },
    });
  });

  /**
   * @tc.name   File_mkdir_006
   * @tc.number SUB_STORAGE_File_mkdir_0600
   * @tc.desc   Function of API, parameter too long.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('File_mkdir_006', Level.LEVEL0, async function (done) {
    let fileName = randomString(257);
    file.mkdir({
      uri: 'internal://cache/' + fileName,
      success: function () {
        console.info('File_mkdir_006 mkdir success');
        expect(null).assertFail();
      },
      fail: function (data, code) {
        console.info('File_mkdir_006 =>fail ,code：' + code + ',data: ' + data);
        expect(code == 300).assertTrue();
        done();
      },
    });
  });

  /**
   * @tc.name   File_mkdir_007
   * @tc.number SUB_STORAGE_File_mkdir_0700
   * @tc.desc   Function of API, cache path.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('File_mkdir_007', Level.LEVEL0, async function (done) {
    file.mkdir({
      uri: 'internal://cache/File_mkdir_007d',
      success: function () {
        console.info('File_mkdir_007 mkdir success');
        file.rmdir({
          uri: 'internal://cache/File_mkdir_007d',
          success: function () {
            console.info('File_mkdir_007 delete success');
            done();
          },
          fail: function (data, code) {
            console.info('File_mkdir_007 delete fail, code: ' + code + ', data: ' + data);
            expect(null).assertFail();
          },
        });
      },
      fail: function (data, code) {
        console.info('File_mkdir_007 mkdir fail, code: ' + code + ', data: ' + data);
        expect(null).assertFail();
      },
    });
  });

  /**
   * @tc.name   File_mkdir_008
   * @tc.number SUB_STORAGE_File_mkdir_0800
   * @tc.desc   Function of API, virtual path.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('File_mkdir_008', Level.LEVEL0, async function (done) {
    file.mkdir({
      uri: 'internal://cache/../files/File_mkdir_008',
      success: function () {
        console.info('File_mkdir_008 call mkdir success.');
        file.rmdir({
          uri: 'internal://cache/../files/File_mkdir_008',
          success: function () {
            console.info('File_mkdir_008 call rmdir success.');
            done();
          },
          fail: function (data, code) {
            console.info('File_mkdir_008 rmdir fail, code: ' + code + ', data: ' + data);
            expect(null).assertFail();
          },
        });
      },
      fail: function (data, code) {
        console.info('File_mkdir_008 mkdir fail, code: ' + code + ', data: ' + data);
        expect(null).assertFail();
      },
    });
  });

  /**
   * @tc.name   File_mkdir_010
   * @tc.number SUB_STORAGE_File_mkdir_1000
   * @tc.desc   Function of API, out of package, out of package, Virtual path, save the dir authority.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('File_mkdir_010', Level.LEVEL0, async function (done) {
    file.mkdir({
      uri: 'internal://app/notdir/File_mkdir_010',
      success: function () {
        console.info('File_mkdir_010 call mkdir success.');
        expect(null).assertFail();
      },
      fail: function (data, code) {
        console.info('File_mkdir_010 call mkdir callback fail, code: ' + code + ', data: ' + data);
        expect(code == 300).assertTrue();
        done();
      },
      complete: function () {
        console.info('mkdir completed');
      }
    });
  });

  /**
   * @tc.name   File_rmdir_001
   * @tc.number SUB_STORAGE_File_rmdir_0100
   * @tc.desc   Function of API, rmdir, app path.The test dir is exist, and it can be delete, the dir is empty.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('File_rmdir_001', Level.LEVEL0, async function (done) {
    file.mkdir({
      uri: 'internal://cache/File_rmdir_001',
      success: function () {
        console.info('File_rmdir_001 call mkdir success.');
        file.rmdir({
          uri: 'internal://cache/File_rmdir_001',
          success: function () {
            console.info('File_rmdir_001 call rmdir success.');
            done();
          },
          fail: function (data, code) {
            console.info('File_rmdir_001 rmdir fail, code: ' + code + ', data: ' + data);
            expect(null).assertFail();
          },
        });
      },
      fail: function (data, code) {
        console.info('File_rmdir_001 mkdir fail, code: ' + code + ', data: ' + data);
        expect(null).assertFail();
      },
    });
  });

  /**
   * @tc.name   File_rmdir_002
   * @tc.number SUB_STORAGE_File_rmdir_0200
   * @tc.desc   Function of API, recursive not set value.The test dir is exist, and it not empty.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('File_rmdir_002', Level.LEVEL0, async function (done) {
    file.mkdir({
      uri: 'internal://app/test/File_rmdir_002',
      recursive: true,
      success: function () {
        console.info('File_rmdir_002 mkdir success.');
        file.rmdir({
            uri: 'internal://app/test',
            recursive: false,
            success: function () {
              console.info('File_rmdir_002 call rmdir success.');
              expect(null).assertFail();
            },
            fail: function (data, code) {
              console.info('File_rmdir_002 fail, code: ' + code + ', data: ' + data);
              expect(code == 301 || code == 300).assertTrue();
              done();
            },
          });
      },
      fail: function (data, code) {
        console.info('File_rmdir_002 fail, code: ' + code + ', data: ' + data);
        expect(null).assertFail();
      },
    });
  });

  /**
   * @tc.name   File_rmdir_003
   * @tc.number SUB_STORAGE_File_rmdir_0300
   * @tc.desc   Function of API, recursive = ture.The test dir is exist, and it not empty.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('File_rmdir_003', Level.LEVEL0, async function (done) {
    file.mkdir({
      uri: 'internal://cache/test/File_rmdir_003/File_rmdir_003_1/File_rmdir_003_2',
      recursive: true,
      success: function () {
        console.info('File_rmdir_003 mkdir success.');
        file.mkdir({
            uri: 'internal://cache/test/File_rmdir_003_1/File_rmdir_003_1/File_rmdir_003_2',
            recursive: true,
            success: function () {
              console.info('File_rmdir_003 mkdir success.');
              file.mkdir({
                uri: 'internal://cache/test/File_rmdir_003_2/File_rmdir_003_1/File_rmdir_003_2',
                recursive: true,
                success: function () {
                  console.info('File_rmdir_003 mkdir success.');
                  file.rmdir({
                    uri: 'internal://cache/test',
                    recursive: true,
                    success: function () {
                      console.info('File_rmdir_003 call rmdir success.');
                      done();
                    },
                    fail: function (data, code) {
                      console.info('File_rmdir_003 , code: ' + code + ', data: ' + data);
                      expect(null).assertFail();
                    },
                  });
                },
                fail: function (data, code) {
                  console.info('File_rmdir_003 fail, code: ' + code + ', data: ' + data);
                  expect(null).assertFail();
                },
              });
            },
            fail: function (data, code) {
              console.info('File_rmdir_003 fail, code: ' + code + ', data: ' + data);
              expect(null).assertFail();
            },
          });
      },
      fail: function (data, code) {
        console.info('File_rmdir_003 fail, code: ' + code + ', data: ' + data);
        expect(null).assertFail();
      },
    });
  });

  /**
   * @tc.name   File_rmdir_004
   * @tc.number SUB_STORAGE_File_rmdir_0400
   * @tc.desc   Function of API, error code: 202
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('File_rmdir_004', Level.LEVEL0, async function (done) {
    file.rmdir({
      uri: '/data/accounts/account_0/appdata/ohos.acts.distributeddatamgr.distributedfile/cache/',
      success: function () {
        console.info('File_rmdir_004 call rmdir success.');
        expect(null).assertFail();
      },
      fail: function (data, code) {
        console.info('File_rmdir_004 , code: ' + code + ', data: ' + data);
        expect(code == 202).assertTrue();
        done();
      },
    });
  });

  /**
   * @tc.name   File_rmdir_005
   * @tc.number SUB_STORAGE_File_rmdir_0500
   * @tc.desc   Function of API, error code: 301
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('File_rmdir_005', Level.LEVEL0, async function (done) {
    file.rmdir({
      uri: 'internal://app/123',
      success: function () {
        console.info('File_rmdir_005 call rmdir success.');
        expect(null).assertFail();
      },
      fail: function (data, code) {
        console.info('File_rmdir_005 rmdir fail, code: ' + code + ', data: ' + data);
        expect(code == 301).assertTrue();
        done();
      },
    });
  });

  /**
   * @tc.name   File_rmdir_006
   * @tc.number SUB_STORAGE_File_rmdir_0600
   * @tc.desc   Function of API, too long path.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('File_rmdir_006', Level.LEVEL0, async function (done) {
    let firstPath = randomString(255);
    let uri = 'internal://cache/' + firstPath;
    file.mkdir({
      uri: uri,
      success: function () {
        console.info('File_rmdir_006 mkdir success');
        file.rmdir({
          uri: uri,
          success: function () {
            console.info('File_rmdir_006 rmdir success');
            done();
          },
          fail: function (data, code) {
            console.info('File_rmdir_006 rmdir fail, code: ' + code + ', data: ' + data);
            expect(null).assertFail();
          },
        });
      },
      fail: function (data, code) {
        console.info('File_rmdir_006 mkdir fail, code: ' + code + ', data: ' + data);
        expect(null).assertFail();
      },
    });
  });

  /**
   * @tc.name   File_rmdir_007
   * @tc.number SUB_STORAGE_File_rmdir_0700
   * @tc.desc   Function of API, cache path.The test dir is exist, and it can be delete, it is empty.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('File_rmdir_007', Level.LEVEL0, async function (done) {
    file.mkdir({
      uri: 'internal://cache/File_rmdir_007d',
      success: function () {
        console.info('File_rmdir_007 mkdir success');
        file.rmdir({
          uri: 'internal://cache/File_rmdir_007d',
          success: function () {
            console.info('File_rmdir_007 rmdir success');
            done();
          },
          fail: function (data, code) {
            console.info('File_rmdir_007 rmdir fail, code: ' + code + ', data: ' + data);
            expect(null).assertFail();
          },
        });
      },
      fail: function (data, code) {
        console.info('File_rmdir_007 mkdir fail, code: ' + code + ', data: ' + data);
        expect(null).assertFail();
      },
    });
  });

  /**
   * @tc.name   File_rmdir_008
   * @tc.number SUB_STORAGE_File_rmdir_0800
   * @tc.desc   Function of API, virtual path.The test dir is exist.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('File_rmdir_008', Level.LEVEL0, async function (done) {
    file.mkdir({
      uri: 'internal://cache/../files/File_rmdir_008',
      success: function () {
        console.info('File_rmdir_008 call mkdir success.');
        file.rmdir({
          uri: 'internal://cache/../files/File_rmdir_008',
          success: function () {
            console.info('File_rmdir_008 call rmdir success.');
            done();
          },
          fail: function (data, code) {
            console.info('File_rmdir_008 rmdir fail, code: ' + code + ', data: ' + data);
            expect(null).assertFail();
          },
        });
      },
      fail: function (data, code) {
        console.info('File_rmdir_008 mkdir fail, code: ' + code + ', data: ' + data);
        expect(null).assertFail();
      },
    });
  });

  /**
   * @tc.name   File_rmdir_010
   * @tc.number SUB_STORAGE_File_rmdir_1000
   * @tc.desc   Function of API, out of package, Virtual path, save the dir authority.The test dir is exist.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('File_rmdir_010', Level.LEVEL0, async function (done) {
    file.rmdir({
      uri: 'internal://app/../../com.ohos.systemui',
      success: function () {
        console.info('File_rmdir_010 call rmdir success.');
        expect(null).assertFail();
      },
      fail: function (data, code) {
        console.info('File_rmdir_010 call rmdir callback fail, code: ' + code + ', data: ' + data);
        expect(code == 301).assertTrue();
        done();
      },
      complete: function () {
        console.info('rmdir completed');
      }
    });
  });

  /**
   * @tc.name   File_Move_001
   * @tc.number SUB_STORAGE_File_Move_0100
   * @tc.desc   Function of API, move.The test file is exist.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('File_Move_001', Level.LEVEL0, async function (done) {
    file.writeText({
      uri: 'internal://cache/File_Move_001',
      text: 'Text that just for test.',
      success: function () {
        console.info('File_Move_001 call writeText success.');
        file.move({
          srcUri: 'internal://cache/File_Move_001',
          dstUri: 'internal://cache/File_Move_001_1',
          success: function (data) {
            console.info('File_Move_001 call writeText success. data:' + data);
            done();
          },
          fail: function (data, code) {
            console.info('File_Move_001 move fail, code: ' + code + ', data: ' + data);
            expect(null).assertFail();
          },
        });
      },
      fail: function (data, code) {
        console.error('File_Move_001 call writeText fail, code: ' + code + ', data: ' + data);
        expect(null).assertFail();
      },
    });
  });

  /**
   * @tc.name   File_Move_002
   * @tc.number SUB_STORAGE_File_Move_0200
   * @tc.desc   Function of API, document integrity.The test file is exist.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('File_Move_002', Level.LEVEL0, async function (done) {
    let typeArray = new Array('.txt', '.ppt', '.flac', '.mp4', '.so', '.zip');
    let dpath = await fileName('cache');
    fileio.mkdirSync(dpath);
    for (let i = 0; i < typeArray.length; i++) {
      let srcFpath = await fileName('File_Move_002') + typeArray[i];
      let dstFpath = await cacheFileName('File_Move_002') + typeArray[i];
      expect(prepareEmptyFile(srcFpath)).assertTrue();
      file.move({
        srcUri: 'internal://cache/../files/File_Move_002' + typeArray[i],
        dstUri: 'internal://cache/../files/cache/File_Move_002' + typeArray[i],
        success: function (uri) {
          console.info('File_Move_002 call move success. uri: ' + uri);
          done();
        },
        fail: function (data, code) {
          console.info('File_Move_002 , code: ' + code + ', data: ' + data);
          expect(null).assertFail();
        },
      });
    }
  });

  /**
   * @tc.name   File_Move_003
   * @tc.number SUB_STORAGE_File_Move_0300
   * @tc.desc   Function of API, different size file.The test file is exist.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('File_Move_003', Level.LEVEL0, async function (done) {
    let srcFpath = await fileName('File_Move_003');
    expect(prepareFile(srcFpath, FILE_CONTENT)).assertTrue();
    let dstFpath = await cacheFileName('File_Move_003');
    let srcUri = 'internal://cache/../files/File_Move_003';
    let dstUri = 'internal://app/cache/File_Move_003';
    file.move({
      srcUri: srcUri,
      dstUri: dstUri,
      success: function () {
        console.info('File_Move_003 call move success.');
        done();
      },
      fail: function (data, code) {
        console.info('File_Move_003 , code: ' + code + ', data: ' + data);
        expect(null).assertFail();
      },
    });
  });

  /**
   * @tc.name   File_Move_004
   * @tc.number SUB_STORAGE_File_Move_0400
   * @tc.desc   Function of API, error code: 202.The test file is exist.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('File_Move_004', Level.LEVEL0, async function (done) {
    let srcFpath = await fileName('File_Move_004');
    expect(prepareFile(srcFpath, FILE_CONTENT)).assertTrue();
    file.move({
      srcUri: 'internal://app/File_Move_004',
      dstUri: null,
      success: function () {
        console.info('File_Move_004 call move success.');
        expect(null).assertFail();
      },
      fail: function (data, code) {
        console.info('File_Move_004 , code: ' + code + ', data: ' + data);
        expect(code == 202).assertTrue();
        done();
      },
    });
  });

  /**
   * @tc.name   File_Move_005
   * @tc.number SUB_STORAGE_File_Move_0500
   * @tc.desc   Function of API, error code: 300.The test file is exist.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('File_Move_005', Level.LEVEL0, async function (done) {
    let srcDpath = await fileName('File_Move_005d');
    fileio.mkdirSync(srcDpath);
    file.move({
      srcUri: 'internal://cache/../files/File_Move_005d',
      dstUri: 'internal://app/cache/File_Move_005d',
      success: function () {
        console.info('File_Move_005 call move success.');
        done();
      },
      fail: function (data, code) {
        console.info('File_Move_005 , code: ' + code + ', data: ' + data);
        expect(null).assertFail();
      },
    });
  });

  /**
   * @tc.name   File_Move_006
   * @tc.number SUB_STORAGE_File_Move_0600
   * @tc.desc   Function of API, error code: 301.The test file is not exist.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('File_Move_006', Level.LEVEL0, async function (done) {
    let dstUri = await fileName('File_Move_006');
    expect(prepareFile(dstUri, FILE_CONTENT)).assertTrue();
    file.move({
      srcUri: 'internal://app/File_Move',
      dstUri: 'internal://app/File_Move_006',
      success: function () {
        console.info('File_Move_006 call move success.');
        expect(null).assertFail();
      },
      fail: function (data, code) {
        console.info('File_Move_006 , code: ' + code + ', data: ' + data);
        expect(code == 301).assertTrue();
        done();
      },
    });
  });

  /**
   * @tc.name   File_Move_007
   * @tc.number SUB_STORAGE_File_Move_0700
   * @tc.desc   Function of API, uri more too long.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('File_Move_007', Level.LEVEL0, async function (done) {
    let firstPath = randomString(32);
    let dpath = await fileName(firstPath);
    let uri = 'internal://app/' + firstPath;
    fileio.mkdirSync(dpath);
    for (let i = 0; i < 16; i++) {
      console.info('time' + i);
      let sonPath = randomString(251);
      uri = uri + '/f' + sonPath;
    }
    file.move({
      srcUri: uri,
      dstUri: 'internal://cache/File_Move_007',
      success: function () {
        console.info('File_Move_007 => move success');
        expect(null).assertFail();
      },
      fail: function (data, code) {
        console.info('File_Move_007 => move fail');
        expect(code == 300).assertTrue();
        done();
      },
    });
    fileio.rmdirSync(dpath);
  });

  /**
   * @tc.name   File_Move_008
   * @tc.number SUB_STORAGE_File_Move_0800
   * @tc.desc   Function of API, cache path.The test file is exist.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('File_Move_008', Level.LEVEL0, async function (done) {
    file.writeText({
      uri: 'internal://cache/File_Move_008',
      text: 'sss',
      success: function () {
        console.info('File_Move_008 writeText success ');
        file.move({
          srcUri: 'internal://cache/File_Move_008',
          dstUri: 'internal://app/File_Move_008',
          success: function (uri) {
            console.info('File_Move_008 move pass, uri:' + uri);
            file.delete({
              uri: 'internal://app/File_Move_008',
              success: function () {
                console.info('File_Move_008 delete success');
                done();
              },
              fail: function (data, code) {
                console.info('File_Move_008 delete fail, code: ' + code + ', data: ' + data);
                expect(null).assertFail();
              },
            });
          },
          fail: function (data, code) {
            console.info('File_Move_008 move fail, code: ' + code + ', data: ' + data);
            expect(null).assertFail();
          },
        });
      },
      fail: function (data, code) {
        console.info('File_Move_008 writeText fail, code: ' + code + ', data: ' + data);
        expect(null).assertFail();
      },
    });
  });

  /**
   * @tc.name   File_Move_009
   * @tc.number SUB_STORAGE_File_Move_0900
   * @tc.desc   Function of API, same path.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('File_Move_009', Level.LEVEL0, async function (done) {
    let srcFpath = await fileName('File_Move_009');
    expect(prepareFile(srcFpath, FILE_CONTENT)).assertTrue();
    file.move({
      srcUri: 'internal://app/File_Move_009',
      dstUri: 'internal://app/File_Move_009',
      success: function (data) {
        console.info('File_Move_009 => pass');
        done();
      },
      fail: function (data, code) {
        console.info('File_Move_009 call move fail, code: ' + code + ', data: ' + data);
        expect(null).assertFail();
      },
    });
  });

  /**
   * @tc.name   File_Move_010
   * @tc.number SUB_STORAGE_File_Move_1000
   * @tc.desc   Function of API, dstFpath has same file.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('File_Move_010', Level.LEVEL0, async function (done) {
    let srcFpath = await fileName('File_Move_010');
    let dstFpath = await cacheFileName('File_Move_010');
    expect(prepareFile(srcFpath, 'aaa')).assertTrue();
    expect(prepareFile(dstFpath, 'bbb')).assertTrue();
    file.move({
      srcUri: 'internal://app/File_Move_010',
      dstUri: 'internal://app/cache/File_Move_010',
      success: function (data) {
        console.info('File_Move_010 => pass');
        expect(null).assertFail();
      },
      fail: function (data, code) {
        console.info('File_Move_010 , code: ' + code + ', data: ' + data);
        expect(code == 300).assertTrue();
        done();
      },
    });
  });

  /**
   * @tc.name   File_Move_011
   * @tc.number SUB_STORAGE_File_Move_1100
   * @tc.desc   Function of API, move app path file to cache path.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('File_Move_011', Level.LEVEL0, async function (done) {
    let srcFpath = await fileName('File_Move_011');
    expect(prepareFile(srcFpath, FILE_CONTENT)).assertTrue();
    file.move({
      srcUri: 'internal://cache/../files/File_Move_011',
      dstUri: 'internal://cache/File_Move_011',
      success: function (uri) {
        console.info('File_Move_011 => pass, uri' + uri);
        done();
      },
      fail: function (data, code) {
        console.info('File_Move_011 , code: ' + code + ', data: ' + data);
        expect(null).assertFail();
      },
    });
  });

  /**
   * @tc.name   File_Move_012
   * @tc.number SUB_STORAGE_File_Move_1200
   * @tc.desc   Function of API, out of package, Virtual path(create and give 777 authority).
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('File_Move_012', Level.LEVEL0, async function (done) {
    let srcFpath = await fileName('File_Move_012');
    expect(prepareFile(srcFpath, FILE_CONTENT)).assertTrue();
    file.move({
      srcUri: 'internal://app/../files/File_Move_012',
      dstUri: 'internal://app/notdir/File_Move_012',
      success: function (uri) {
        console.info('File_Move_012 => pass, uri' + uri);
        expect(null).assertFail();
      },
      fail: function (data, code) {
        console.info('File_Move_012 , code: ' + code + ', data: ' + data);
        expect(code == 300).assertTrue();
        done();
      },
    });
  });

  /**
   * @tc.name   File_Move_014
   * @tc.number SUB_STORAGE_File_Move_1400
   * @tc.desc   Function of API, check back value.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('File_Move_014', Level.LEVEL0, async function (done) {
    let srcFpath = await fileName('File_Move_014');
    let dstFpath = await cacheFileName('File_Move_014');
    expect(prepareFile(srcFpath, 'test')).assertTrue();
    let dstUri = 'internal://cache/File_Move_014';
    file.move({
      srcUri: 'internal://cache/../files/File_Move_014',
      dstUri: dstUri,
      success: function (uri) {
        console.info('File_Move_014 move pass');
        done();
      },
      fail: function (data, code) {
        console.info('File_Move_014 => fail , code: ' + code + ', data: ' + data);
        expect(null).assertFail();
      },
      complete: function () {
        console.info('move completed');
      }
    });
  });

  /**
   * @tc.name   File_Copy_001
   * @tc.number SUB_STORAGE_File_Copy_0100
   * @tc.desc   Function of API, copy, app path.The test file is exist.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('File_Copy_001', Level.LEVEL0, async function (done) {
    let srcFpath = await fileName('File_Copy_001');
    let dstFpath = await cacheFileName('File_Copy_001');
    expect(prepareFile(srcFpath, 'test.')).assertTrue();
    file.copy({
      srcUri: 'internal://cache/../files/File_Copy_001',
      dstUri: 'internal://cache/../files/cache/File_Copy_001',
      success: function () {
        console.info('File_Copy_001 call copy success.');
        file.readText({
          uri: 'internal://cache/../files/cache/File_Copy_001',
          success: function (data) {
            console.info('File_Copy_001 read success:' );
            fileio.unlinkSync(srcFpath);
            fileio.unlinkSync(dstFpath);
            done();
          },
          fail: function (data, code) {
            console.info('File_Copy_001 readText fail, code: ' + code + ', data: ' + data);
            expect(null).assertFail();
          },
        });
      },
      fail: function (data, code) {
        console.info('File_Copy_001 copy fail, code: ' + code + ', data: ' + data);
        expect(null).assertFail();
      },
    });
  });

  /**
   * @tc.name   File_Copy_002
   * @tc.number SUB_STORAGE_File_Copy_0200
   * @tc.desc   Function of API, document integrity.The test file is exist.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('File_Copy_002', Level.LEVEL0, async function (done) {
    let typeArray = new Array('.txt', '.ppt', '.flac', '.mp4', '.so', '.zip');
    for (let i = 0; i < typeArray.length; i++) {
      let srcFpath = await fileName('File_Copy_002') + typeArray[i];
      let dstFpath = await cacheFileName('File_Copy_002') + typeArray[i];
      expect(prepareEmptyFile(srcFpath)).assertTrue();
      file.copy({
        srcUri: 'internal://cache/../files/File_Copy_002' + typeArray[i],
        dstUri: 'internal://cache/../files/cache/File_Copy_002' + typeArray[i],
        success: function () {
          console.info('File_Copy_002 call copy success.');
          file.delete('internal://cache/../files/File_Copy_002' + typeArray[i]);
          file.delete('internal://cache/../files/cache/File_Copy_002' + typeArray[i]);
          done();
        },
        fail: function (data, code) {
          console.info('File_Copy_002 , code: ' + code + ', data: ' + data);
          expect(null).assertFail();
        },
      });
    }
  });

  /**
   * @tc.name   File_Copy_003
   * @tc.number SUB_STORAGE_File_Copy_0300
   * @tc.desc   Function of API, different size of files. The test file is exist.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('File_Copy_003', Level.LEVEL0, async function (done) {
    let srcFpath = await fileName('File_Copy_003');
    expect(prepareFile(srcFpath, FILE_CONTENT)).assertTrue();
    let dstFpath = await cacheFileName('File_Copy_003');
    file.copy({
      srcUri: 'internal://cache/../files/File_Copy_003',
      dstUri: 'internal://cache/../files/cache/File_Copy_003',
      success: function () {
        console.info('File_Copy_003 call copy success.');
        file.readText({
          uri: 'internal://cache/../files/cache/File_Copy_003',
          success: function (data) {
            console.info('File_Copy_003 readText success, data.text:');
            fileio.unlinkSync(srcFpath);
            fileio.unlinkSync(dstFpath);
            done();
          },
          fail: function (data, code) {
            console.info('File_Copy_003 readText fail, code: ' + code + ', data: ' + data);
            expect(null).assertFail();
          },
        });
      },
      fail: function (data, code) {
        console.info('File_Copy_003 copy fail, code: ' + code + ', data: ' + data);
        expect(null).assertFail();
      },
    });
  });

  /**
   * @tc.name   File_Copy_004
   * @tc.number SUB_STORAGE_File_Copy_0400
   * @tc.desc   Function of API, error code: 202 The test file is exist.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('File_Copy_004', Level.LEVEL0, async function (done) {
    let srcFpath = await fileName('File_Copy_004');
    expect(prepareFile(srcFpath, FILE_CONTENT)).assertTrue();
    file.copy({
      srcUri: 'internal://app/File_Copy_004',
      dstUri: null,
      success: function () {
        console.info('File_Copy_004 call copy success.');
        expect(null).assertFail();
      },
      fail: function (data, code) {
        console.info('File_Copy_004 , code: ' + code + ', data: ' + data);
        expect(code == 202).assertTrue();
        fileio.unlinkSync(srcFpath);
        done();
      },
    });
  });


  /**
   * @tc.name   File_Copy_005
   * @tc.number File_Copy_005
   * @tc.desc   File_Copy_005
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('File_Copy_005', Level.LEVEL0, async function (done) {
    file.mkdir({
      uri: 'internal://cache/File_Copy_005d',
      success: function () {
        console.info('File_Copy_005 call mkdir success.');
        file.copy({
          srcUri: 'internal://cache/File_Copy_005d',
          dstUri: 'internal://cache/File_Copy_005d_1',
          success: function () {
            console.info('File_Copy_005 call copy success.');
            done();
          },
          fail: function (data, code) {
            console.info('File_Copy_005 , code: ' + code + ', data: ' + data);
            expect(null).assertFail();
          },
        });
      },
      fail: function (data, code) {
        console.error('File_Copy_005 call mkdir fail, code: ' + code + ', data: ' + data);
        expect(null).assertFail();
      },
    });
  });

  /**
   * @tc.name   File_Copy_006
   * @tc.number SUB_STORAGE_File_Copy_0600
   * @tc.desc   Function of API, error code: 301
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('File_Copy_006', Level.LEVEL0, async function (done) {
    file.copy({
      srcUri: 'internal://app/fakepath',
      dstUri: 'internal://app/fakepath1',
      success: function () {
        console.info('File_Copy_006 call copy success.');
        expect(null).assertFail();
      },
      fail: function (data, code) {
        console.info('File_Copy_006 , code: ' + code + ', data: ' + data);
        expect(code == 301).assertTrue();
        done();
      },
    });
  });

  /**
   * @tc.name   File_Copy_007
   * @tc.number SUB_STORAGE_File_Copy_0700
   * @tc.desc   Function of API, uri too long.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('File_Copy_007', Level.LEVEL0, async function (done) {
    let firstPath = randomString(32);
    let dpath = await fileName(firstPath);
    let uri = 'internal://cache/' + firstPath;
    fileio.mkdirSync(dpath);
    for (let i = 0; i < 16; i++) {
      console.info('time' + i);
      let sonPath = randomString(251);
      uri = uri + '/f' + sonPath;
    }
    file.copy({
      srcUri: uri,
      dstUri: uri,
      success: function () {
        console.info('File_Copy_007 => copy success');
        expect(null).assertFail();
      },
      fail: function (data, code) {
        console.info('File_Copy_007 => fail, code: ' + code + ', data: ' + data);
        fileio.rmdirSync(dpath);
        expect(code == 300).assertTrue();
        done();
      },
    });
  });

  /**
   * @tc.name   File_Copy_008
   * @tc.number SUB_STORAGE_File_Copy_0800
   * @tc.desc   Function of API, cache path.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('File_Copy_008', Level.LEVEL0, async function (done) {
    file.writeText({
      uri: 'internal://cache/File_Copy_008',
      text: 'test',
      success: function () {
        console.info('File_Copy_008 mkdir success');
        file.copy({
          srcUri: 'internal://cache/File_Copy_008',
          dstUri: 'internal://cache/../files/File_Copy_008',
          success: function () {
            console.info('File_Copy_008 copy success');
            file.delete({
              uri: 'internal://cache/../files/File_Copy_008',
              success: function () {
                console.info('File_Copy_008 delete success ');
                file.delete({
                  uri: 'internal://cache/File_Copy_008',
                  success: function () {
                    console.info('File_Copy_008 delete success');
                    done();
                  },
                  fail: function (data, code) {
                    console.info('File_Copy_008 cache delete fail, code: ' + code + ', data: ' + data);
                    expect(null).assertFail();
                  },
                });
              },
              fail: function (data, code) {
                console.info('File_Copy_008 files delete fail, code: ' + code + ', data: ' + data);
                expect(null).assertFail();
              },
            });
          },
          fail: function (data, code) {
            console.info('File_Copy_008 copy fail, code: ' + code + ', data: ' + data);
            expect(null).assertFail();
          },
        });
      },
      fail: function (data, code) {
        console.info('File_Copy_008 writeText fail, code: ' + code + ', data: ' + data);
        expect(null).assertFail();
      },
    });
  });

  /**
   * @tc.name   File_Copy_009
   * @tc.number SUB_STORAGE_File_Copy_0900
   * @tc.desc   Function of API, same path.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('File_Copy_009', Level.LEVEL0, async function (done) {
    let srcFpath = await fileName('File_Copy_009');
    expect(prepareFile(srcFpath, FILE_CONTENT)).assertTrue();
    file.copy({
      srcUri: 'internal://app/File_Copy_009',
      dstUri: 'internal://app/File_Copy_009',
      success: function (data) {
        console.info('File_Copy_009 => pass');
        fileio.unlinkSync(srcFpath);
        done();
      },
      fail: function (data, code) {
        console.info('File_Copy_009 , code: ' + code + ', data: ' + data);
        expect(null).assertFail();
      },
    });
  });

  /**
   * @tc.name   File_Copy_010
   * @tc.number SUB_STORAGE_File_Copy_1000
   * @tc.desc   Function of API, dstFpath path has same file.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('File_Copy_010', Level.LEVEL0, async function (done) {
    let srcFpath = await fileName('File_Copy_010');
    let dstFpath = await cacheFileName('File_Copy_010');
    expect(prepareFile(srcFpath, 'aaa')).assertTrue();
    expect(prepareFile(dstFpath, 'bbb')).assertTrue();
    file.copy({
      srcUri: 'internal://app/File_Copy_010',
      dstUri: 'internal://app/cache/File_Copy_010',
      success: function (data) {
        console.info('File_Copy_010 => pass');
        expect(null).assertFail();
      },
      fail: function (data, code) {
        console.info('File_Copy_010 , code: ' + code + ', data: ' + data);
        console.info("code::" + code);
        expect(code == 300).assertTrue();
        fileio.unlinkSync(srcFpath);
        fileio.unlinkSync(dstFpath);
        done();
      },
    });
  });

  /**
   * @tc.name   File_Copy_011
   * @tc.number SUB_STORAGE_File_Copy_1100
   * @tc.desc   Function of API, copy file to cache path.The test file is exist.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('File_Copy_011', Level.LEVEL0, async function (done) {
    let srcFpath = await fileName('File_Copy_011');
    expect(prepareFile(srcFpath, 'test.')).assertTrue();
    file.copy({
      srcUri: 'internal://cache/../files/File_Copy_011',
      dstUri: 'internal://cache/File_Copy_011',
      success: function () {
        console.info('File_Copy_011 copy pass');
        file.readText({
          uri: 'internal://cache/File_Copy_011',
          success: function (data) {
            console.info('File_Copy_011 read success:' );
            done();
          },
          fail: function (data, code) {
            console.info('File_Copy_011 readText fail, code: ' + code + ', data: ' + data);
            expect(null).assertFail();
          },
        });
      },
      fail: function (data, code) {
        console.info('File_Copy_011 copy fail, code: ' + code + ', data: ' + data);
        expect(null).assertFail();
      },
    });
  });

  /**
   * @tc.name   File_Copy_012
   * @tc.number SUB_STORAGE_File_Copy_1200
   * @tc.desc   Function of API, out of package, Virtual path(create and give 777 authority).The test file is exist.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('File_Copy_012', Level.LEVEL0, async function (done) {
    let srcFpath = await fileName('File_Copy_012');
    expect(prepareFile(srcFpath, 'test')).assertTrue();
    file.copy({
      srcUri: 'internal://app/../files/File_Copy_012',
      dstUri: 'internal://app/notdir/File_Move_012',
      success: function () {
        console.info('File_Copy_012 copy pass');
        expect(null).assertFail();
      },
      fail: function (data, code) {
        console.info('File_Copy_012 , code: ' + code + ', data: ' + data);
        expect(code == 300).assertTrue();
        fileio.unlinkSync(srcFpath);
        done();
      },
    });
  });


  /**
   * @tc.name   File_Copy_014
   * @tc.number File_Copy_014
   * @tc.desc   File_Copy_014
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('File_Copy_014', Level.LEVEL0, async function (done) {
    let srcFpath = await fileName('File_Copy_014');
    let dstFpath = await cacheFileName('File_Copy_014');
    expect(prepareFile(srcFpath, 'test')).assertTrue();
    let dstUri = 'internal://cache/File_Copy_014';
    file.copy({
      srcUri: 'internal://cache/../files/File_Copy_014',
      dstUri: dstUri,
      success: function (uri) {
        console.info('File_Copy_014 copy pass');
        done();
      },
      fail: function (data, code) {
        console.info('File_Copy_014 => fail , code: ' + code + ', data: ' + data);
        expect(null).assertFail();
      },
      complete: function () {
        console.info('copy completed');
      }
    });
  });

  /**
   * @tc.name   File_List_001
   * @tc.number SUB_STORAGE_File_List_0100
   * @tc.desc   Function of API, list.The test file and dir are exist.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('File_List_001', Level.LEVEL0, async function (done) {
    let dpath = await fileName('File_List_001') + 'd';
    let fpath = dpath + '/File_List_001';
    let ddpath = dpath + '/File_List_001_1d';
    fileio.mkdirSync(dpath);
    fileio.mkdirSync(ddpath);
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
    file.list({
      uri: 'internal://cache/../files/File_List_001d',
      success: function (data) {
        console.info('File_List_001 call list success.' + JSON.stringify(data.fileList));
        fileio.unlinkSync(fpath);
        fileio.rmdirSync(ddpath);
        fileio.rmdirSync(dpath);
        done();
      },
      fail: function (data, code) {
        console.info('File_List_001 , code: ' + code + ', data: ' + data);
        expect(null).assertFail();
      },
    });
  });

  /**
   * @tc.name   File_List_002
   * @tc.number SUB_STORAGE_File_List_0200
   * @tc.desc   Function of API, set value of uri.The test file and dir are exist.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('File_List_002', Level.LEVEL0, async function (done) {
    let dpath = await fileName('File_List_002') + 'd';
    let fpath = dpath + '/File_List_002';
    let ddpath = dpath + '/File_List_002_1d';
    fileio.mkdirSync(dpath);
    fileio.mkdirSync(ddpath);
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
    file.list({
      uri: 'internal://cache/../files/File_List_002d',
      success: function (data) {
        console.info('File_List_002 call list success.' + JSON.stringify(data.fileList));
        fileio.unlinkSync(fpath);
        fileio.rmdirSync(ddpath);
        fileio.rmdirSync(dpath);
        done();
      },
      fail: function (data, code) {
        console.info('File_List_002 , code: ' + code + ', data: ' + data);
        expect(null).assertFail();
      },
    });
  });

  /**
   * @tc.name   File_List_003
   * @tc.number SUB_STORAGE_File_List_0300
   * @tc.desc   Function of API, check lastModifiedTime.The test file and dir are exist.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('File_List_003', Level.LEVEL0, async function (done) {
    let dpath = await fileName('File_List_003') + 'd';
    let fpath = dpath + '/File_List_003';
    let ddpath = dpath + '/File_List_003_1d';
    fileio.mkdirSync(dpath);
    fileio.mkdirSync(ddpath);
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
    file.list({
      uri: 'internal://cache/../files/File_List_003d',
      success: function (data) {
        console.info('File_List_003 call list success.' + JSON.stringify(data.fileList));
        done();
      },
      fail: function (data, code) {
        console.info('File_List_003 , code: ' + code + ', data: ' + data);
        expect(null).assertFail();
      },
    });
    file.writeText({
      uri: 'internal://cache/../files/File_List_003d/File_List_003',
      text: '1',
      success: function (data) {
        console.info('File_List_003 call write success.');
        done();
      },
      fail: function (data, code) {
        console.info('File_List_003 , code: ' + code + ', data: ' + data);
        expect(null).assertFail();
      },
    });
    file.list({
      uri: 'internal://cache/../files/File_List_003d',
      success: function (data) {
        console.info('File_List_003 call list success.' + JSON.stringify(data.fileList));
        fileio.unlinkSync(fpath);
        fileio.rmdirSync(ddpath);
        fileio.rmdirSync(dpath);
        done();
      },
      fail: function (data, code) {
        console.info('File_List_003 , code: ' + code + ', data: ' + data);
        expect(null).assertFail();
      },
    });
  });

  /**
   * @tc.name   File_List_004
   * @tc.number SUB_STORAGE_File_List_0400
   * @tc.desc   Function of API, check length.The test file and dir are exist.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('File_List_004', Level.LEVEL0, async function (done) {
    let dpath = await fileName('File_List_004') + 'd';
    let fpath = dpath + '/File_List_004';
    let ddpath = dpath + '/File_List_004_1d';
    fileio.mkdirSync(dpath);
    fileio.mkdirSync(ddpath);
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
    file.list({
      uri: 'internal://cache/../files/File_List_004d',
      success: function (data) {
        console.info('File_List_004 call list success.');
        done();
      },
      fail: function (data, code) {
        console.info('File_List_004 , code: ' + code + ', data: ' + data);
        expect(null).assertFail();
      },
    });
  });

  /**
   * @tc.name   File_List_005
   * @tc.number SUB_STORAGE_File_List_0500
   * @tc.desc   Function of API, check type.The test file and dir are exist.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('File_List_005', Level.LEVEL0, async function (done) {
    let dpath = await fileName('File_List_005') + 'd';
    let fpath = dpath + '/File_List_005';
    let ddpath = dpath + '/File_List_005_1d';
    fileio.mkdirSync(dpath);
    fileio.mkdirSync(ddpath);
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
    file.list({
      uri: 'internal://cache/../files/File_List_005d',
      success: function (data) {
        console.info('File_List_005 call list success.');
        done();
      },
      fail: function (data, code) {
        console.info('File_List_005 , code: ' + code + ', data: ' + data);
        expect(null).assertFail();
      },
    });
  });

  /**
   * @tc.name   File_List_006
   * @tc.number SUB_STORAGE_File_List_0600
   * @tc.desc   Function of API, error code:202
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('File_List_006', Level.LEVEL0, async function (done) {
    let dpath = await fileName('File_List_006') + 'd'
    file.list({
      uri: dpath,
      success: function (data) {
        console.info('File_List_006 call list success.' + data.fileList);
        expect(null).assertFail();
      },
      fail: function (data, code) {
        console.info('File_List_006 , code: ' + code + ', data: ' + data);
        expect(code == 202).assertTrue();
        done();
      },
    });
  });

  /**
   * @tc.name   File_List_007
   * @tc.number SUB_STORAGE_File_List_0700
   * @tc.desc   Function of API, uri set value of file.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('File_List_007', Level.LEVEL0, async function (done) {
    let fpath = await fileName('File_List_007');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
    file.list({
      uri: 'internal://cache/../files/File_List_007',
      success: function (data) {
        console.info('File_List_007 pass, data.fileList:' + JSON.stringify(data.fileList));
        fileio.unlinkSync(fpath);
        done();
      },
      fail: function (data, code) {
        console.info('File_List_007 , code: ' + code + ', data: ' + data);
        expect(null).assertFail();
      },
    });
  });

  /**
   * @tc.name   File_List_008
   * @tc.number SUB_STORAGE_File_List_0800
   * @tc.desc   Function of API, error code: 301
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('File_List_008', Level.LEVEL0, async function (done) {
    file.list({
      uri: 'internal://app/fakepath',
      success: function (data) {
        console.info('File_List_008 call list success.' + JSON.stringify(data.fileList));
        expect(null).assertFail();
      },
      fail: function (data, code) {
        console.info('File_List_008 , code: ' + code + ', data: ' + data);
        expect(code == 301).assertTrue();
        done();
      },
    });
  });

  /**
   * @tc.name   File_List_009
   * @tc.number SUB_STORAGE_File_List_0900
   * @tc.desc   Function of API, uri too long.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('File_List_009', Level.LEVEL0, async function (done) {
    let firstPath = randomString(32);
    let dpath = await fileName(firstPath);
    let uri = 'internal://app/' + firstPath;
    fileio.mkdirSync(dpath);
    for (let i = 0; i < 16; i++) {
      console.info('time' + i);
      let sonPath = randomString(251);
      uri = uri + '/f' + sonPath;
    }
    file.list({
      uri: uri,
      success: function (data) {
        console.info('File_List_009 => pass' + data);
        expect(null).assertFail();
      },
      fail: function (data, code) {
        console.info('File_List_009 , code: ' + code + ', data: ' + data);
        expect(code == 300).assertTrue();
        fileio.rmdirSync(dpath);
        done();
      },
    });
  });

  /**
   * @tc.name   File_List_010
   * @tc.number SUB_STORAGE_File_List_1000
   * @tc.desc   Function of API, cache path.The test file and dir are exist.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('File_List_010', Level.LEVEL0, async function (done) {
    let dpath = await nextFileName('File_List_010d');
    let fpath = dpath + '/File_List_010';
    let ffpath = dpath + '/File_List_010_1';
    let ddpath = dpath + '/File_List_010_1d';
    let fffpath = ddpath + '/File_List_010_2';
    try {
      fileio.mkdirSync(dpath);
      fileio.mkdirSync(ddpath);
      expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
      expect(prepareFile(ffpath, FILE_CONTENT)).assertTrue();
      expect(prepareFile(fffpath, FILE_CONTENT)).assertTrue();
    }
    catch (e) {
      console.info('File_List_010 has failed for ' + e);
      expect(null).assertFail();
    }
    file.list({
      uri: 'internal://cache/File_List_010d',
      success: function (data) {
        console.info('File_List_010 => pass' + JSON.stringify(data.fileList));
        fileio.unlinkSync(fpath);
        fileio.unlinkSync(ffpath);
        fileio.unlinkSync(fffpath);
        fileio.rmdirSync(ddpath);
        fileio.rmdirSync(dpath);
        done();
      },
      fail: function (data, code) {
        console.info('File_List_010 fail, code: ' + code + ', data: ' + data);
        expect(null).assertFail();
      },
    });
  });

  /**
   * @tc.name   File_List_011
   * @tc.number SUB_STORAGE_File_List_1100
   * @tc.desc   Function of API, virtual path.The test dir are exist.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('File_List_011', Level.LEVEL0, async function (done) {
    let dpath = await fileName('File_List_011') + 'd';
    let fpath = dpath + '/File_List_011';
    let ddpath = dpath + '/File_List_011_1d';
    fileio.mkdirSync(dpath);
    fileio.mkdirSync(ddpath);
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
    file.list({
      uri: 'internal://cache/../files/File_List_011d',
      success: function (data) {
        console.info('File_List_011 call list success.' + JSON.stringify(data.fileList));
        fileio.unlinkSync(fpath);
        fileio.rmdirSync(ddpath);
        fileio.rmdirSync(dpath);
        done();
      },
      fail: function (data, code) {
        console.info('File_List_011 fail, code: ' + code + ', data: ' + data);
        expect(null).assertFail();
      },
    });
  });

  /**
   * @tc.name   File_List_012
   * @tc.number SUB_STORAGE_File_List_1200
   * @tc.desc   The test dir are exist.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('File_List_012', Level.LEVEL0, async function (done) {
    file.list({
      uri: 'internal://cache/../files/../../',
      success: function (data) {
        console.info('File_List_012 call list success.' + JSON.stringify(data.fileList));
        done();
      },
      fail: function (data, code) {
        console.info('File_List_012 fail, code: ' + code + ', data: ' + data);
        expect(null).assertFail();
      },
      complete: function () {
        console.info('list completed');
      }
    });
  });

  /**
   * @tc.name   File_Get_001
   * @tc.number SUB_STORAGE_File_Get_0100
   * @tc.desc   Function of API, Get.The test file is exist.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('File_Get_001', Level.LEVEL0, async function (done) {
    let fpath = await fileName('File_Get_001');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
    file.get({
      uri: 'internal://cache/../files/File_Get_001',
      recursive: true,
      success: function (data) {
        console.info('File_Get_001 pass,data.uri：' );
        fileio.unlinkSync(fpath);
        done();
      },
      fail: function (data, code) {
        console.info('File_Get_001 fail, code: ' + code + ', data: ' + data);
        expect(null).assertFail();
      },
    });
  });

  /**
   * @tc.name   File_Get_002
   * @tc.number SUB_STORAGE_File_Get_0200
   * @tc.desc   Function of API, recursive = false.The test file is exist.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('File_Get_002', Level.LEVEL0, async function (done) {
    let fpath = await fileName('File_Get_002');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
    file.get({
      uri: 'internal://cache/../files/File_Get_002',
      recursive: false,
      success: function (data) {
        console.info('File_Get_002 => file list：');
        console.info('{uri:' );
        console.info('length:' + data.length);
        console.info('lastModifiedTime:' + data.lastModifiedTime);
        console.info('type:' + data.type);
        console.info('subFiles:' + data.subFiles + '}');
        fileio.unlinkSync(fpath);
        done();
      },
      fail: function (data, code) {
        console.info('File_Get_002 fail, code: ' + code + ', data: ' + data);
        expect(null).assertFail();
      },
    });
  });

  /**
   * @tc.name   File_Get_003
   * @tc.number SUB_STORAGE_File_Get_0300
   * @tc.desc   Function of API, not input recursive.The test file is exist.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('File_Get_003', Level.LEVEL0, async function (done) {
    let fpath = await fileName('File_Get_003');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
    file.get({
      uri: 'internal://cache/../files/File_Get_003',
      success: function (data) {
        console.info('File_Get_003 => file list：');
        console.info('{uri:' );
        console.info('length:' + data.length);
        console.info('lastModifiedTime:' + data.lastModifiedTime);
        console.info('type:' + data.type);
        console.info('subFiles:' + data.subFiles + '}');
        console.info('File_Get_003 => pass');
        fileio.unlinkSync(fpath);
        done();
      },
      fail: function (data, code) {
        console.info('File_Get_003 fail, code: ' + code + ', data: ' + data);
        expect(null).assertFail();
      },
    });
  });

  /**
   * @tc.name   File_Get_004
   * @tc.number SUB_STORAGE_File_Get_0400
   * @tc.desc   Function of API, recursive = ture.The test file is exist.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('File_Get_004', Level.LEVEL0, async function (done) {
    let dpath = await fileName('File_Get_004d');
    let ddpath = dpath + '/File_Get_004dd'
    let fpath = dpath + '/File_Get_004f'
    let ffpath = ddpath + '/File_Get_004ff'
    fileio.mkdirSync(dpath);
    fileio.mkdirSync(ddpath);
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
    expect(prepareFile(ffpath, FILE_CONTENT)).assertTrue();
    file.get({
      uri: 'internal://cache/../files/File_Get_004d',
      recursive: true,
      success: function (data) {
        console.info('File_Get_004 => file list：');
        console.info('{uri:' );
        console.info('length:' + data.length);
        console.info('lastModifiedTime:' + data.lastModifiedTime);
        console.info('type:' + data.type);
        console.info('subFiles:' + data.subFiles + '}');
        console.info('File_Get_004 => pass');
        fileio.unlinkSync(ffpath);
        fileio.unlinkSync(fpath);
        fileio.rmdirSync(ddpath);
        fileio.rmdirSync(dpath);
        done();
      },
      fail: function (data, code) {
        console.info('File_Get_004 fail, code: ' + code + ', data: ' + data);
        expect(null).assertFail();
      },
    });
  });

  /**
   * @tc.name   File_Get_005
   * @tc.number SUB_STORAGE_File_Get_0500
   * @tc.desc   Function of API, recursive = false.The test file is exist.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('File_Get_005', Level.LEVEL0, async function (done) {
    let dpath = await fileName('File_Get_005d');
    let ddpath = dpath + '/File_Get_005dd';
    let fpath = dpath + '/File_Get_005f';
    let ffpath = ddpath + '/File_Get_005ff';
    fileio.mkdirSync(dpath);
    fileio.mkdirSync(ddpath);
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
    expect(prepareFile(ffpath, FILE_CONTENT)).assertTrue();
    file.get({
      uri: 'internal://cache/../files/File_Get_005d',
      recursive: false,
      success: function (data) {
        console.info('File_Get_005 => file list ：');
        console.info('{uri:' );
        console.info('length:' + data.length);
        console.info('lastModifiedTime:' + data.lastModifiedTime);
        console.info('type:' + data.type);
        console.info('subFiles:' + data.subFiles + '}');
        console.info('File_Get_005 => pass');
        fileio.unlinkSync(ffpath);
        fileio.unlinkSync(fpath);
        fileio.rmdirSync(ddpath);
        fileio.rmdirSync(dpath);
        done();
      },
      fail: function (data, code) {
        console.info('File_Get_005 fail, code: ' + code + ', data: ' + data);
        expect(null).assertFail();
      },
    });
  });

  /**
   * @tc.name   File_Get_006
   * @tc.number SUB_STORAGE_File_Get_0600
   * @tc.desc   Function of API, not input recursive.The test file is exist.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('File_Get_006', Level.LEVEL0, async function (done) {
    let dpath = await fileName('File_Get_006d');
    let ddpath = dpath + '/File_Get_006dd';
    let fpath = dpath + '/File_Get_006f';
    let ffpath = ddpath + '/File_Get_006ff';
    fileio.mkdirSync(dpath);
    fileio.mkdirSync(ddpath);
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
    expect(prepareFile(ffpath, FILE_CONTENT)).assertTrue();
    file.get({
      uri: 'internal://cache/../files/File_Get_006d',
      success: function (data) {
        console.info('File_Get_006 file list：');
        console.info('{uri:' );
        console.info('length:' + data.length);
        console.info('lastModifiedTime:' + data.lastModifiedTime);
        console.info('type:' + data.type);
        console.info('subFiles:' + data.subFiles + '}');
        console.info('File_Get_006 => pass');
        fileio.unlinkSync(ffpath);
        fileio.unlinkSync(fpath);
        fileio.rmdirSync(ddpath);
        fileio.rmdirSync(dpath);
        done();
      },
      fail: function (data, code) {
        console.info('File_Get_006 fail, code: ' + code + ', data: ' + data);
        expect(null).assertFail();
      },
    });
  });

  /**
   * @tc.name   File_Get_007
   * @tc.number SUB_STORAGE_File_Get_0700
   * @tc.desc   Function of API, not input uri.The test file is exist.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('File_Get_007', Level.LEVEL0, async function (done) {
    file.get({
      recursive: true,
      success: function (data) {
        console.info('File_Get_007 call Copy success.');
        expect(null).assertFail();
      },
      fail: function (data, code) {
        console.info('File_Get_007 fail, code: ' + code + ', data: ' + data);
        expect(code == 202).assertTrue();
        done();
      },
    });
  });

  /**
   * @tc.name   File_Get_008
   * @tc.number SUB_STORAGE_File_Get_0800
   * @tc.desc   Function of API, not input parameter.The test file is exist.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('File_Get_008', Level.LEVEL0, async function (done) {
    file.get({
      success: function (data) {
        console.info(data);
        expect(null).assertFail();
      },
      fail: function (data, code) {
        console.info('File_Get_008 fail, code: ' + code + ', data: ' + data);
        expect(code == 202).assertTrue();
        done();
      },
    });
  });

  /**
   * @tc.name   File_Get_009
   * @tc.number SUB_STORAGE_File_Get_0900
   * @tc.desc   Function of API, error parameter.The test file and dir are not exist.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('File_Get_009', Level.LEVEL0, async function (done) {
    file.get({
      uri: 'internal://app/File_Get_009',
      success: function (data) {
        console.info('File_Get_009 call Copy success.');
        expect(null).assertFail();
      },
      fail: function (data, code) {
        console.info('File_Get_009 fail, code: ' + code + ', data: ' + data);
        expect(code == 301).assertTrue();
        done();
      },
    });
  });

  /**
   * @tc.name   File_Get_010
   * @tc.number SUB_STORAGE_File_Get_1000
   * @tc.desc   Function of API, uri = -1.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('File_Get_010', Level.LEVEL0, async function (done) {
    file.get({
      uri: -1,
      success: function (data) {
        console.info('File_Get_010 call Copy success.');
        expect(null).assertFail();
      },
      fail: function (data, code) {
        console.info('File_Get_010 fail, code: ' + code + ', data: ' + data);
        expect(code == 202).assertTrue();
        done();
      },
    });
  });

  /**
   * @tc.name   File_Get_011
   * @tc.number SUB_STORAGE_File_Get_1100
   * @tc.desc   Function of API, cacahe path.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('File_Get_011', Level.LEVEL0, async function (done) {
    file.writeText({
      uri: 'internal://cache/File_Get_011',
      text: 'test',
      success: function () {
        console.info('File_Get_011 writeText success');
        file.get({
          uri: 'internal://cache/File_Get_011',
          recursive: true,
          success: function (data) {
            console.info('file list');
            console.info('uri:' );
            console.info('length:' + data.length);
            console.info('lastModifiedTime:' + data.lastModifiedTime);
            console.info('type:' + data.type);
            console.info('subFiles:' + data.subFiles);
            file.delete({
              uri: 'internal://cache/File_Get_011',
              success: function () {
                console.info('File_Get_011 delete success');
                done();
              },
              fail: function (data, code) {
                console.info('File_Get_011 delete fail, code: ' + code + ', data: ' + data);
                expect(null).assertFail();
              },
            });
          },
          fail: function (data, code) {
            console.info('File_Get_011 get fail, code: ' + code + ', data: ' + data);
            expect(null).assertFail();
          },
        });
      },
      fail: function (data, code) {
        console.info('File_Get_011 writeText fail, code: ' + code + ', data: ' + data);
        expect(null).assertFail();
      },
    });
  });

  /**
   * @tc.name   File_Get_012
   * @tc.number SUB_STORAGE_File_Get_1200
   * @tc.desc   Function of API, uri too long.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('File_Get_012', Level.LEVEL0, async function (done) {
    let firstPath = randomString(32);
    let dpath = await fileName(firstPath);
    let uri = 'internal://cache/' + firstPath;
    fileio.mkdirSync(dpath);
    for (let i = 0; i < 16; i++) {
      console.info('time' + i);
      let sonPath = randomString(251);
      uri = uri + '/f' + sonPath;
    }
    file.get({
      uri: uri,
      recursive: true,
      success: function (data) {
        console.info('file list');
        console.info('uri:' );
        console.info('length:' + data.length);
        console.info('lastModifiedTime:' + data.lastModifiedTime);
        console.info('type:' + data.type);
        console.info('subFiles:' + data.subFiles);
        console.info('File_Get_012 => pass');
        expect(null).assertFail();
      },
      fail: function (data, code) {
        console.info('File_Get_012 fail, code: ' + code + ', data: ' + data);
        expect(code == 300).assertTrue();
        done();
      },
    });
  });

  /**
   * @tc.name   File_Get_013
   * @tc.number SUB_STORAGE_File_Get_1300
   * @tc.desc   Function of API, virtual path.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('File_Get_013', Level.LEVEL0, async function (done) {
    let dpath = await fileName('File_Get_013d');
    let ddpath = dpath + '/File_Get_013dd';
    let fpath = dpath + '/File_Get_013f';
    let ffpath = ddpath + '/File_Get_013ff';
    fileio.mkdirSync(dpath);
    fileio.mkdirSync(ddpath);
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
    expect(prepareFile(ffpath, FILE_CONTENT)).assertTrue();
    file.get({
      uri: 'internal://cache/../files/../files/File_Get_013d',
      recursive: true,
      success: function (data) {
        console.info('File_Get_013 => file list：');
        console.info('{uri:' );
        console.info('length:' + data.length);
        console.info('lastModifiedTime:' + data.lastModifiedTime);
        console.info('type:' + data.type);
        console.info('subFiles:' + data.subFiles + '}');
        console.info('File_Get_013 => pass');
        fileio.unlinkSync(ffpath);
        fileio.unlinkSync(fpath);
        fileio.rmdirSync(ddpath);
        fileio.rmdirSync(dpath);
        done();
      },
      fail: function (data, code) {
        console.info('File_Get_013 fail, code: ' + code + ', data: ' + data);
        expect(null).assertFail();
      },
    });
  });

  /**
   * @tc.name   File_Get_014
   * @tc.number SUB_STORAGE_File_Get_1400
   * @tc.desc   Function of API, out of package, Virtual path, save the dir authority.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('File_Get_014', Level.LEVEL0, async function (done) {
    file.get({
      uri: 'internal://cache/../files/../../',
      success: function (data) {
        console.info('File_Get_014 => file list ：');
        console.info('{uri:' );
        console.info('length:' + data.length);
        console.info('lastModifiedTime:' + data.lastModifiedTime);
        console.info('type:' + data.type);
        console.info('subFiles:' + data.subFiles + '}');
        console.info('File_Get_014 => pass');
        done();
      },
      fail: function (data, code) {
        console.info('File_Get_014 fail, code: ' + code + ', data: ' + data);
        expect(null).assertFail();
      },
      complete: function () {
        console.info('get completed');
      }
    });
  });
   /**
    * @tc.name   File_Document_Choose_001
    * @tc.number SUB_STORAGE_Document_Choose_0100
    * @tc.desc   Function of API, choose file.The test file is exist.
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL0
    */
   it('File_Document_Choose_001', Level.LEVEL0, async function (done) {
    try {
      let types = [];
      let code = await document.choose(types);
      let str = 'Error';
      console.info("getFileUri===>" + code);
      expect(str).assertTrue();
      done();
    } 
    catch (e) {
      console.info('File_Document_Choose_001 has failed for ' + e.message);
      expect(e.message == "error").assertTrue();
      done();
    }
  });

   /**
    * @tc.name   File_Document_Choose_002
    * @tc.number SUB_STORAGE_Document_Choose_0200
    * @tc.desc   Function of API, choose file.The test file is  exist.
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL0
    */
   it('File_Document_Choose_002', Level.LEVEL0, async function (done) {
    try {
      let uri = "";
      let code = await document.choose(function(err,uri){

      });
      console.info("getFileUri===>" + code);
      expect(uri).assertTrue();
      done();
    } 
    catch (e) {
      console.info('File_Document_Choose_002 has failed for ' + e.message);
      expect(e.message == "error").assertTrue();
      done();
    }
  });

   /**
    * @tc.name   File_Document_Choose_003
    * @tc.number SUB_STORAGE_Document_Choose_0300
    * @tc.desc   Function of API, choose file.The test file is exist.
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL0
    */
   it('File_Document_Choose_003', Level.LEVEL0, async function (done) {
    try {
      let types = [];
      let uri = "";
      let code = await document.choose(types,function(err,uri){

      });
      console.info("getFileUri===>" + code);
      expect().assertTrue();
      done();
    } 
    catch (e) {
      console.info('File_Document_Choose_003 has failed for ' + e.message);
      expect(e.message == "error").assertTrue();
      done();
    }
  });

  /**
   * @tc.name   File_Document_Choose_001
   * @tc.number SUB_STORAGE_Document_Choose_0400
   * @tc.desc   Function of API, choose file.The test file is exist.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('File_Document_Choose_001', Level.LEVEL0, async function (done) {
    try {
      let code = await document.choose();
      let str = 'Error';
      console.info("getFileUri===>" + code);
      expect(str).assertTrue();
      done();
    } 
    catch (e) {
      console.info('File_Document_Choose_001 has failed for ' + e.message);
      expect(e.message == "error").assertTrue();
      done();
    }
  });

   /**
    * @tc.name   File_Document_Show_001
    * @tc.number SUB_STORAGE_Document_Show_0100
    * @tc.desc   Function of API, show file.The test file is exist.
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL0
    */
   it('File_Document_Show_001', Level.LEVEL0, async function (done) {
    try {
      let type = "";
      let uri = "";
      let code = await document.show(uri,type);
      console.info("getFileUri===>" + code);
      expect().assertTrue();
      done();
    } 
    catch (e) {
      console.info('File_Document_Show_001 has failed for ' + e.message);
      expect(e.message == "error").assertTrue();
      done();
    }
  });

   /**
    * @tc.name   File_Document_Show_002
    * @tc.number SUB_STORAGE_Document_Show_0200
    * @tc.desc   Function of API, show file.The test file is exist.
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL0
    */
   it('File_Document_Show_002', Level.LEVEL0, async function (done) {
    try {
      let type = "";
      let uri ="";
      let code = await document.show(uri,type,function(err){

      });
      console.info("getFileUri===>" + code);
      expect().assertTrue();
      done();
    } 
    catch (e) {
      console.info('File_Document_Show_002 has failed for ' + e.message);
      expect(e.message == "error").assertTrue();
      done();
    }
  });
});
}
