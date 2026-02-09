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

import { describe, it, expect, TestType, Size, Level, beforeAll, beforeEach} from "../../../hypium/index";
import hilog from '@ohos.hilog'
import Utils from './Util.test';
import { BusinessError } from '@ohos.base';
import unifiedDataChannel from '@ohos.data.unifiedDataChannel';
import uniformTypeDescriptor from '@ohos.data.uniformTypeDescriptor';
import uniformDataStruct from '@ohos.data.uniformDataStruct';

let tag: string = 'testTag';
let text = new unifiedDataChannel.Text();
text.details = {
	'title': '标题',
	'content': '内容'
}

let plainText: unifiedDataChannel.PlainText = new unifiedDataChannel.PlainText();
text.details = {
	'title': '标题',
	'content': '内容'
}
plainText.textContent = 'this is textContent';
plainText.textAbstract = 'this is textAbstract';

let link: unifiedDataChannel.Hyperlink = new unifiedDataChannel.Hyperlink();
text.details = {
	'title': '标题',
	'content': '内容'
}
link.url = 'uri';
link.description = 'description';

let html: unifiedDataChannel.HTML = new unifiedDataChannel.HTML();
html.details = {
	'title': '标题',
	'content': '内容'
}
html.htmlContent = 'htmlContent';
html.plainContent = 'plainContent';

let file:unifiedDataChannel.File = new unifiedDataChannel.File();
			file.details = {
				'title': '标题',
				'content': '内容'
			};
file.uri = 'uri'

let folder:unifiedDataChannel.Folder = new unifiedDataChannel.Folder();
			folder.details = {
				'title': '标题',
				'content': '内容'
			};
folder.folderUri = 'folderUri'

let image:unifiedDataChannel.Image = new unifiedDataChannel.Image();
			image.details = {
				'title': '标题',
				'content': '内容'
			};
image.imageUri = 'imageUri'

let video:unifiedDataChannel.Video = new unifiedDataChannel.Video();
			video.details = {
				'title': '标题',
				'content': '内容'
			};
video.videoUri = 'videoUri'

let audio:unifiedDataChannel.Audio = new unifiedDataChannel.Audio();
			audio.details = {
				'title': '标题',
				'content': '内容'
			};
audio.audioUri = 'audioUri'

let arrayBuf = new ArrayBuffer( 2 * 3 * 4);
let u8Array = new Uint8Array(arrayBuf);

let systemDefinedRecord:unifiedDataChannel.SystemDefinedRecord = new unifiedDataChannel.SystemDefinedRecord();
systemDefinedRecord.details = {
	'title': '标题',
	'version': 1,
	'content': u8Array
};

let systemDefinedForm:unifiedDataChannel.SystemDefinedForm = new unifiedDataChannel.SystemDefinedForm();
systemDefinedForm.details = {
	'title': '标题',
	'version': 1,
	'content': u8Array
};
systemDefinedForm.formId = 123456;
systemDefinedForm.formName = 'formName';
systemDefinedForm.bundleName = 'bundleName';
systemDefinedForm.abilityName = 'abilityName';
systemDefinedForm.module = 'module'

let systemDefinedAppItem:unifiedDataChannel.SystemDefinedAppItem = new unifiedDataChannel.SystemDefinedAppItem();
systemDefinedAppItem.details = {
	'title': '标题',
	'version': 1,
	'content': u8Array
};
systemDefinedAppItem.appId = '123456';
systemDefinedAppItem.appName = 'appName';
systemDefinedAppItem.appIconId = 'appIconId';
systemDefinedAppItem.appLabelId = 'appLabelId';
systemDefinedAppItem.bundleName = 'bundleName';
systemDefinedAppItem.abilityName = 'abilityName';

let systemDefinedPixelMap:unifiedDataChannel.SystemDefinedPixelMap = new unifiedDataChannel.SystemDefinedPixelMap();
systemDefinedPixelMap.details = {
	'title': '标题',
	'version': 1,
	'content': u8Array
};
systemDefinedPixelMap.rawData = u8Array;

let applicationDefinedRecord:unifiedDataChannel.ApplicationDefinedRecord = new unifiedDataChannel.ApplicationDefinedRecord();
applicationDefinedRecord.applicationDefinedType = 'applicationDefinedType';
applicationDefinedRecord.rawData = u8Array;

