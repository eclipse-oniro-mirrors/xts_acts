/*
 * Copyright (C) 2021 Huawei Device Co., Ltd.
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
import hiSysEvent from '@ohos.hiSysEvent';
import fs from '@ohos.file.fs';
import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect} from '@ohos/hypium'

export default function hiSysEventBoxTest() {
describe('hiSysEventBoxTest', function () {
	function sleep(numberMillis) {
		var now = new Date();
		var exitTime = now.getTime() + numberMillis;
		while (true) {
			now = new Date();
			if (now.getTime() > exitTime)
				return;
		}
	}
    beforeAll(function() {
        console.info('hiSysEventBoxTest beforeAll called')
    })

    afterAll(function() {
        console.info('hiSysEventBoxTest afterAll called')
    })

    beforeEach(function() {
        console.info('hiSysEventBoxTest beforeEach called')
    })

    afterEach(function() {
        console.info('hiSysEventBoxTest afterEach called')
    })

	/**
	 * @tc.number DFX_DFT_HiSysevent_SandBox_0400
	 * @tc.name testHiSysEventBox04
	 * @tc.desc 验证调用exportSysEvents接口，QueryRule11条，抛出错误码11200301
	 */
	it('testHiSysEventBox04', 1, async function (done) {
		console.info('testHiSysEventBox04 start')
		try {
			let time = hiSysEvent.exportSysEvents({
				beginTime: -1,
				endTime: -1,
				maxEvents: 1,
			}, [{
				domain: "RELIABILITY",
				names: ["STACK"],
			},{
				domain: "RELIABILITY",
				names: ["SERVICE_BLOCK_REPORT"],
			},{
				domain: "RELIABILITY",
				names: ["SERVICE_TIMEOUT_REPORT"],
			},{
				domain: "RELIABILITY",
				names: ["CPP_CRASH_NO_LOG"],
			},{
				domain: "RELIABILITY",
				names: ["RUST_PANIC"],
			},{
				domain: "RELIABILITY",
				names: ["MEMORY_LEAK"],
			},{
				domain: "RELIABILITY",
				names: ["FD_LEAK"],
			},{
				domain: "RELIABILITY",
				names: ["THREAD_LEAK"],
			},{
				domain: "RELIABILITY",
				names: ["ADDR_SANITIZER"],
			},{
				domain: "RELIABILITY",
				names: ["CPP_CRASH"],
			},{
				domain: "RELIABILITY",
				names: ["APP_FREEZE"],
			}])
			expect().assertFail()
			done();
		} catch (error) {
			console.error(`testHiSysEventBox04 error code: ${error.code}, error msg: ${error.message}`);
			expect(error.code == 11200301).assertTrue()
			console.info('testHiSysEventBox04 end')
			done();
		}
	})

	/**
	 * @tc.number DFX_DFT_HiSysevent_SandBox_0500
	 * @tc.name testHiSysEventBox05
	 * @tc.desc 验证调用exportSysEvents接口，QueryRule-domain无效，抛出错误码11200302
	 */
	it('testHiSysEventBox05', 1, async function (done) {
		console.info('testHiSysEventBox05 start')
		try {
			let time = hiSysEvent.exportSysEvents({
				beginTime: -1,
				endTime: -1,
				maxEvents: 1,
			}, [{
				domain: "RELIABILITY_RE",
				names: ["SERVICE_BLOCK_REPORT"],
			}])
			expect().assertFail()
			done();
		} catch (error) {
			console.error(`testHiSysEventBox05 error code: ${error.code}, error msg: ${error.message}`);
			expect(error.code == 11200302).assertTrue()
			console.info('testHiSysEventBox05 end')
			done();
		}
	})

	/**
	 * @tc.number DFX_DFT_HiSysevent_SandBox_0600
	 * @tc.name testHiSysEventBox06
	 * @tc.desc 验证调用exportSysEvents接口，QueryRule-evetname无效，抛出错误码11200302
	 */
	it('testHiSysEventBox06', 3, async function (done) {
		console.info('testHiSysEventBox06 start')
		try {
			let time = hiSysEvent.exportSysEvents({
				beginTime: -1,
				endTime: -1,
				maxEvents: 1,
			}, [{
				domain: "RELIABILITY",
				names: ["SERVICE_BLOCK_REPORT_SERVICE"],
			}])
			expect().assertFail()
			done();
		} catch (error) {
			console.error(`testHiSysEventBox06 error code: ${error.code}, error msg: ${error.message}`);
			expect(error.code == 11200302).assertTrue()
			console.info('testHiSysEventBox06 end')
			done();
		}
	})

	/**
	 * @tc.number DFX_DFT_HiSysevent_SandBox_0700
	 * @tc.name testHiSysEventBox07
	 * @tc.desc 验证调用exportSysEvents接口，QueryRule-domain为空，抛出错误码11200302
	 */
	it('testHiSysEventBox07', 3, async function (done) {
		console.info('testHiSysEventBox07 start')
		try {
			let time = hiSysEvent.exportSysEvents({
				beginTime: -1,
				endTime: -1,
				maxEvents: 1,
			}, [{
				domain: "",
				names: ["SERVICE_BLOCK_REPORT"],
			}])
			expect().assertFail()
			done();
		} catch (error) {
			console.error(`testHiSysEventBox07 error code: ${error.code}, error msg: ${error.message}`);
			expect(error.code == 11200302).assertTrue()
			console.info('testHiSysEventBox07 end')
			done();
		}
	})

	/**
	 * @tc.number DFX_DFT_HiSysevent_SandBox_0800
	 * @tc.name testHiSysEventBox08
	 * @tc.desc 验证调用exportSysEvents接口，QueryRule-eventname为空，抛出错误码11200302
	 */
	it('testHiSysEventBox08', 3, async function (done) {
		console.info('testHiSysEventBox08 start')
		try {
			let time = hiSysEvent.exportSysEvents({
				beginTime: -1,
				endTime: -1,
				maxEvents: 1,
			}, [{
				domain: "RELIABILITY",
				names: [""],
			}])
			expect().assertFail()
			done();
		} catch (error) {
			console.error(`testHiSysEventBox08 error code: ${error.code}, error msg: ${error.message}`);
			expect(error.code == 11200302).assertTrue()
			console.info('testHiSysEventBox08 end')
			done();
		}
	})

	/**
	 * @tc.number DFX_DFT_HiSysevent_SandBox_1000
	 * @tc.name testHiSysEventBox10
	 * @tc.desc 验证设备重启后exportSysEvents接口一小时内可调用一次，QueryRule10条，返回值为调用时间戳，沙箱路径存在导出的文件
	 */
	it('testHiSysEventBox10', 3, async function (done) {
		console.info('testHiSysEventBox10 start')
		try {
			hiSysEvent.write({
				domain: "RELIABILITY",
				name: "STACK",
				eventType: hiSysEvent.EventType.FAULT,
				params: {
					PID: 487,
					UID: 103,
					PACKAGE_NAME: "com.ohos.hisysevent.test",
					PROCESS_NAME: "syseventservice",
					MSG: "no msg."
				}
			}, (err, val) => {
				if (err) {
					console.error(`HiSysEvent json-callback-error code=${err.code}`);
					expect().assertFail()
					done();
				}
			})
			let time = hiSysEvent.exportSysEvents({
				beginTime: -1,
				endTime: -1,
				maxEvents: 1,
			}, [{
				domain: "RELIABILITY",
				names: ["STACK"],
			},{
				domain: "RELIABILITY",
				names: ["SERVICE_BLOCK_REPORT"],
			},{
				domain: "RELIABILITY",
				names: ["SERVICE_TIMEOUT_REPORT"],
			},{
				domain: "RELIABILITY",
				names: ["CPP_CRASH_NO_LOG"],
			},{
				domain: "RELIABILITY",
				names: ["RUST_PANIC"],
			},{
				domain: "RELIABILITY",
				names: ["MEMORY_LEAK"],
			},{
				domain: "RELIABILITY",
				names: ["FD_LEAK"],
			},{
				domain: "RELIABILITY",
				names: ["THREAD_LEAK"],
			},{
				domain: "RELIABILITY",
				names: ["ADDR_SANITIZER"],
			},{
				domain: "RELIABILITY",
				names: ["CPP_CRASH"],
			}])
			// 延迟读取本次导出的事件
			sleep(5000);
			let eventDir = '/data/storage/el2/base/cache/hiview/event';
			let filenames = fs.listFileSync(eventDir);
			for (let i = 0; i < filenames.length; i++) {
				if (filenames[i].indexOf(time.toString()) != -1) {
					let res = fs.readTextSync(eventDir + '/' + filenames[i]);
					let events = JSON.parse('[' + res.slice(0, res.length - 1) + ']');
					console.log("read file end, events is :" + JSON.stringify(events));
					expect(JSON.stringify(events) != "").assertTrue()
				}
			}
			expect(typeof(time) == "bigint").assertTrue()
			console.info('testHiSysEventBox10 end')
			done();
		} catch (error) {
			console.error(`testHiSysEventBox10 error code: ${error.code}, error msg: ${error.message}`);
			console.info('testHiSysEventBox10 error')
			expect().assertFail()
			done();
		}
	})

    /**
	 * @tc.number DFX_DFT_HiSysevent_SandBox_1100
	 * @tc.name testHiSysEventBox11
	 * @tc.desc 验证一小时内重复调用exportSysEvents的接口，抛出错误码11200304
	 */
	it('testHiSysEventBox11', 3, async function (done) {
		console.info('testHiSysEventBox11 start')
		try {
			let time = hiSysEvent.exportSysEvents({
				beginTime: -1,
				endTime: -1,
				maxEvents: 1,
			}, [{
				domain: "RELIABILITY",
				names: ["SERVICE_BLOCK_REPORT"],
			}])
			expect().assertFail()
			done();
		} catch (error) {
			console.error(`testHiSysEventBox11 error code: ${error.code}, error msg: ${error.message}`);
			expect(error.code == 11200304).assertTrue()
			console.info('testHiSysEventBox11 end')
			done();
		}
	})

	/**
	 * @tc.number DFX_DFT_HiSysevent_SandBox_1300
	 * @tc.name testHiSysEventBox13
	 * @tc.desc 验证调用subscribe，30条订阅事件，其中一个domain16字节，eventname32字节，沙箱路径存在导出的文件，Hiview数据库存在uid信息
	 */
	it('testHiSysEventBox13', 3, async function (done) {
		console.info('testHiSysEventBox13 start')
		let msgArray = []
		for (let i = 0; i < 29; i++) {
			msgArray[i] = {
				domain: "RELIABILITY",
				names: ["STACK"],
			}
		}
		msgArray[29] = {
			domain: "RELIABILITYRELIA",
			names: ["CPP_CRASH_NO_LOGCPP_CRASH_NO_LOG"],
		}
		try {
			hiSysEvent.subscribe(msgArray)
			hiSysEvent.write({
				domain: "RELIABILITY",
				name: "STACK",
				eventType: hiSysEvent.EventType.FAULT,
				params: {
					PID: 487,
					UID: 103,
					PACKAGE_NAME: "com.ohos.hisysevent.test",
					PROCESS_NAME: "syseventservice",
					MSG: "no msg."
				}
			}, (err, val) => {
			})
			sleep(5000);
			let eventDir = '/data/storage/el2/base/cache/hiview/event';
			let filenames = fs.listFileSync(eventDir);
			for (let i = 0; i < filenames.length; i++) {
				let res = fs.readTextSync(eventDir + '/' + filenames[i]);
				let events = JSON.parse('[' + res.slice(0, res.length - 1) + ']');
				console.log("read file end, events is :" + JSON.stringify(events));
				expect(JSON.stringify(events) != "").assertTrue()
			}
			hiSysEvent.unsubscribe();
			console.info('testHiSysEventBox13 end')
			done();
		} catch (error) {
			console.error(`testHiSysEventBox13 error code: ${error.code}, error msg: ${error.message}`);
			console.info('testHiSysEventBox13 error')
			expect().assertFail()
			done();
		}
	})

	/**
	 * @tc.number DFX_DFT_HiSysevent_SandBox_1400
	 * @tc.name testHiSysEventBox14
	 * @tc.desc 验证调用subscribe接口订阅事件后取消订阅unsubscribe，沙箱路径存在导出的文件，Hiview数据库不存在uid信息
	 */
	it('testHiSysEventBox14', 3, async function (done) {
		console.info('testHiSysEventBox14 start')
		let msgArray = []
		for (let i = 0; i < 29; i++) {
			msgArray[i] = {
				domain: "RELIABILITY",
				names: ["STACK"],
			}
		}
		msgArray[29] = {
			domain: "RELIABILITYRELIA",
			names: ["CPP_CRASH_NO_LOGCPP_CRASH_NO_LOG"],
		}
		try {
			hiSysEvent.subscribe(msgArray)
			hiSysEvent.write({
				domain: "RELIABILITY",
				name: "STACK",
				eventType: hiSysEvent.EventType.FAULT,
				params: {
					PID: 487,
					UID: 103,
					PACKAGE_NAME: "com.ohos.hisysevent.test",
					PROCESS_NAME: "syseventservice",
					MSG: "no msg."
				}
			}, (err, val) => {
			})
			sleep(5000);
			hiSysEvent.unsubscribe();
			let eventDir = '/data/storage/el2/base/cache/hiview/event';
			let filenames = fs.listFileSync(eventDir);
			for (let i = 0; i < filenames.length; i++) {
				let res = fs.readTextSync(eventDir + '/' + filenames[i]);
				let events = JSON.parse('[' + res.slice(0, res.length - 1) + ']');
				console.log("read file end, events is :" + JSON.stringify(events));
				expect(JSON.stringify(events) != "").assertTrue()
			}
			console.info('testHiSysEventBox14 end')
			done();
		} catch (error) {
			console.error(`testHiSysEventBox14 error code: ${error.code}, error msg: ${error.message}`);
			console.info('testHiSysEventBox14 error')
			expect().assertFail()
			done();
		}
	})

	/**
	 * @tc.number DFX_DFT_HiSysevent_SandBox_1600
	 * @tc.name testHiSysEventBox16
	 * @tc.desc 验证调用subscribe，31条订阅事件，抛出错误码11200301
	 */
	it('testHiSysEventBox16', 3, async function (done) {
		console.info('testHiSysEventBox16 start')
		let msgArray = []
		for (let i = 0; i < 30; i++) {
			msgArray[i] = {
				domain: "RELIABILITY",
				names: ["STACK"],
			}
		}
		msgArray[30] = {
			domain: "RELIABILITYRELIA",
			names: ["CPP_CRASH_NO_LOGCPP_CRASH_NO_LOG"],
		}
		try {
			hiSysEvent.subscribe(msgArray)
			expect().assertFail()
			done();
		} catch (error) {
			console.error(`testHiSysEventBox16 error code: ${error.code}, error msg: ${error.message}`);
			expect(error.code == 11200301).assertTrue()
			console.info('testHiSysEventBox16 end')
			done();
		}
	})

	/**
	 * @tc.number DFX_DFT_HiSysevent_SandBox_1700
	 * @tc.name testHiSysEventBox17
	 * @tc.desc 验证调用subscribe接口，QueryRule-domain17字节，抛出错误码11200302
	 */
	it('testHiSysEventBox17', 3, async function (done) {
		console.info('testHiSysEventBox17 start')
		try {
			hiSysEvent.subscribe([{
				domain: "RELIABILITYRELIAB",
				names: ["CPP_CRASH_NO_LOGCPP_CRASH_NO_LOG"]
			}])
			expect().assertFail()
			done();
		} catch (error) {
			console.error(`testHiSysEventBox17 error code: ${error.code}, error msg: ${error.message}`);
			expect(error.code == 11200302).assertTrue()
			console.info('testHiSysEventBox17 end')
			done();
		}
	})

	/**
	 * @tc.number DFX_DFT_HiSysevent_SandBox_1800
	 * @tc.name testHiSysEventBox18
	 * @tc.desc 验证调用subscribe接口，QueryRule-evetname33字节，抛出错误码11200302
	 */
	it('testHiSysEventBox18', 3, async function (done) {
		console.info('testHiSysEventBox18 start')
		try {
			hiSysEvent.subscribe([{
				domain: "RELIABILITYRELIA",
				names: ["CPP_CRASH_NO_LOGCPP_CRASH_NO_LOGC"]
			}])
			expect().assertFail()
			done();
		} catch (error) {
			console.error(`testHiSysEventBox18 error code: ${error.code}, error msg: ${error.message}`);
			expect(error.code == 11200302).assertTrue()
			console.info('testHiSysEventBox18 end')
			done();
		}
	})

	/**
	 * @tc.number DFX_DFT_HiSysevent_SandBox_1900
	 * @tc.name testHiSysEventBox19
	 * @tc.desc 验证调用subscribe接口，QueryRule-domain为空，抛出错误码11200302
	 */
	it('testHiSysEventBox19', 3, async function (done) {
		console.info('testHiSysEventBox19 start')
		try {
			hiSysEvent.subscribe([{
				domain: "",
				names: ["CPP_CRASH_NO_LOG"]
			}])
			expect().assertFail()
			done();
		} catch (error) {
			console.error(`testHiSysEventBox19 error code: ${error.code}, error msg: ${error.message}`);
			expect(error.code == 11200302).assertTrue()
			console.info('testHiSysEventBox19 end')
			done();
		}
	})

	/**
	 * @tc.number DFX_DFT_HiSysevent_SandBox_2000
	 * @tc.name testHiSysEventBox20
	 * @tc.desc 验证调用subscribe接口，QueryRule-evetname为空，抛出错误码11200302
	 */
	it('testHiSysEventBox20', 3, async function (done) {
		console.info('testHiSysEventBox20 start')
		try {
			hiSysEvent.subscribe([{
				domain: "RELIABILITY",
				names: [""]
			}])
			expect().assertFail()
			done();
		} catch (error) {
			console.error(`testHiSysEventBox20 error code: ${error.code}, error msg: ${error.message}`);
			expect(error.code == 11200302).assertTrue()
			console.info('testHiSysEventBox20 end')
			done();
		}
	})

	/**
	 * @tc.number DFX_DFT_HiSysevent_SandBox_2100
	 * @tc.name testHiSysEventBox21
	 * @tc.desc 验证调用subscribe接口，QueryRule-domain含有特殊字节，抛出错误码11200302
	 */
	it('testHiSysEventBox21', 3, async function (done) {
		console.info('testHiSysEventBox21 start')
		try {
			hiSysEvent.subscribe([{
				domain: "R?*ELIABILITY",
				names: ["CPP_CRASH_NO_LOG"]
			}])
			expect().assertFail()
			done();
		} catch (error) {
			console.error(`testHiSysEventBox21 error code: ${error.code}, error msg: ${error.message}`);
			expect(error.code == 11200302).assertTrue()
			console.info('testHiSysEventBox21 end')
			done();
		}
	})

	/**
	 * @tc.number DFX_DFT_HiSysevent_SandBox_2200
	 * @tc.name testHiSysEventBox22
	 * @tc.desc 验证调用subscribe接口，QueryRule-evetname含有特殊字节，抛出错误码11200302
	 */
	it('testHiSysEventBox22', 3, async function (done) {
		console.info('testHiSysEventBox22 start')
		try {
			hiSysEvent.subscribe([{
				domain: "RELIABILITY",
				names: ["C?*PP_CRASH_NO_LOG"]
			}])
			expect().assertFail()
			done();
		} catch (error) {
			console.error(`testHiSysEventBox22 error code: ${error.code}, error msg: ${error.message}`);
			expect(error.code == 11200302).assertTrue()
			console.info('testHiSysEventBox22 end')
			done();
		}
	})

	/**
	 * @tc.number DFX_DFT_HiSysevent_SandBox_2500
	 * @tc.name testHiSysEventBox25
	 * @tc.desc 验证无订阅，直接调用unsubscribe取消订阅，抛出错误码11200305
	 */
	it('testHiSysEventBox25', 3, async function (done) {
		console.info('testHiSysEventBox25 start')
		try {
			hiSysEvent.unsubscribe();
			expect().assertFail()
			done();
		} catch (error) {
			console.error(`testHiSysEventBox25 error code: ${error.code}, error msg: ${error.message}`);
			expect(error.code == 11200305).assertTrue()
			console.info('testHiSysEventBox25 end')
			done();
		}
	})
})
}
