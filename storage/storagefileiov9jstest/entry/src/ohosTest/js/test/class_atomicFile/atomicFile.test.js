/*
 * Copyright (C) 2024 Huawei Device Co., Ltd.
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
	fileIO, FILE_CONTENT, prepareFile, nextFileName, describe, it, expect, sleep,
  } from '../Common';

  import util from '@ohos.util';
  import featureAbility from '@ohos.ability.featureAbility';
  import buffer from '@ohos.buffer';
  import { TestType, Size, Level } from '@ohos/hypium';
  
  const WAIT_ONE_SECOND = 1000;
  
  export default function atomicFileTest() {
  describe('fileIO_fs_atomicFile_test', function () {
  
	/**
	 * @tc.number SUB_DF_ATOMIC_FILE_0000
	 * @tc.name fileIO_test_atomicFile_000
	 * @tc.desc Test the startWrite() interface of class AtomicFile
	 * Create a file when file path is "", throw exception
	 * @tc.size MEDIUM
	 * @tc.type Functoin
	 * @tc.level Level 0
	 * @tc.require
	 */
	it('fileIO_test_atomicFile_000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function () {
	  try {
		let file1 = new fileIO.AtomicFile("");
		let ws1 = file1.startWrite();
	  } catch (e) {
		expect(e.message === "No such file or directory").assertTrue();
	  }
	});
  
	/**
	 * @tc.number SUB_DF_ATOMIC_FILE_0100
	 * @tc.name fileIO_test_atomicFile_001
	 * @tc.desc Test the startWrite() interface of class AtomicFile
	 * Create a file when file is exist, overwrite original file
	 * @tc.size MEDIUM
	 * @tc.type Functoin
	 * @tc.level Level 0
	 * @tc.require
	 */
	it('fileIO_test_atomicFile_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function () {
	  let fpath = await nextFileName('test1');
	  expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
  
	  try{
		let file = new fileIO.AtomicFile(fpath);
		let ws = file.startWrite();
		file.finishWrite();
		let stat = fileIO.statSync(fpath);
		expect(stat.size == 0).assertTrue();
	  } catch (e) {
		console.log('fileIO_test_atomicFile_001 has failed for ' + e.message);
		expect(false).assertTrue();
	  }
	});
  
	/**
	 * @tc.number SUB_DF_ATOMIC_FILE_0200
	 * @tc.name fileIO_test_atomicFile_002
	 * @tc.desc Test the startWrite() interface of class AtomicFile
	 * Create a file when file is not exist, create a new file
	 * @tc.size MEDIUM
	 * @tc.type Functoin
	 * @tc.level Level 0
	 * @tc.require
	 */
	it('fileIO_test_atomicFile_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function () {
	  let filesDir = await featureAbility.getContext().getCacheDir();
	  let fpath = filesDir + '/test2.txt';
  
	  try {
		let file = new fileIO.AtomicFile(fpath);
		let ws = file.startWrite();
		ws.write("fileIO_test_atomicFile_002");
		await sleep(WAIT_ONE_SECOND);
		file.finishWrite();
  
		let data = file.readFully();
		let decoder = util.TextDecoder.create('utf-8');
		let str = decoder.decodeToString(new Uint8Array(data));
		expect(str === "fileIO_test_atomicFile_002").assertTrue();
	  } catch(e) {
		console.log('fileIO_test_atomicFile_002 has failed for ' + e.message);
		expect(false).assertTrue();
	  }
	});
  
	/**
	 * @tc.number SUB_DF_ATOMIC_FILE_0300
	 * @tc.name fileIO_test_atomicFile_003
	 * @tc.desc Test the startWrite() interface of class AtomicFile
	 * Create a file when path is not exist, create a new file
	 * @tc.size MEDIUM
	 * @tc.type Functoin
	 * @tc.level Level 0
	 * @tc.require
	 */
	it('fileIO_test_atomicFile_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function () {
	  let filesDir = await featureAbility.getContext().getCacheDir();
	  let fpath = filesDir + '/test3/test3.txt';
  
	  try {
		let file = new fileIO.AtomicFile(fpath);
		let ws = file.startWrite();
	  } catch (e) {
		expect(e.message === "No such file or directory").assertTrue();
	  }
	});
  
	/**
	 * @tc.number SUB_DF_ATOMIC_FILE_0400
	 * @tc.name fileIO_test_atomicFile_004
	 * @tc.desc Test the readFully() interface of class AtomicFile
	 * Open an existing file, read content
	 * @tc.size MEDIUM
	 * @tc.type Functoin
	 * @tc.level Level 0
	 * @tc.require
	 */
	it('fileIO_test_atomicFile_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function () {
	  let fpath = await nextFileName('test4');
	  expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
  
	  try {
		let file = new fileIO.AtomicFile(fpath);
		let data = file.readFully();
		expect(data !== null).assertTrue();
		let decoder = util.TextDecoder.create('utf-8');
		let str = decoder.decodeToString(new Uint8Array(data));
		expect(str === FILE_CONTENT).assertTrue();
	  } catch(e) {
		console.log('fileIO_test_atomicFile_004 has failed for ' + e.message);
		expect(false).assertTrue();
	  }
	});
  
	/**
	 * @tc.number SUB_DF_ATOMIC_FILE_0500
	 * @tc.name fileIO_test_atomicFile_005
	 * @tc.desc Test the openRead() interface of class AtomicFile
	 * Open an existing file, create readStream read content
	 * @tc.size MEDIUM
	 * @tc.type Functoin
	 * @tc.level Level 0
	 * @tc.require
	 */
	it('fileIO_test_atomicFile_005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function () {
	  let fpath = await nextFileName('test5');
	  expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
  
	  try {
		let file = new fileIO.AtomicFile(fpath);
		let readStream = file.openRead();
		readStream.on('readable', () => {
		  let data = readStream.read();
		  if (data == null) {
			return;
		  }
		  expect(data === FILE_CONTENT).assertTrue();
		});
	  } catch (e) {
		console.log('fileIO_test_atomicFile_005 has failed for ' + e.message);
		expect(false).assertTrue();
	  }
	});
  
	/**
	 * @tc.number SUB_DF_ATOMIC_FILE_0600
	 * @tc.name fileIO_test_atomicFile_006
	 * @tc.desc Test the failedWrite() interface of class AtomicFile
	 * Open an existing file, create writeStream write content, call failedWrite will preserve source file
	 * @tc.size MEDIUM
	 * @tc.type Functoin
	 * @tc.level Level 0
	 * @tc.require
	 */
	it('fileIO_test_atomicFile_006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function () {
	  console.log('fileIO_test_atomicFile_006 begin');
	  let fpath = await nextFileName('test6');
	  expect(prepareFile(fpath, "fileIO_test_atomicFile_006")).assertTrue();
  
	  try {
		let file = new fileIO.AtomicFile(fpath);
		let ws = file.startWrite();
		ws.write("hello world");
		await sleep(WAIT_ONE_SECOND)
		file.failWrite();
  
		let data = file.readFully();
		let decoder = util.TextDecoder.create('utf-8');
		let str = decoder.decodeToString(new Uint8Array(data));
		expect(str === "fileIO_test_atomicFile_006").assertTrue();
	  } catch(e) {
		console.log('fileIO_test_atomicFile_006 has failed for ' + e.message);
		expect(false).assertTrue();
	  }
	});
  
	/**
	 * @tc.number SUB_DF_ATOMIC_FILE_0700
	 * @tc.name fileIO_test_atomicFile_007
	 * @tc.desc Test the function interface of class AtomicFile
	 * readFully() read one file, startWrite() create a new file, write() write content, finishWrite() close file
	 * @tc.size MEDIUM
	 * @tc.type Functoin
	 * @tc.level Level 0
	 * @tc.require
	 */
	it('fileIO_test_atomicFile_007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function () {
	  let fpath = await nextFileName('test7');
	  expect(prepareFile(fpath, "fileIO_test_atomicFile_007")).assertTrue();
  
	  try {
		let rFile = new fileIO.AtomicFile(fpath);
		let readData = rFile.readFully();
		let rDecoder = util.TextDecoder.create('utf-8');
		let readStr = rDecoder.decodeToString(new Uint8Array(readData));
		expect(readStr === "fileIO_test_atomicFile_007").assertTrue();
  
		let filesDir = await featureAbility.getContext().getCacheDir();
		let wPath = filesDir + '/test7_write.txt';
		let wFile = new fileIO.AtomicFile(wPath);
		let ws = wFile.startWrite();
		ws.write(readStr);
		await sleep(WAIT_ONE_SECOND);
		wFile.finishWrite();
  
		let writeData = wFile.readFully();
		let wDecoder = util.TextDecoder.create('utf-8');
		let writeStr = wDecoder.decodeToString(new Uint8Array(writeData));
		expect(writeStr === "fileIO_test_atomicFile_007").assertTrue();
	  } catch(e) {
		console.log('fileIO_test_atomicFile_007 has failed for ' + e.message);
		expect(false).assertTrue();
	  }
	});
  
	/**
	 * @tc.number SUB_DF_ATOMIC_FILE_0800
	 * @tc.name fileIO_test_atomicFile_008
	 * @tc.desc Test the delete() interface of class AtomicFile
	 * startWrite() create one nwe file, delete() will remove the new file
	 * @tc.size MEDIUM
	 * @tc.type Functoin
	 * @tc.level Level 0
	 * @tc.require
	 */
	it('fileIO_test_atomicFile_008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function () {
	  let fpath = await nextFileName('test8');
	  expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

	  try {
		let file = new fileIO.AtomicFile(fpath);
		let ws = file.startWrite();
		file.finishWrite();
		let stat = fileIO.statSync(fpath);
		expect(stat.size == 0).assertTrue();

		file.delete();
		let res = fileIO.accessSync(fpath);
		expect(res).assertFalse();
	  } catch (e) {
		console.log('fileIO_test_atomicFile_008 has failed for ' + e.message);
		expect(false).assertTrue();
	  }
	});

	/**
	 * @tc.number SUB_DF_ATOMIC_FILE_0900
	 * @tc.name fileIO_test_atomicFile_009
	 * @tc.desc Test the getBaseFile() interface of class AtomicFile
	 * AtomicFile() create one file name, getBaseFile() will get the file name
	 * @tc.size MEDIUM
	 * @tc.type Functoin
	 * @tc.level Level 0
	 * @tc.require
	 */
	it('fileIO_test_atomicFile_009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function () {
	  let filesDir = await featureAbility.getContext().getCacheDir();
	  let fpath = filesDir + '/test9.txt';

	  try {
		let file = new fileIO.AtomicFile(fpath);
		let File = file.getBaseFile();
	  } catch(e){
		expect(e.message === "No such file or directory").assertTrue();
	  }
	});

	/**
	 * @tc.number SUB_DF_ATOMIC_FILE_1000
	 * @tc.name fileIO_test_atomicFile_0010
	 * @tc.desc Test the getBaseFile() interface of class AtomicFile
	 * AtomicFile() create one file name, getBaseFile() will get the file name
	 * @tc.size MEDIUM
	 * @tc.type Functoin
	 * @tc.level Level 0
	 * @tc.require
	 */
	it('fileIO_test_atomicFile_010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function () {
		let filesDir = await featureAbility.getContext().getCacheDir();
		let fpath = filesDir + '/test10.txt';

		try {
			let file = new fileIO.AtomicFile(fpath);
			let ws = file.startWrite();
			ws.write("fileIO_test_atomicFile_010");
			await sleep(WAIT_ONE_SECOND);
			file.finishWrite();
			let File = file.getBaseFile();
			expect(File.fd > 0).assertTrue();
			expect(File.path === fpath).assertTrue();
		} catch(e){
			console.log('fileIO_test_atomicFile_010 has failed for ' + e.message);
			expect(false).assertTrue();
		}
	});
  })
  }