export default function UDMFApiPromiseTest() {
	describe("UDMFApiPromiseTest", (): void => {
		beforeEach(async () => {
			console.log(tag, `beforeEach`);
			let options:unifiedDataChannel.Options = {
				intention: unifiedDataChannel.Intention.DATA_HUB
			};
			try {
				let data = await unifiedDataChannel.deleteData(options);
				let size = JSON.stringify(data).length;
				console.log(tag, `[beforeEach] success to deleteData data. size = ${size}`);
			} catch (e) {
				let error: BusinessError = e as BusinessError;
				console.error(tag, `Failed, code is ${error.code}, message is ${error.message}`)
				expect().assertFail();
			}
		})
		/**
		* @tc.name   SUB_DistributedData_UDMF_SDK_UnifiedDataPromiseJsAPITest_0100
		* @tc.number testSUB_DistributedData_UDMF_SDK_UnifiedDataPromiseJsAPITest_0100
		* @tc.desc   unifiedDataChannel insertData promise interface test.
		* @tc.type   FUNCTION
		* @tc.size   MEDIUMTEST
		* @tc.level  LEVEL3
		*/
		it('SUB_DistributedData_UDMF_SDK_UnifiedDataPromiseJsAPITest_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
			console.log(tag + 'SUB_DistributedData_UDMF_SDK_UnifiedDataPromiseJsAPITest_0100 start');
			let Options:unifiedDataChannel.Options = {}
			let plainText = new unifiedDataChannel.PlainText();
			plainText.textContent = 'this is textContent';
			let unifiedData = new unifiedDataChannel.UnifiedData(plainText);
			try {
				await unifiedDataChannel.insertData(Options, unifiedData)
				expect().assertFail();
			} catch (e) {
				let error: BusinessError = e as BusinessError;
				console.error(tag, `Failed to insertData0100 code is ${error.code},message is ${error.message} `);
				expect(error.code).assertEqual(401);
			}
			console.log(tag + 'SUB_DistributedData_UDMF_SDK_UnifiedDataPromiseJsAPITest_0100 end');
			})

		/**
		* @tc.name   SUB_DistributedData_UDMF_SDK_UnifiedDataPromiseJsAPITest_0200
		* @tc.number testSUB_DistributedData_UDMF_SDK_UnifiedDataPromiseJsAPITest_0200
		* @tc.desc   unifiedDataChannel insertData promise interface test.
		* @tc.type   FUNCTION
		* @tc.size   MEDIUMTEST
		* @tc.level  LEVEL3
		*/
		it('SUB_DistributedData_UDMF_SDK_UnifiedDataPromiseJsAPITest_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
			console.log(tag + 'SUB_DistributedData_UDMF_SDK_UnifiedDataPromiseJsAPITest_0200 start');
			let Options :unifiedDataChannel.Options= {
				intention: undefined
			}
			let plainText = new unifiedDataChannel.PlainText();
			plainText.textContent = 'this is textContent';
			let unifiedData = new unifiedDataChannel.UnifiedData(plainText);
			try {
				await unifiedDataChannel.insertData(Options, unifiedData);
				expect().assertFail();
			} catch (e) {
				let error: BusinessError = e as BusinessError;
				console.error(tag, `Failed to insertData0200 code is ${error.code},message is ${error.message} `);
				expect(error.code).assertEqual(401);
			}
			console.log(tag + 'SUB_DistributedData_UDMF_SDK_UnifiedDataPromiseJsAPITest_0200 end');
			})

		/**
		* @tc.name   SUB_DistributedData_UDMF_SDK_UnifiedDataPromiseJsAPITest_0400
		* @tc.number testSUB_DistributedData_UDMF_SDK_UnifiedDataPromiseJsAPITest_0400
		* @tc.desc   unifiedDataChannel insertData promise interface test.
		* @tc.type   FUNCTION
		* @tc.size   MEDIUMTEST
		* @tc.level  LEVEL3
		*/
		it('SUB_DistributedData_UDMF_SDK_UnifiedDataPromiseJsAPITest_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
			console.log(tag + 'SUB_DistributedData_UDMF_SDK_UnifiedDataPromiseJsAPITest_0400 start');
			let Options:unifiedDataChannel.Options = {
				intention: undefined,
				key: undefined
			}
			let plainText = new unifiedDataChannel.PlainText();
			plainText.textContent = 'this is textContent';
			let unifiedData = new unifiedDataChannel.UnifiedData(plainText);
			try {
				await unifiedDataChannel.insertData(Options, unifiedData);
				expect().assertFail();
			} catch (e) {
				let error: BusinessError = e as BusinessError;
				console.error(tag, `Failed to insertData0400 code is ${error.code},message is ${error.message} `);
				expect(error.code).assertEqual(401);
			}
			console.log(tag + 'SUB_DistributedData_UDMF_SDK_UnifiedDataPromiseJsAPITest_0400 end');
		})

		/**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UnifiedDataPromiseJsAPITest_0500
     * @tc.number testSUB_DistributedData_UDMF_SDK_UnifiedDataPromiseJsAPITest_0500
     * @tc.desc   unifiedDataChannel insertData promise interface test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_DistributedData_UDMF_SDK_UnifiedDataPromiseJsAPITest_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.log(tag + 'SUB_DistributedData_UDMF_SDK_UnifiedDataPromiseJsAPITest_0500 start');
      let Options:unifiedDataChannel.Options = {
        key: String (null)
      }
      let plainText = new unifiedDataChannel.PlainText();
      plainText.textContent = 'this is textContent';
      let unifiedData = new unifiedDataChannel.UnifiedData(plainText);
      try {
        await unifiedDataChannel.insertData(Options, unifiedData);
        expect().assertFail();
      } catch (e) {
        let error: BusinessError = e as BusinessError;
        console.error(tag, `Failed to insertData0300 code is ${error.code},message is ${error.message} `);
        expect(error.code).assertEqual(401);
      }
      console.log(tag + 'SUB_DistributedData_UDMF_SDK_UnifiedDataPromiseJsAPITest_0500 end');
    })
		
		/**
		* @tc.name   SUB_DistributedData_UDMF_SDK_UnifiedDataPromiseJsAPITest_0600
		* @tc.number testSUB_DistributedData_UDMF_SDK_UnifiedDataPromiseJsAPITest_0600
		* @tc.desc   unifiedDataChannel insertData promise interface test.
		* @tc.type   FUNCTION
		* @tc.size   MEDIUMTEST
		* @tc.level  LEVEL3
		*/
		it('SUB_DistributedData_UDMF_SDK_UnifiedDataPromiseJsAPITest_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
			console.log(tag + 'SUB_DistributedData_UDMF_SDK_UnifiedDataPromiseJsAPITest_0600 start');
			let options:unifiedDataChannel.Options = {
				intention: unifiedDataChannel.Intention.DATA_HUB
			}
			let plainText = new unifiedDataChannel.PlainText();
			plainText.textContent = 'this is textContent';
			let unifiedData = new unifiedDataChannel.UnifiedData(plainText);
			try {
				let data = unifiedDataChannel.insertData(options, unifiedData);
				console.log(tag, `data = ${data}, options = ${options}`);
				expect(data !== null).assertEqual(true);
			} catch (e) {
				let error: BusinessError = e as BusinessError;
				console.error(tag, `Failed to insertData0500 code is ${error.code},message is ${error.message} `);
				expect(error.code).assertEqual(401);
			}
			console.log(tag + 'SUB_DistributedData_UDMF_SDK_UnifiedDataPromiseJsAPITest_0600 end');
			})

		/**
		* @tc.name   SUB_DistributedData_UDMF_SDK_UnifiedDataPromiseJsAPITest_1000
		* @tc.number testSUB_DistributedData_UDMF_SDK_UnifiedDataPromiseJsAPITest_1000
		* @tc.desc   unifiedDataChannel updateData promise interface test.
		* @tc.type   FUNCTION
		* @tc.size   MEDIUMTEST
		* @tc.level  LEVEL3
		*/
		it('SUB_DistributedData_UDMF_SDK_UnifiedDataPromiseJsAPITest_1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
			console.log(tag + 'SUB_DistributedData_UDMF_SDK_UnifiedDataPromiseJsAPITest_1000 start');
			let options:unifiedDataChannel.Options = {
				intention: unifiedDataChannel.Intention.DATA_HUB
			}
			let plainText = new unifiedDataChannel.PlainText();
			plainText.textContent = "hello world!";
			let unifiedData = new unifiedDataChannel.UnifiedData(plainText);
			try {
				unifiedDataChannel.insertData(options, unifiedData, (e, data) => {
				console.log(tag, `insertData1000 success; data = ${data}, options = ${options}`);
				unifiedDataChannel.updateData({
					key: data
				}, unifiedData)
				console.log(tag, `updateData1000 success.`)
				console.log(tag + 'SUB_DistributedData_UDMF_SDK_UnifiedDataPromiseJsAPITest_1000 end');
				done();
				});
			} catch (e) {
				let error: BusinessError = e as BusinessError;
				console.error(tag, `Failed, code is ${error.code},message is ${error.message} `);
				expect().assertFail();
				done();
			}
		})

		/**
		* @tc.name   SUB_DistributedData_UDMF_SDK_UnifiedDataPromiseJsAPITest_1100
		* @tc.number testSUB_DistributedData_UDMF_SDK_UnifiedDataPromiseJsAPITest_1100
		* @tc.desc   unifiedDataChannel queryData promise interface test.
		* @tc.type   FUNCTION
		* @tc.size   MEDIUMTEST
		* @tc.level  LEVEL3
		*/
		it('SUB_DistributedData_UDMF_SDK_UnifiedDataPromiseJsAPITest_1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
			console.log(tag + 'SUB_DistributedData_UDMF_SDK_UnifiedDataPromiseJsAPITest_1100 start');
			let options:unifiedDataChannel.Options = {
				intention: unifiedDataChannel.Intention.DATA_HUB
			};
			let plainText = new unifiedDataChannel.PlainText();
			plainText.textContent = "hello world!";
			let unifiedData = new unifiedDataChannel.UnifiedData(plainText);
			try {
				unifiedDataChannel.queryData(options, (errInfo, ret) => {
				console.log(tag, `Succeeded in querying data. size = ${ret!.length}`)
				unifiedDataChannel.insertData(options, unifiedData, (e, data) => {
					console.log(tag, `insertData01100 success; data = ${data}, options = ${options}`);
					unifiedDataChannel.queryData(options).then((data) => {
					console.log(tag, `Succeeded in querying data. size = ${data.length}`);
					expect(data.length - ret!.length).assertEqual(1)
					console.log(tag + 'SUB_DistributedData_UDMF_SDK_UnifiedDataPromiseJsAPITest_1100 end');
					done();
					}).catch((err: Error) => {
					console.error(tag, `Failed to query data. code is ${err.code}, message is ${err.message}`);
					expect().assertFail();
					done();
					})
				});
				});
			} catch (e) {
				let error: BusinessError = e as BusinessError;
				console.error(tag, `Failed, code is ${error.code},message is ${error.message} `);
				expect().assertFail();
				done();
			}
		})

		/**
		* @tc.name   SUB_DistributedData_UDMF_SDK_UnifiedDataPromiseJsAPITest_1200
		* @tc.number testSUB_DistributedData_UDMF_SDK_UnifiedDataPromiseJsAPITest_1200
		* @tc.desc   unifiedDataChannel queryData promise interface test.
		* @tc.type   FUNCTION
		* @tc.size   MEDIUMTEST
		* @tc.level  LEVEL3
		*/
		it('SUB_DistributedData_UDMF_SDK_UnifiedDataPromiseJsAPITest_1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
			console.log(tag + 'SUB_DistributedData_UDMF_SDK_UnifiedDataPromiseJsAPITest_1200 start');
			let options:unifiedDataChannel.Options = {
				intention: unifiedDataChannel.Intention.DATA_HUB
			};
			let plainText = new unifiedDataChannel.PlainText();
			plainText.textContent = "hello world!";
			let unifiedData = new unifiedDataChannel.UnifiedData(plainText);
			try {
				unifiedDataChannel.insertData(options, unifiedData, (e, data) => {
				console.log(tag, `insertData01200 success; data = ${data}, options = ${options}`);
				unifiedDataChannel.queryData({ key: data}).then((data) => {
					console.log(tag, `Succeeded in querying data. size = ${data.length}`);
					expect(data.length).assertEqual(1)
					console.log(tag + 'SUB_DistributedData_UDMF_SDK_UnifiedDataPromiseJsAPITest_1200 end');
					done();
				}).catch((err: Error) => {
					console.error(tag, `Failed to query data. code is ${err.code}, message is ${err.message}`);
					expect().assertFail();
					done();
				})
				});
			} catch (e) {
				let error: BusinessError = e as BusinessError;
				console.error(tag, `Failed, code is ${error.code},message is ${error.message} `);
				expect().assertFail();
				done();
			}
		})

		/**
		* @tc.name   SUB_DistributedData_UDMF_SDK_UnifiedDataPromiseJsAPITest_1300
		* @tc.number testSUB_DistributedData_UDMF_SDK_UnifiedDataPromiseJsAPITest_1300
		* @tc.desc   unifiedDataChannel queryData promise interface test.
		* @tc.type   FUNCTION
		* @tc.size   MEDIUMTEST
		* @tc.level  LEVEL3
		*/
		it('SUB_DistributedData_UDMF_SDK_UnifiedDataPromiseJsAPITest_1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
			console.log(tag + 'SUB_DistributedData_UDMF_SDK_UnifiedDataPromiseJsAPITest_1300 start');
			let options:unifiedDataChannel.Options = {
				intention: unifiedDataChannel.Intention.DATA_HUB
			};
			let plainText = new unifiedDataChannel.PlainText();
			plainText.textContent = "hello world!";
			let unifiedData = new unifiedDataChannel.UnifiedData(plainText);
			try {
				unifiedDataChannel.insertData(options, unifiedData, (e, data) => {
				console.log(tag, `insertData01300 success; data = ${data}, options = ${options}`);
				let options2:unifiedDataChannel.Options = {
					intention: unifiedDataChannel.Intention.DATA_HUB,
					key: data
				};
				unifiedDataChannel.queryData(options2).then((data) => {
					console.log(tag, `Succeeded in querying data. size = ${data.length}`);
					expect(data.length).assertEqual(1)
					console.log(tag + 'SUB_DistributedData_UDMF_SDK_UnifiedDataPromiseJsAPITest_1300 end');
					done();
				}).catch((err: Error) => {
					console.error(tag, `Failed to query data. code is ${err.code}, message is ${err.message}`);
					expect().assertFail();
					done();
				})
				});
			} catch (e) {
				let error: BusinessError = e as BusinessError;
				console.error(tag, `Failed, code is ${error.code},message is ${error.message} `);
				expect().assertFail();
				done();
			}
		})

		/**
		* @tc.name   SUB_DistributedData_UDMF_SDK_UnifiedDataPromiseJsAPITest_1400
		* @tc.number testSUB_DistributedData_UDMF_SDK_UnifiedDataPromiseJsAPITest_1400
		* @tc.desc   unifiedDataChannel queryData promise interface test.
		* @tc.type   FUNCTION
		* @tc.size   MEDIUMTEST
		* @tc.level  LEVEL3
		*/
		it('SUB_DistributedData_UDMF_SDK_UnifiedDataPromiseJsAPITest_1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
			console.log(tag + 'SUB_DistributedData_UDMF_SDK_UnifiedDataPromiseJsAPITest_1400 start');
			let options:unifiedDataChannel.Options = {
				intention: unifiedDataChannel.Intention.DATA_HUB
			};
			let plainText = new unifiedDataChannel.PlainText();
			plainText.textContent = "hello world!";
			let unifiedData = new unifiedDataChannel.UnifiedData(plainText);
			try {
				unifiedDataChannel.insertData(options, unifiedData, (e, data) => {
				console.log(tag, `insertData01400 success; data = ${data}, options = ${options}`);
				let options2:unifiedDataChannel.Options = {
					intention: unifiedDataChannel.Intention.DATA_HUB,
					key: 'data'
				};
				unifiedDataChannel.queryData(options2).then((data) => {
					expect().assertFail();
					done();
				}).catch((err: Error) => {
					console.error(tag, `Failed to query data. code is ${err.code}, message is ${err.message}`);
					expect(err.code).assertEqual(401);
					console.log(tag + 'SUB_DistributedData_UDMF_SDK_UnifiedDataPromiseJsAPITest_1400 end');
					done();
				})
				});
			} catch (e) {
				let error: BusinessError = e as BusinessError;
				console.error(tag, `Failed, code is ${error.code},message is ${error.message} `);
				expect().assertFail();
				done();
			}
		})

		/**
		* @tc.name   SUB_DistributedData_UDMF_SDK_UnifiedDataPromiseJsAPITest_1500
		* @tc.number testSUB_DistributedData_UDMF_SDK_UnifiedDataPromiseJsAPITest_1500
		* @tc.desc   unifiedDataChannel queryData promise interface test.
		* @tc.type   FUNCTION
		* @tc.size   MEDIUMTEST
		* @tc.level  LEVEL3
		*/
		it('SUB_DistributedData_UDMF_SDK_UnifiedDataPromiseJsAPITest_1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
		console.log(tag + 'SUB_DistributedData_UDMF_SDK_UnifiedDataPromiseJsAPITest_1400 start');
			let options:unifiedDataChannel.Options = {
				intention: unifiedDataChannel.Intention.DATA_HUB
			};
			let plainText = new unifiedDataChannel.PlainText();
			plainText.textContent = "hello world!";
			let unifiedData = new unifiedDataChannel.UnifiedData(plainText);
			try {
				unifiedDataChannel.insertData(options, unifiedData, (e, data) => {
				console.log(tag, `insertData01500 success; data = ${data}, options = ${options}`);
				let options2:unifiedDataChannel.Options = {
					intention: unifiedDataChannel.Intention.DATA_HUB,
					key: undefined
				};
				unifiedDataChannel.queryData(options2).then((data) => {
					console.log(tag, `Succeeded in querying data. size = ${data.length}`);
					expect(data.length).assertEqual(1)
					done();
				}).catch((err: Error) => {
					console.error(tag, `Failed to query data. code is ${err.code}, message is ${err.message}`);
					expect().assertFail();
					console.log(tag + 'SUB_DistributedData_UDMF_SDK_UnifiedDataPromiseJsAPITest_1500 end');
					done();
				})
				});
			} catch (e) {
				let error: BusinessError = e as BusinessError;
				console.error(tag, `Failed, code is ${error.code},message is ${error.message} `);
				expect().assertFail();
				done();
			}
		})

		/**
		* @tc.name   SUB_DistributedData_SDK_UnifiedDataPromiseJsAPITest_1600
		* @tc.number testSUB_DistributedData_UDMF_SDK_UnifiedDataPromiseJsAPITest_1600
		* @tc.desc   unifiedDataChannel deleteData promise interface test.
		* @tc.type   FUNCTION
		* @tc.size   MEDIUMTEST
		* @tc.level  LEVEL3
		*/
		it('SUB_DistributedData_SDK_UnifiedDataPromiseJsAPITest_1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
		console.log(tag + 'SUB_DistributedData_UDMF_SDK_UnifiedDataPromiseJsAPITest_1600 start');
			let options:unifiedDataChannel.Options = {
				intention: unifiedDataChannel.Intention.DATA_HUB
			};
			let plainText = new unifiedDataChannel.PlainText();
			plainText.textContent = "hello world!";
			let unifiedData = new unifiedDataChannel.UnifiedData(plainText);
			try {
				unifiedDataChannel.insertData(options, unifiedData, (e, data) => {
				console.log(tag, `insertData01600 success; data = ${data}, options = ${options}`);
				unifiedDataChannel.queryData(options, (errInfo, ret) => {
					console.log(tag, `Succeeded in querying data. size = ${ret!.length}`)
					let ret2 = await unifiedDataChannel.deleteData(options);
					if (ret2 !== undefined) {
					let size = ret2.length;
					for (let i = 0; i < size; i++) {
						let records = ret2[i].getRecords();
						let size = records.length;
						for (let j = 0; j < size; j++) {
						if (records[j].getTypes().includes(uniformTypeDescriptor.UniformDataType.PLAIN_TEXT)) {
							let text = records[j].getEntry(uniformTypeDescriptor.UniformDataType.PLAIN_TEXT) as uniformDataStruct.PlainText;
							console.log(tag, `${i + 1}.${text.textContent}`);
							expect(text.textContent).assertEqual('hello world!')
						}
						}
					}
					expect(size).assertEqual(1);
					}
					console.log(tag + 'SUB_DistributedData_UDMF_SDK_UnifiedDataPromiseJsAPITest_1600 end');
					done();
				})
				});
			} catch (e) {
				let error: BusinessError = e as BusinessError;
				console.error(tag, `Failed, code is ${error.code},message is ${error.message} `);
				expect().assertFail();
				done();
			}
		})

		/**
		* @tc.name   SUB_DistributedData_UDMF_SDK_UnifiedDataPromiseJsAPITest_1700
		* @tc.number testSUB_DistributedData_UDMF_SDK_UnifiedDataPromiseJsAPITest_1700
		* @tc.desc   unifiedDataChannel deleteData promise interface test.
		* @tc.type   FUNCTION
		* @tc.size   MEDIUMTEST
		* @tc.level  LEVEL3
		*/
		it('SUB_DistributedData_UDMF_SDK_UnifiedDataPromiseJsAPITest_1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
		console.log(tag + 'SUB_DistributedData_UDMF_SDK_UnifiedDataPromiseJsAPITest_1700 start');
			let options:unifiedDataChannel.Options = {
				intention: unifiedDataChannel.Intention.DATA_HUB
			};
			let plainText = new unifiedDataChannel.PlainText();
			plainText.textContent = "hello world!";
			let unifiedData = new unifiedDataChannel.UnifiedData(plainText);
			try {
				unifiedDataChannel.insertData(options, unifiedData, (e, data) => {
				console.log(tag, `insertData01700 success; data = ${data}, options = ${options}`);
				unifiedDataChannel.queryData(options, (errInfo, ret) => {
					console.log(tag, `Succeeded in querying data. size = ${ret!.length}`)
					let ret2 = await unifiedDataChannel.deleteData({ key: data});
					if (ret2 !== undefined) {
					let size = ret2.length;
					for (let i = 0; i < size; i++) {
						let records = ret2[i].getRecords();
						let size = records.length;
						for (let j = 0; j < size; j++) {
						if (records[j].getTypes().includes(uniformTypeDescriptor.UniformDataType.PLAIN_TEXT)) {
							let text = records[j].getEntry(uniformTypeDescriptor.UniformDataType.PLAIN_TEXT) as uniformDataStruct.PlainText;
							console.log(tag, `${i + 1}.${text.textContent}`);
							expect(text.textContent).assertEqual('hello world!')
						}
						}
					}
					expect(size).assertEqual(1);
					}
					console.log(tag + 'SUB_DistributedData_UDMF_SDK_UnifiedDataPromiseJsAPITest_1700 end');
					done();
				})
				});
			} catch (e) {
				let error: BusinessError = e as BusinessError;
				console.error(tag, `Failed, code is ${error.code},message is ${error.message} `);
				expect().assertFail();
				done();
			}
		})

		/**
		* @tc.name   SUB_DistributedData_UDMF_SDK_UnifiedDataPromiseJsAPITest_1800
		* @tc.number testSUB_DistributedData_UDMF_SDK_UnifiedDataPromiseJsAPITest_1800
		* @tc.desc   unifiedDataChannel deleteData promise interface test.
		* @tc.type   FUNCTION
		* @tc.size   MEDIUMTEST
		* @tc.level  LEVEL3
		*/
		it('SUB_DistributedData_UDMF_SDK_UnifiedDataPromiseJsAPITest_1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
		console.log(tag + 'SUB_DistributedData_UDMF_SDK_UnifiedDataPromiseJsAPITest_1800 start');
			let options:unifiedDataChannel.Options = {
				intention: unifiedDataChannel.Intention.DATA_HUB
			};
			let plainText = new unifiedDataChannel.PlainText();
			plainText.textContent = "hello world!";
			let unifiedData = new unifiedDataChannel.UnifiedData(plainText);
			try {
				unifiedDataChannel.insertData(options, unifiedData, (e, data) => {
				console.log(tag, `insertData01800 success; data = ${data}, options = ${options}`);
				unifiedDataChannel.queryData(options, (errInfo, ret) => {
					console.log(tag, `Succeeded in querying data. size = ${ret!.length}`)
					let options2:unifiedDataChannel.Options = {
					intention: unifiedDataChannel.Intention.DATA_HUB,
					key: data
					};
					let ret2 = await unifiedDataChannel.deleteData(options2);
					if (ret2 !== undefined) {
					let size = ret2.length;
					for (let i = 0; i < size; i++) {
						let records = ret2[i].getRecords();
						let size = records.length;
						for (let j = 0; j < size; j++) {
						if (records[j].getTypes().includes(uniformTypeDescriptor.UniformDataType.PLAIN_TEXT)) {
							let text = records[j].getEntry(uniformTypeDescriptor.UniformDataType.PLAIN_TEXT) as uniformDataStruct.PlainText;
							console.log(tag, `${i + 1}.${text.textContent}`);
							expect(text.textContent).assertEqual('hello world!')
						}
						}
					}
					expect(size).assertEqual(1);
					}
					console.log(tag + 'SUB_DistributedData_UDMF_SDK_UnifiedDataPromiseJsAPITest_1800 end');
					done();
				})
				});
			} catch (e) {
				let error: BusinessError = e as BusinessError;
				console.error(tag, `Failed, code is ${error.code},message is ${error.message} `);
				expect().assertFail();
				done();
			}
		})

		/**
		* @tc.name   SUB_DistributedData_UDMF_SDK_UnifiedDataPromiseJsAPITest_1900
		* @tc.number testSUB_DistributedData_UDMF_SDK_UnifiedDataPromiseJsAPITest_1900
		* @tc.desc   unifiedDataChannel deleteData promise interface test.
		* @tc.type   FUNCTION
		* @tc.size   MEDIUMTEST
		* @tc.level  LEVEL3
		*/
		it('SUB_DistributedData_UDMF_SDK_UnifiedDataPromiseJsAPITest_1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
			console.log(tag + 'SUB_DistributedData_UDMF_SDK_UnifiedDataPromiseJsAPITest_1900 start');
			let options:unifiedDataChannel.Options = {
				intention: unifiedDataChannel.Intention.DATA_HUB
			};
			let plainText = new unifiedDataChannel.PlainText();
			plainText.textContent = "hello world!";
			let unifiedData = new unifiedDataChannel.UnifiedData(plainText);
			try {
				unifiedDataChannel.insertData(options, unifiedData, (e, data) => {
				console.log(tag, `insertData01900 success; data = ${data}, options = ${options}`);
				unifiedDataChannel.queryData(options, (errInfo, ret) => {
					console.log(tag, `Succeeded in querying data. size = ${ret!.length}`)
					let options2:unifiedDataChannel.Options = {
					intention: unifiedDataChannel.Intention.DATA_HUB,
					key: 'data'
					};
					await unifiedDataChannel.deleteData(options2).then((data) => {
					expect().assertFail();
					done();
					}).catch((err: Error) => {
					console.error(tag, `Failed to delete data. code is ${err.code}, message is ${err.message}`);
					expect(err.code).assertEqual(401);
					console.log(tag + 'SUB_DistributedData_UDMF_SDK_UnifiedDataPromiseJsAPITest_1900 end');
					done();
					})
				})
				});
			} catch (e) {
				let error: BusinessError = e as BusinessError;
				console.error(tag, `Failed, code is ${error.code},message is ${error.message} `);
				expect().assertFail();
				done();
			}
		})

		/**
		* @tc.name   SUB_DistributedData_UDMF_SDK_UnifiedDataPromiseJsAPITest_2000
		* @tc.number testSUB_DistributedData_UDMF_SDK_UnifiedDataPromiseJsAPITest_2000
		* @tc.desc   unifiedDataChannel deleteData promise interface test.
		* @tc.type   FUNCTION
		* @tc.size   MEDIUMTEST
		* @tc.level  LEVEL3
		*/
		it('SUB_DistributedData_UDMF_SDK_UnifiedDataPromiseJsAPITest_2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
			console.log(tag + 'SUB_DistributedData_UDMF_SDK_UnifiedDataPromiseJsAPITest_2000 start');
			let options:unifiedDataChannel.Options = {
				intention: unifiedDataChannel.Intention.DATA_HUB
			};
			let plainText = new unifiedDataChannel.PlainText();
			plainText.textContent = "hello world!";
			let unifiedData = new unifiedDataChannel.UnifiedData(plainText);
			try {
				unifiedDataChannel.insertData(options, unifiedData, (e, data) => {
				console.log(tag, `insertData01100 success; data = ${data}, options = ${options}`);
				unifiedDataChannel.queryData(options, (errInfo, ret) => {
					console.log(tag, `Succeeded in querying data. size = ${ret!.length}`)
					let options2:unifiedDataChannel.Options = {
					intention: unifiedDataChannel.Intention.DATA_HUB,
					key: undefined
					};
					let ret2 = await unifiedDataChannel.deleteData(options2);
					if (ret2 !== undefined) {
					let size = ret2.length;
					for (let i = 0; i < size; i++) {
						let records = ret2[i].getRecords();
						let size = records.length;
						for (let j = 0; j < size; j++) {
						if (records[j].getTypes().includes(uniformTypeDescriptor.UniformDataType.PLAIN_TEXT)) {
							let text = records[j].getEntry(uniformTypeDescriptor.UniformDataType.PLAIN_TEXT) as uniformDataStruct.PlainText;
							console.log(tag, `${i + 1}.${text.textContent}`);
							expect(text.textContent).assertEqual('hello world!')
						}
						}
					}
					expect(size).assertEqual(1);
					}
					console.log(tag + 'SUB_DistributedData_UDMF_SDK_UnifiedDataPromiseJsAPITest_2000 end');
					done();
				})
				});
			} catch (e) {
				let error: BusinessError = e as BusinessError;
				console.error(tag, `Failed, code is ${error.code},message is ${error.message} `);
				expect().assertFail();
				done();
			}
		})

		/**
		* @tc.name   SUB_DistributedData_UDMF_SDK_DragWithOutPermission_0200
		* @tc.number testSUB_DistributedData_UDMF_SDK_DragWithOutPermission_0200
		* @tc.desc   setAppShareOptions test.
		* @tc.type   FUNCTION
		* @tc.size   MEDIUMTEST
		* @tc.level  LEVEL2
		*/
		it('SUB_DistributedData_UDMF_SDK_DragWithOutPermission_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
			try {
				unifiedDataChannel.setAppShareOptions(unifiedDataChannel.Intention.DRAG, unifiedDataChannel.ShareOptions.CROSS_APP);
				console.log(tag, `removeAppShareOptions is succeed`);
				expect().assertFail();
			} catch (e) {
				let error: BusinessError = e as BusinessError;
				console.error(tag, `Failed, code is ${error.code},message is ${error.message} `);
				expect(error.code).assertEqual(201)
			}
		})

		/**
		* @tc.name   SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_0400
		* @tc.number testSUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_0400
		* @tc.desc   html test.
		* @tc.type   FUNCTION
		* @tc.size   MEDIUMTEST
		* @tc.level  LEVEL3
		*/
		it('SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
			console.log(tag + 'SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_0400 start');
			let html:unifiedDataChannel.HTML = new unifiedDataChannel.HTML();
			html.details = {
				'title': '标题',
				'content': '内容'
			};
			html.htmlContent = 'htmlContent';
			html.plainContent = 'plainContent';
			let unifiedData = new unifiedDataChannel.UnifiedData(html);
			let records = unifiedData.getRecords();
			let record:unifiedDataChannel.HTML = (records[0]) as unifiedDataChannel.HTML;
			expect(records.length).assertEqual(1);
			expect(JSON.stringify(record.details)).assertEqual(JSON.stringify(html.details));
			expect(record.htmlContent).assertEqual('htmlContent');
			expect(record.plainContent).assertEqual('plainContent');
			console.log(tag + 'SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_0400 end');
			done();
		})

		/**
		* @tc.name   SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_0500
		* @tc.number testSUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_0500
		* @tc.desc   file test.
		* @tc.type   FUNCTION
		* @tc.size   MEDIUMTEST
		* @tc.level  LEVEL3
		*/
		it('SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
			console.log(tag + 'SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_0500 start');
			let file:unifiedDataChannel.File = new unifiedDataChannel.File();
			file.details = {
				'title': '标题',
				'content': '内容'
			};
			file.uri = 'uri'
			let unifiedData = new unifiedDataChannel.UnifiedData(file);
			let records = unifiedData.getRecords();
			let record:unifiedDataChannel.File = (records[0]) as unifiedDataChannel.File;
			expect(records.length).assertEqual(1);
			expect(JSON.stringify(record.details)).assertEqual(JSON.stringify(file.details));
			expect(record.uri).assertEqual('uri');
			console.log(tag + 'SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_0500 end');
			done();
		})

		/**
		* @tc.name   SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_0600
		* @tc.number testSUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_0600
		* @tc.desc   folder test.
		* @tc.type   FUNCTION
		* @tc.size   MEDIUMTEST
		* @tc.level  LEVEL3
		*/
		it('SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
			console.log(tag + 'SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_0600 start');
			let folder:unifiedDataChannel.Folder = new unifiedDataChannel.Folder();
			folder.details = {
				'title': '标题',
				'content': '内容'
			};
			folder.folderUri = 'folderUri'
			let unifiedData = new unifiedDataChannel.UnifiedData(folder);
			let records = unifiedData.getRecords();
			let record:unifiedDataChannel.Folder = (records[0]) as unifiedDataChannel.Folder;
			expect(records.length).assertEqual(1);
			expect(JSON.stringify(record.details)).assertEqual(JSON.stringify(folder.details));
			expect(record.uri).assertEqual('folderUri');
			console.log(tag + 'SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_0600 end');
			done();
		})

		/**
		* @tc.name   SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_0700
		* @tc.number testSUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_0700
		* @tc.desc   image test.
		* @tc.type   FUNCTION
		* @tc.size   MEDIUMTEST
		* @tc.level  LEVEL3
		*/
		it('SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
			console.log(tag + 'SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_0700 start');
			let image:unifiedDataChannel.Image = new unifiedDataChannel.Image();
			image.details = {
				'title': '标题',
				'content': '内容'
			};
			image.imageUri = 'imageUri'
			let unifiedData = new unifiedDataChannel.UnifiedData(image);
			let records = unifiedData.getRecords();
			let record:unifiedDataChannel.Image = (records[0]) as unifiedDataChannel.Image;
			expect(records.length).assertEqual(1);
			expect(JSON.stringify(record.details)).assertEqual(JSON.stringify(image.details));
			expect(record.uri).assertEqual('imageUri');
			console.log(tag + 'SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_0700 end');
			done();
		})

		/**
		* @tc.name   SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_0800
		* @tc.number testSUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_0800
		* @tc.desc   video test.
		* @tc.type   FUNCTION
		* @tc.size   MEDIUMTEST
		* @tc.level  LEVEL3
		*/
		it('SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
			console.log(tag + 'SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_0800 start');
			let video:unifiedDataChannel.Video = new unifiedDataChannel.Video();
			video.details = {
				'title': '标题',
				'content': '内容'
			};
			video.videoUri = 'videoUri'
			let unifiedData = new unifiedDataChannel.UnifiedData(video);
			let records = unifiedData.getRecords();
			let record:unifiedDataChannel.Video = (records[0]) as unifiedDataChannel.Video;
			expect(records.length).assertEqual(1);
			expect(JSON.stringify(record.details)).assertEqual(JSON.stringify(video.details));
			expect(record.uri).assertEqual('videoUri');
			console.log(tag + 'SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_0800 end');
			done();
		})

		/**
		* @tc.name   SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_0900
		* @tc.number testSUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_0900
		* @tc.desc   audio test.
		* @tc.type   FUNCTION
		* @tc.size   MEDIUMTEST
		* @tc.level  LEVEL3
		*/
		it('SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
			console.log(tag + 'SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_0900 start');
			let audio:unifiedDataChannel.Audio = new unifiedDataChannel.Audio();
			audio.details = {
				'title': '标题',
				'content': '内容'
			};
			audio.audioUri = 'audioUri'
			let unifiedData = new unifiedDataChannel.UnifiedData(audio);
			let records = unifiedData.getRecords();
			let record:unifiedDataChannel.Audio = (records[0]) as unifiedDataChannel.Audio;
			expect(records.length).assertEqual(1);
			expect(JSON.stringify(record.details)).assertEqual(JSON.stringify(audio.details));
			expect(record.uri).assertEqual('audioUri');
			console.log(tag + 'SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_0900 end');
			done();
		})

		/**
		* @tc.name   SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_1000
		* @tc.number testSUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_1000
		* @tc.desc   systemDefinedRecord test.
		* @tc.type   FUNCTION
		* @tc.size   MEDIUMTEST
		* @tc.level  LEVEL3
		*/
		it('SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
			console.log(tag + 'SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_1000 start');
			let arrayBuf = new ArrayBuffer( 2 * 3 * 4);
			let u8Array = new Uint8Array(arrayBuf);
			let systemDefinedRecord:unifiedDataChannel.SystemDefinedRecord = new unifiedDataChannel.SystemDefinedRecord();
			systemDefinedRecord.details = {
				'title': '标题',
				'version': 1,
				'content': u8Array
			};
			let unifiedData = new unifiedDataChannel.UnifiedData(systemDefinedRecord);
			let records = unifiedData.getRecords();
			let record:unifiedDataChannel.SystemDefinedRecord = (records[0]) as unifiedDataChannel.SystemDefinedRecord;
			expect(records.length).assertEqual(1);
			expect(JSON.stringify(record.details)).assertEqual(JSON.stringify(systemDefinedRecord.details));
			console.log(tag + 'SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_1000 end');
			done();
		})

		/**
		* @tc.name   SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_1100
		* @tc.number testSUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_1100
		* @tc.desc   systemDefinedForm test.
		* @tc.type   FUNCTION
		* @tc.size   MEDIUMTEST
		* @tc.level  LEVEL3
		*/
		it('SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
			console.log(tag + 'SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_1100 start');
			let arrayBuf = new ArrayBuffer( 2 * 3 * 4);
			let u8Array = new Uint8Array(arrayBuf);
			let systemDefinedForm:unifiedDataChannel.SystemDefinedForm = new unifiedDataChannel.SystemDefinedForm();
			systemDefinedForm.details = {
				'title': '标题',
				'version': 1,
				'content': u8Array
			};
			systemDefinedForm.formId = 123456;
			systemDefinedForm.formName = 'formName';
			systemDefinedForm.bundleName = 'bundleName';
			systemDefinedForm.abilityName = 'abilityName';
			systemDefinedForm.module = 'module'
			let unifiedData = new unifiedDataChannel.UnifiedData(systemDefinedForm);
			let records = unifiedData.getRecords();
			let record:unifiedDataChannel.SystemDefinedForm = (records[0]) as unifiedDataChannel.SystemDefinedForm;
			expect(records.length).assertEqual(1);
			expect(JSON.stringify(record.details)).assertEqual(JSON.stringify(systemDefinedForm.details));
			expect(record.formId).assertEqual(123456);
			expect(record.formName).assertEqual('formName');
			expect(record.bundleName).assertEqual('bundleName');
			expect(record.abilityName).assertEqual('abilityName');
			expect(record.module).assertEqual('module');
			console.log(tag + 'SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_1100 end');
			done();
		})

		/**
		* @tc.name   SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_1200
		* @tc.number testSUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_1200
		* @tc.desc   systemDefinedAppItem test.
		* @tc.type   FUNCTION
		* @tc.size   MEDIUMTEST
		* @tc.level  LEVEL3
		*/
		it('SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
			console.log(tag + 'SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_1200 start');
			let arrayBuf = new ArrayBuffer( 2 * 3 * 4);
			let u8Array = new Uint8Array(arrayBuf);
			let systemDefinedAppItem:unifiedDataChannel.SystemDefinedAppItem = new unifiedDataChannel.SystemDefinedAppItem();
			systemDefinedAppItem.details = {
				'title': '标题',
				'version': 1,
				'content': u8Array
			};
			systemDefinedAppItem.appId = '123456';
			systemDefinedAppItem.appName = 'appName';
			systemDefinedAppItem.appIconId = 'appIconId';
			systemDefinedAppItem.appLabelId = 'appLabelId';
			systemDefinedAppItem.bundleName = 'bundleName';
			systemDefinedAppItem.abilityName = 'abilityName';
			let unifiedData = new unifiedDataChannel.UnifiedData(systemDefinedAppItem);
			let records = unifiedData.getRecords();
			let record:unifiedDataChannel.SystemDefinedAppItem = (records[0]) as unifiedDataChannel.SystemDefinedAppItem;
			expect(records.length).assertEqual(1);
			expect(JSON.stringify(record.details)).assertEqual(JSON.stringify(systemDefinedAppItem.details));
			expect(record.appId).assertEqual('123456');
			expect(record.appName).assertEqual('appName');
			expect(record.appIconId).assertEqual('appIconId');
			expect(record.appLabelId).assertEqual('appLabelId');
			expect(record.bundleName).assertEqual('bundleName');
			expect(record.abilityName).assertEqual('abilityName');
			console.log(tag + 'SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_1200 end');
			done();
		})

		/**
		* @tc.name   SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_1300
		* @tc.number testSUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_1300
		* @tc.desc   systemDefinedRecord test.
		* @tc.type   FUNCTION
		* @tc.size   MEDIUMTEST
		* @tc.level  LEVEL3
		*/
		it('SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
			console.log(tag + 'SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_1300 start');
			let arrayBuf = new ArrayBuffer( 2 * 3 * 4);
			let u8Array = new Uint8Array(arrayBuf);
			let systemDefinedPixelMap:unifiedDataChannel.SystemDefinedPixelMap = new unifiedDataChannel.SystemDefinedPixelMap();
			systemDefinedPixelMap.details = {
				'title': '标题',
				'version': 1,
				'content': u8Array
			};
			systemDefinedPixelMap.rawData = u8Array;
			let unifiedData = new unifiedDataChannel.UnifiedData(systemDefinedPixelMap);
			let records = unifiedData.getRecords();
			let record:unifiedDataChannel.SystemDefinedPixelMap = (records[0]) as unifiedDataChannel.SystemDefinedPixelMap;
			expect(records.length).assertEqual(1);
			expect(JSON.stringify(record.details)).assertEqual(JSON.stringify(systemDefinedPixelMap.details));
			for (let i = 0; i < u8Array.length; i++) {
				expect(record.rawData[i]).assertEqual(u8Array[i]);
			}
			console.log(tag + 'SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_1300 end');
			done();
		})

		/**
		* @tc.name   SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_1400
		* @tc.number testSUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_1400
		* @tc.desc   systemDefinedRecord test.
		* @tc.type   FUNCTION
		* @tc.size   MEDIUMTEST
		* @tc.level  LEVEL3
		*/
		it('SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
			console.log(tag + 'SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_1400 start');
			let arrayBuf = new ArrayBuffer( 2 * 3 * 4);
			let u8Array = new Uint8Array(arrayBuf);
			let applicationDefinedRecord:unifiedDataChannel.ApplicationDefinedRecord = new unifiedDataChannel.ApplicationDefinedRecord();
			applicationDefinedRecord.applicationDefinedType = 'applicationDefinedType';
			applicationDefinedRecord.rawData = u8Array;
			let unifiedData = new unifiedDataChannel.UnifiedData(applicationDefinedRecord);
			let records = unifiedData.getRecords();
			let record:unifiedDataChannel.ApplicationDefinedRecord = (records[0]) as unifiedDataChannel.ApplicationDefinedRecord;
			expect(records.length).assertEqual(1);
			expect(record.applicationDefinedType).assertEqual('applicationDefinedType');
			for (let i = 0; i < u8Array.length; i++) {
				expect(record.rawData[i]).assertEqual(u8Array[i]);
			}
			console.log(tag + 'SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_1400 end');
			done();
		})

		/**
		* @tc.name   SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_1500
		* @tc.number testSUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_1500
		* @tc.desc   systemDefinedRecord test.
		* @tc.type   FUNCTION
		* @tc.size   MEDIUMTEST
		* @tc.level  LEVEL3
		*/
		it('SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
			console.log(tag + 'SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_1500 start');
			let unifiedData = new unifiedDataChannel.UnifiedData(text);
			unifiedData.addRecord(plainText);
			unifiedData.addRecord(link);
			unifiedData.addRecord(html);
			unifiedData.addRecord(file);
			unifiedData.addRecord(folder);
			unifiedData.addRecord(image);
			unifiedData.addRecord(video);
			unifiedData.addRecord(audio);
			unifiedData.addRecord(systemDefinedRecord);
			unifiedData.addRecord(systemDefinedForm);
			unifiedData.addRecord(systemDefinedAppItem);
			unifiedData.addRecord(systemDefinedPixelMap);
			unifiedData.addRecord(applicationDefinedRecord);
			let records = unifiedData.getRecords();
			let record1:unifiedDataChannel.Text = (records[0]) as unifiedDataChannel.Text;
			let record2:unifiedDataChannel.PlainText = (records[1]) as unifiedDataChannel.PlainText;
			let record3:unifiedDataChannel.Hyperlink = (records[2]) as unifiedDataChannel.Hyperlink;
			let record4:unifiedDataChannel.HTML = (records[3]) as unifiedDataChannel.HTML;
			let record5:unifiedDataChannel.File = (records[4]) as unifiedDataChannel.File;
			let record6:unifiedDataChannel.Folder = (records[5]) as unifiedDataChannel.Folder;
			let record7:unifiedDataChannel.Image = (records[6]) as unifiedDataChannel.Image;
			let record8:unifiedDataChannel.Video = (records[7]) as unifiedDataChannel.Video;
			let record9:unifiedDataChannel.Audio = (records[8]) as unifiedDataChannel.Audio;
			let record10:unifiedDataChannel.SystemDefinedRecord = (records[9]) as unifiedDataChannel.SystemDefinedRecord;
			let record11:unifiedDataChannel.SystemDefinedForm = (records[10]) as unifiedDataChannel.SystemDefinedForm;
			let record12:unifiedDataChannel.SystemDefinedAppItem = (records[11]) as unifiedDataChannel.SystemDefinedAppItem;
			let record13:unifiedDataChannel.SystemDefinedPixelMap = (records[12]) as unifiedDataChannel.SystemDefinedPixelMap;
			let record14:unifiedDataChannel.ApplicationDefinedRecord = (records[13]) as unifiedDataChannel.ApplicationDefinedRecord;
			expect(records.length).assertEqual(14);
			expect(record1.getType()).assertEqual(uniformTypeDescriptor.UniformDataType.TEXT);
			expect(record2.getType()).assertEqual(uniformTypeDescriptor.UniformDataType.PLAIN_TEXT);
			expect(record3.getType()).assertEqual(uniformTypeDescriptor.UniformDataType.HYPERLINK);
			expect(record4.getType()).assertEqual(uniformTypeDescriptor.UniformDataType.HTML);
			expect(record5.getType()).assertEqual(uniformTypeDescriptor.UniformDataType.FILE);
			expect(record6.getType()).assertEqual(uniformTypeDescriptor.UniformDataType.FOLDER);
			expect(record7.getType()).assertEqual(uniformTypeDescriptor.UniformDataType.IMAGE);
			expect(record8.getType()).assertEqual(uniformTypeDescriptor.UniformDataType.VIDEO);
			expect(record9.getType()).assertEqual(uniformTypeDescriptor.UniformDataType.AUDIO);
			expect(record11.getType()).assertEqual(uniformTypeDescriptor.UniformDataType.OPENHARMONY_FORM);
			expect(record12.getType()).assertEqual(uniformTypeDescriptor.UniformDataType.OPENHARMONY_APP_ITEM);
			expect(record13.getType()).assertEqual(uniformTypeDescriptor.UniformDataType.OPENHARMONY_PIXEL_MAP);
			console.log(tag + 'SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_1500 end');
			done();
		})

		/**
		* @tc.name   SUB_DistributedData_UDMF_SDK_UDMFEntryTest_3100
		* @tc.number testSUB_DistributedData_UDMF_SDK_UDMFEntryTest_3100
		* @tc.desc   getTypes test.
		* @tc.type   FUNCTION
		* @tc.size   MEDIUMTEST
		* @tc.level  LEVEL3
		*/
		it('SUB_DistributedData_UDMF_SDK_UDMFEntryTest_3100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
			console.log(tag + 'SUB_DistributedData_UDMF_SDK_UDMFEntryTest_3100 start');
			let unifiedData = new unifiedDataChannel.UnifiedData();
			let types = unifiedData.getTypes();
			expect(types.length).assertEqual(0);
			console.log(tag + 'SUB_DistributedData_UDMF_SDK_UDMFEntryTest_3100 end');
		})

		/**
		* @tc.name   SUB_DistributedData_UDMF_SDK_UDMFEntryTest_3200
		* @tc.number testSUB_DistributedData_UDMF_SDK_UDMFEntryTest_3200
		* @tc.desc   getTypes test.
		* @tc.type   FUNCTION
		* @tc.size   MEDIUMTEST
		* @tc.level  LEVEL3
		*/
		it('SUB_DistributedData_UDMF_SDK_UDMFEntryTest_3200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
			console.log(tag + 'SUB_DistributedData_UDMF_SDK_UDMFEntryTest_3200 start');
			let record = new unifiedDataChannel.UnifiedRecord();
			let types = record.getTypes();
			expect(types.length).assertEqual(1);
			expect(types[0]).assertEqual('')
			console.log(tag + 'SUB_DistributedData_UDMF_SDK_UDMFEntryTest_3200 end');
		})

		/**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UDMFEntryTest_0400
     * @tc.number testSUB_DistributedData_UDMF_SDK_UDMFEntryTest_0400
     * @tc.desc   Verify the properties of the contentForm type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UDMFEntryTest_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.log(tag + 'SUB_DistributedData_UDMF_SDK_UDMFEntryTest_0400 start');
      let options: unifiedDataChannel.Options = {
        intention: unifiedDataChannel.Intention.DATA_HUB
      };
      let fileUriDetails: Record<string, Int|Long|Double|String|Uint8Array>|undefined = {
        'attr1': 'value1',
        'attr2': 'value2',
      }
      let fileUri: uniformDataStruct.FileUri = {
        uniformDataType: 'general.file-uri',
        oriUri: 'file://data/image/1.png',
        fileType: 'general.image',
        details: fileUriDetails,
      }
      let formDetails: Record<string, Int|Long|Double|String|Uint8Array>|undefined = {
        'attr1': 'value1',
        'attr2': 'value2',
      }
      let formData: uniformDataStruct.Form = {
        uniformDataType: 'openharmony.form',
        formId: 1,
        formName: 'form',
        bundleName: 'com.xx.app',
        abilityName: 'ability',
        module: 'module',
        details: formDetails,
      }

      let unifiedData = new unifiedDataChannel.UnifiedData();
      let record = new unifiedDataChannel.UnifiedRecord();
      record.addEntry(uniformTypeDescriptor.UniformDataType.FILE_URI, fileUri);
      record.addEntry(uniformTypeDescriptor.UniformDataType.OPENHARMONY_FORM, formData);
      try {
        record.addEntry("", formData);
        expect().assertFail();
      } catch (e) {
				let error: BusinessError = e as BusinessError;
				console.error(tag, `Failed, code is ${error.code},message is ${error.message} `);
        expect(error.code).assertEqual(401);
      }
      console.log(tag + "SUB_DistributedData_UDMF_SDK_UDMFEntryTest_0400 end");
    });

		/**
       * @tc.name   SUB_DistributedData_UDMF_SDK_UDMFEntryTest_1100
       * @tc.number testSUB_DistributedData_UDMF_SDK_UDMFEntryTest_1100
       * @tc.desc   Verify the properties of the contentForm type
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL2
       */
		it('SUB_DistributedData_UDMF_SDK_UDMFEntryTest_1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
			console.log(tag + 'SUB_DistributedData_UDMF_SDK_UDMFEntryTest_1100 start');
			let options: unifiedDataChannel.Options = {
				intention: unifiedDataChannel.Intention.DATA_HUB
			};
			let fileUriDetails: Record<string, Int|Long|Double|String|Uint8Array>|undefined = {
				'attr1': 'value1',
				'attr2': 'value2',
			}
			let fileUri: uniformDataStruct.FileUri = {
				uniformDataType: 'general.file-uri',
				oriUri: 'file://data/image/1.png',
				fileType: 'general.image',
				details: fileUriDetails,
			}
			let formDetails: Record<string, Int|Long|Double|String|Uint8Array>|undefined = {
				'attr1': 'value1',
				'attr2': 'value2',
			}
			let formData: uniformDataStruct.Form = {
				uniformDataType: 'openharmony.form',
				formId: 1,
				formName: 'form',
				bundleName: 'com.xx.app',
				abilityName: 'ability',
				module: 'module',
				details: formDetails,
			}

			let unifiedData = new unifiedDataChannel.UnifiedData();
			let record = new unifiedDataChannel.UnifiedRecord();
			record.addEntry(uniformTypeDescriptor.UniformDataType.FILE_URI, fileUri);
			record.addEntry(uniformTypeDescriptor.UniformDataType.OPENHARMONY_FORM, formData);
			let records = unifiedData.getRecords();
			for (let i = 0; i < records.length; i++) {
				let unifiedDataRecord = records[i] as unifiedDataChannel.UnifiedRecord;
				try {
					let fileUriRead: uniformDataStruct.FileUri = unifiedDataRecord.getEntry("") as uniformDataStruct.FileUri
					expect().assertFail();
				} catch (e) {
					let error: BusinessError = e as BusinessError;
					console.error(tag, `Failed, code is ${error.code},message is ${error.message} `);
					expect(error.code).assertEqual(401);
				}
			}
			console.log(tag + "SUB_DistributedData_UDMF_SDK_UDMFEntryTest_1100 end");
		});

		/**
       * @tc.name   SUB_DistributedData_UDMF_SDK_UDMFEntryTest_1400
       * @tc.number testSUB_DistributedData_UDMF_SDK_UDMFEntryTest_1400
       * @tc.desc   Verify the properties of the contentForm type
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL2
       */
		it('SUB_DistributedData_UDMF_SDK_UDMFEntryTest_1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
			console.log('SUB_DistributedData_UDMF_SDK_UDMFEntryTest_1400 start');
			let options: unifiedDataChannel.Options = {
				intention: unifiedDataChannel.Intention.DATA_HUB
			};
			let fileUriDetails: Record<string, Int|Long|Double|String|Uint8Array>|undefined = {
				'attr1': 'value1',
				'attr2': 'value2',
			}
			let fileUri: uniformDataStruct.FileUri = {
				uniformDataType: 'general.file-uri',
				oriUri: 'file://data/image/1.png',
				fileType: 'general.image',
				details: fileUriDetails,
			}
			let formDetails: Record<string, Int|Long|Double|String|Uint8Array>|undefined = {
				'attr1': 'value1',
				'attr2': 'value2',
			}
			let formData: uniformDataStruct.Form = {
				uniformDataType: 'openharmony.form',
				formId: 1,
				formName: 'form',
				bundleName: 'com.xx.app',
				abilityName: 'ability',
				module: 'module',
				details: formDetails,
			}

			let unifiedData = new unifiedDataChannel.UnifiedData();
			let record = new unifiedDataChannel.UnifiedRecord();
			record.addEntry(uniformTypeDescriptor.UniformDataType.FILE_URI, fileUri);
			record.addEntry(uniformTypeDescriptor.UniformDataType.OPENHARMONY_FORM, formData);
			let records = unifiedData.getRecords();
			for (let i = 0; i < records.length; i++) {
				let unifiedDataRecord = records[i] as unifiedDataChannel.UnifiedRecord;
				try {
					let fileUriRead: uniformDataStruct.FileUri =
						unifiedDataRecord.getEntry("@#$%^&*") as uniformDataStruct.FileUri
					expect().assertFail();
				} catch (e) {
					let error: BusinessError = e as BusinessError;
					console.error(tag, `Failed, code is ${error.code},message is ${error.message} `);
					expect(error.code).assertEqual(401);
				}
			}
			console.log("SUB_DistributedData_UDMF_SDK_UDMFEntryTest_1400 end");
		});

		/**
       * @tc.name   SUB_DistributedData_UDMF_SDK_UDMFEntryTest_1600
       * @tc.number testSUB_DistributedData_UDMF_SDK_UDMFEntryTest_1600
       * @tc.desc   Verify the properties of the contentForm type
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL2
       */
		it('SUB_DistributedData_UDMF_SDK_UDMFEntryTest_1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
			console.log(tag + 'SUB_DistributedData_UDMF_SDK_UDMFEntryTest_1600 start');
			let options: unifiedDataChannel.Options = {
				intention: unifiedDataChannel.Intention.DATA_HUB
			};
			let fileUriDetails: Record<string, Int|Long|Double|String|Uint8Array>|undefined = {
				'attr1': 'value1',
				'attr2': 'value2',
			}
			let fileUri: uniformDataStruct.FileUri = {
				uniformDataType: 'general.file-uri',
				oriUri: 'file://data/image/1.png',
				fileType: 'general.image',
				details: fileUriDetails,
			}
			let formDetails: Record<string, Int|Long|Double|String|Uint8Array>|undefined = {
				'attr1': 'value1',
				'attr2': 'value2',
			}
			let formData: uniformDataStruct.Form = {
				uniformDataType: 'openharmony.form',
				formId: 1,
				formName: 'form',
				bundleName: 'com.xx.app',
				abilityName: 'ability',
				module: 'module',
				details: formDetails,
			}
			let unifiedData = new unifiedDataChannel.UnifiedData();
			let record = new unifiedDataChannel.UnifiedRecord();
			record.addEntry(uniformTypeDescriptor.UniformDataType.FILE_URI, fileUri);
			record.addEntry(uniformTypeDescriptor.UniformDataType.OPENHARMONY_FORM, formData);
			unifiedData.addRecord(record);
			let data = await unifiedDataChannel.insertData(options, unifiedData);
			let options1: unifiedDataChannel.Options = {
				intention: unifiedDataChannel.Intention.DATA_HUB,
				key: data
			}
			let ret = await unifiedDataChannel.queryData(options1);
			let size = ret.length;
			console.log(tag, `data.size = ${size}`);
			for (let i = 0; i < size; i++) {
				let records = ret[i].getRecords();
				for (let i = 0; i < records.length; i++) {
					let unifiedDataRecord = records[i] as unifiedDataChannel.UnifiedRecord;
					let recordTypes = unifiedDataRecord.getTypes();
					expect(recordTypes.toString()).assertEqual('openharmony.form,general.file-uri');
				}
			}
			console.log(tag = "SUB_DistributedData_UDMF_SDK_UDMFEntryTest_1600 end");
		});

		/**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UnifiedDataCallbackJsAPITest_0200
     * @tc.number testSUB_DistributedData_UDMF_SDK_UnifiedDataCallbackJsAPITest_0200
     * @tc.desc   unifiedDataChannel insertData callback interface test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_DistributedData_UDMF_SDK_UnifiedDataCallbackJsAPITest_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      console.log(tag = "SUB_DistributedData_UDMF_SDK_UnifiedDataCallbackJsAPITest_0200 start");
			let Options:unifiedDataChannel.Options = {
        intention: undefined
      }
      let plainText = new unifiedDataChannel.PlainText();
      plainText.textContent = 'this is textContent';
      let unifiedData = new unifiedDataChannel.UnifiedData(plainText);
			unifiedDataChannel.insertData(Options, unifiedData, (err, data) => {
				if (err !== null) {
					let error = err as BusinessError;
					console.log(tag, `err code is ${error.code}, message is ${error.message}`);
					expect(error.code).assertEqual(401)
					console.log(tag = "SUB_DistributedData_UDMF_SDK_UnifiedDataCallbackJsAPITest_0200 end");
					done();
				} else {
					expect().assertFail();
					done();
				}
			})
    })

		/**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UnifiedDataCallbackJsAPITest_0400
     * @tc.number testSUB_DistributedData_UDMF_SDK_UnifiedDataCallbackJsAPITest_0400
     * @tc.desc   unifiedDataChannel insertData callback interface test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_DistributedData_UDMF_SDK_UnifiedDataCallbackJsAPITest_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      console.log(tag = "SUB_DistributedData_UDMF_SDK_UnifiedDataCallbackJsAPITest_0400 start");
			let Options:unifiedDataChannel.Options = {
        intention: undefined,
				key: undefined
      }
      let plainText = new unifiedDataChannel.PlainText();
      plainText.textContent = 'this is textContent';
      let unifiedData = new unifiedDataChannel.UnifiedData(plainText);
			unifiedDataChannel.insertData(Options, unifiedData, (err, data) => {
				if (err !== null) {
					let error = err as BusinessError;
					console.log(tag, `err code is ${error.code}, message is ${error.message}`);
					expect(error.code).assertEqual(401)
					console.log(tag = "SUB_DistributedData_UDMF_SDK_UnifiedDataCallbackJsAPITest_0400 end");
					done();
				} else {
					expect().assertFail();
					done();
				}
			})
    })

		/**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9660
     * @tc.number testSUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9660
     * @tc.desc   Invalid parameter to belongsTo() --The relationship between the object of the parameter and "general.hello"
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9660', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log(tag + 'SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9660 start');
      let typeObj1 = uniformTypeDescriptor.getTypeDescriptor(uniformTypeDescriptor.UniformDataType.NAVIGATION);
      try {
				if(typeObj1) {
					let result = typeObj1.belongsTo("general.hello")
				}
        expect().assertFail();
      } catch (e) {
				let error: BusinessError = e as BusinessError;
				console.error(tag, `Failed, code is ${error.code},message is ${error.message} `);
				expect(error.code).assertEqual(401);
      }
      console.log(tag + "SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9660 end");
    });

		/**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9705
     * @tc.number testSUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9705
     * @tc.desc   Invalid parameter to belongsTo() --The relationship between the object of the parameter and "general.hello"
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9705', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log(tag + 'SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9705 start');
      let typeObj1 = uniformTypeDescriptor.getTypeDescriptor(uniformTypeDescriptor.UniformDataType.TEXT);
      try {
				if(typeObj1) {
					let result = typeObj1.isLowerLevelType("general.hello")
				}
        expect().assertFail();
      } catch (e) {
				let error: BusinessError = e as BusinessError;
				console.error(tag, `Failed, code is ${error.code},message is ${error.message} `);
				expect(error.code).assertEqual(401);
      }
      console.log(tag + "SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9705 end");
    });

		/**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9760
     * @tc.number SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9760
     * @tc.desc   Invalid parameter to belongsTo() --The relationship between the object of the parameter and "general.hello"
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9760', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log(tag + 'SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9705 start');
      let typeObj1 = uniformTypeDescriptor.getTypeDescriptor(uniformTypeDescriptor.UniformDataType.TEXT);
      try {
				if(typeObj1) {
					let result = typeObj1.isHigherLevelType("general.hello")
				}
        expect().assertFail();
      } catch (e) {
				let error: BusinessError = e as BusinessError;
				console.error(tag, `Failed, code is ${error.code},message is ${error.message} `);
				expect(error.code).assertEqual(401);
      }
      console.log(tag + "SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9760 end");
    });

		/**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9790
     * @tc.number testSUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9790
     * @tc.desc   Invalid parameter to belongsTo() --The relationship between the object of the parameter and "general.hello"
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9790', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log(tag + 'SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9790 start');
      try {
				let result = uniformTypeDescriptor.getUniformDataTypeByFilenameExtension('')
        expect().assertFail();
      } catch (e) {
				let error: BusinessError = e as BusinessError;
				console.error(tag, `Failed, code is ${error.code},message is ${error.message} `);
				expect(error.code).assertEqual(401);
      }
      console.log(tag + "SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9790 end");
    });

		/**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9830
     * @tc.number testSUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9830
     * @tc.desc   Invalid parameter to belongsTo() --The relationship between the object of the parameter and "general.hello"
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9830', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log(tag + 'SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9830 start');
      try {
				let result = uniformTypeDescriptor.getUniformDataTypeByFilenameExtension('.wave', '')
        expect().assertFail();
      } catch (e) {
				let error: BusinessError = e as BusinessError;
				console.error(tag, `Failed, code is ${error.code},message is ${error.message} `);
				expect(error.code).assertEqual(401);
      }
      console.log(tag + "SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9830 end");
    });

		/**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9885
     * @tc.number testSUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9885
     * @tc.desc   Invalid parameter to belongsTo() --The relationship between the object of the parameter and "general.hello"
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9885', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log(tag + 'SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9885 start');
      try {
				let result = uniformTypeDescriptor.getUniformDataTypeByMIMEType('image/tiff', 'general.hello')
        expect().assertFail();
      } catch (e) {
				let error: BusinessError = e as BusinessError;
				console.error(tag, `Failed, code is ${error.code},message is ${error.message} `);
				expect(error.code).assertEqual(401);
      }
      console.log(tag + "SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9885 end");
    });

		/**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9890
     * @tc.number SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9890
     * @tc.desc   Invalid parameter to belongsTo() --The relationship between the object of the parameter and "general.hello"
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9890', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log(tag + 'SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9890 start');
      try {
				let result = uniformTypeDescriptor.getUniformDataTypeByMIMEType('image/tiff', '')
        expect().assertFail();
      } catch (e) {
				let error: BusinessError = e as BusinessError;
				console.error(tag, `Failed, code is ${error.code},message is ${error.message} `);
				expect(error.code).assertEqual(401);
      }
      console.log(tag + "SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9890 end");
    });

		/**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_1170
     * @tc.number SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_1170
     * @tc.desc   Invalid parameter to belongsTo() --The relationship between the object of the parameter and "general.hello"
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_1170', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.log(tag + 'SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_1170 start');
      try {
				let result = uniformTypeDescriptor.getUniformDataTypeByFilenameExtension('')
        expect().assertFail();
      } catch (e) {
				let error: BusinessError = e as BusinessError;
				console.error(tag, `Failed, code is ${error.code},message is ${error.message} `);
				expect(error.code).assertEqual(401);
      }
      console.log(tag + "SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_1170 end");
    });
	});
}