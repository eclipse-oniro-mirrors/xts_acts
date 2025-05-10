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
import hiSysEvent from '@ohos.hiSysEvent'
import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect} from '@ohos/hypium'

export default function hiSysEventNormalTest() {
describe('hiSysEventNormalTest', function () {
    beforeAll(function() {
        console.info('hiSysEventNormalTest beforeAll called')
    })

    afterAll(function() {
        console.info('hiSysEventNormalTest afterAll called')
    })

    beforeEach(function() {
        console.info('hiSysEventNormalTest beforeEach called')
    })

    afterEach(function() {
        console.info('hiSysEventNormalTest afterEach called')
    })

	/**
	 * @tc.number DFX_DFT_HiSysEvent_JS_5800
	 * @tc.name testHiSysEventApi58
	 * @tc.desc 验证普通应用调用write接口使用callback方式进行回调处理，返回错误码202
	 */
	it('testHiSysEventApi58', 1, async function (done) {
		console.info('testHiSysEventApi58 start')
		try {
			hiSysEvent.write({
				domain: "RELIABILITY",
				name: "STACK",
				eventType: hiSysEvent.EventType.FAULT,
			},(err, val) => {
				if (err) {
					expect().assertFail();
					console.error('in testHiSysEventApi58 test callback: err.code = ' + err.code)
				} else {
					expect().assertFail();
					console.info('in testHiSysEventApi58 test callback: result = ' + val)
				}
			})
		} catch (err) {
			console.error(`testHiSysEventApi58 > error code: ${err.code}, error msg: ${err.message}`)
			expect(err.code == 202).assertTrue()
			console.info('testHiSysEventApi58 end')
			done()
		}
		console.info('testHiSysEventApi58 end')
	})

	/**
	 * @tc.number DFX_DFT_HiSysEvent_JS_5900
	 * @tc.name testHiSysEventApi59
	 * @tc.desc 验证普通应用调用write接口使用Promise方式进行回调处理，返回错误码202
	 */
	it('testHiSysEventApi59', 1, async function (done) {
		console.info('testHiSysEventApi59 start')
		try {
			hiSysEvent.write({
				domain: "RELIABILITY",
				name: "STACK",
				eventType: hiSysEvent.EventType.FAULT,
			}).then(
				(value) => {
					console.log(`HiSysEvent json-callback-success value=${value}`);
					expect().assertFail();
					done();
				}
			).catch(
				(err) => {
					console.error(`HiSysEvent json-callback-error code=${err.code}`);
					expect(err.code == 0).assertFail();
				}
			)
		} catch (err) {
			console.error(`testHiSysEventApi59 > error code: ${err.code}, error msg: ${err.message}`)
			expect(err.code == 202).assertTrue()
			console.info('testHiSysEventApi59 end')
			done()
		}
		console.info('testHiSysEventApi59 end')
	})

	/**
	 * @tc.number DFX_DFT_HiSysEvent_JS_6000
	 * @tc.name testHiSysEventApi60
	 * @tc.desc 验证普通应用调用订阅接口，规则为domain+eventName, rule=PREFIX，返回错误码202
	 */
	it('testHiSysEventApi60', 3, async function (done) {
		console.info('testHiSysEventApi60 start')
		let watcher = {
			rules: [{
				domain: "RELIABIL",
				name: "STACK",
				tag: "STABIL",
				ruleType: hiSysEvent.RuleType.PREFIX
			}],
			onEvent: (info) => {
				console.info(`testHiSysEventApi60: OnEvent...`)
				expect(Object.keys(info).length > 0).assertTrue()
				console.info(`testHiSysEventApi60: domain is : ${info.domain}, name is ${info.name},
				                                               eventType is ${info.eventType}`)
				if (info.params instanceof Object) {
					for (const key in info.params) {
						console.info(`testHiSysEventApi60: ${key}: ${info.params[key]}`)
					}
				}
			},
			onServiceDied: () => {
				console.info(`testHiSysEventApi60 Onservice died`);
			}
		}
		try {
			hiSysEvent.addWatcher(watcher)
			expect().assertFail();
			console.info('testHiSysEventApi60 end')
			done();
		} catch (err) {
			console.error(`testHiSysEventApi60 > error code: ${err.code}, error msg: ${err.message}`)
			expect(err.code == 202).assertTrue()
			console.info('testHiSysEventApi60 end')
			done()
		}
	})

	/**
	 * @tc.number DFX_DFT_HiSysEvent_JS_6100
	 * @tc.name testHiSysEventApi61
	 * @tc.desc 验证普通应用调用订阅接口，规则为domain+eventName, rule=REGULAR，返回错误码202
	 */
	it('testHiSysEventApi61', 3, async function (done) {
		console.info('testHiSysEventApi61 start')
		let watcher = {
			rules: [{
				domain: "RELIABIL\\w+",
				name: "STACK",
				ruleType: hiSysEvent.RuleType.REGULAR
			}],
			onEvent: (info) => {
				console.info(`testHiSysEventApi61: OnEvent...`)
				expect(Object.keys(info).length > 0).assertTrue()
				console.info(`testHiSysEventApi61: domain is : ${info.domain}, name is ${info.name},
				                                                               eventType is ${info.eventType}`)
				if (info.params instanceof Object) {
					for (const key in info.params) {
						console.info(`testHiSysEventApi61: ${key}: ${info.params[key]}`)
					}
				}
			},
			onServiceDied: () => {
				console.info(`testHiSysEventApi61 Onservice died`);
			}
		}
		try {
			hiSysEvent.addWatcher(watcher)
			expect().assertFail();
			console.info('testHiSysEventApi61 end')
			done();
		} catch (err) {
			console.error(`testHiSysEventApi61 > error code: ${err.code}, error msg: ${err.message}`)
			expect(err.code == 202).assertTrue()
			console.info('testHiSysEventApi61 end')
			done()
		}
	})

	/**
	 * @tc.number DFX_DFT_HiSysEvent_JS_6200
	 * @tc.name testHiSysEventApi62
	 * @tc.desc 验证普通应用调用订阅接口，规则为domain+eventName, rule=WHOLE_WORD，返回错误码202
	 */
	it('testHiSysEventApi62', 3, async function (done) {
		console.info('testHiSysEventApi62 start')
		let watcher = {
			rules: [{
				domain: "RELIABILITY",
				name: "STACK",
				ruleType: hiSysEvent.RuleType.WHOLE_WORD
			}],
			onEvent: (info) => {
				console.info(`testHiSysEventApi62: OnEvent...`)
				expect(Object.keys(info).length > 0).assertTrue()
				console.info(`testHiSysEventApi62: domain is : ${info.domain}, name is ${info.name},
				                                                               eventType is ${info.eventType}`)
				if (info.params instanceof Object) {
					for (const key in info.params) {
						console.info(`testHiSysEventApi62: ${key}: ${info.params[key]}`)
					}
				}
			},
			onServiceDied: () => {
				console.info(`testHiSysEventApi62 Onservice died`);
			}
		}
		try {
			hiSysEvent.addWatcher(watcher)
			expect().assertFail();
			console.info('testHiSysEventApi62 end')
			done();
		} catch (err) {
			console.error(`testHiSysEventApi62 > error code: ${err.code}, error msg: ${err.message}`)
			expect(err.code == 202)
			console.info('testHiSysEventApi62 end')
			done()
		}
	})

	/**
	 * @tc.number DFX_DFT_HiSysEvent_JS_6300
	 * @tc.name testHiSysEventApi63
	 * @tc.desc 验证普通应用调用订阅接口，规则为domain+eventName+tag, rule=PREFIX，返回错误码202
	 */
	it('testHiSysEventApi63', 3, async function (done) {
		console.info('testHiSysEventApi63 start')
		let watcher = {
			rules: [{
				domain: "RELIABIL",
				name: "STACK",
				tag: "STABILI",
				ruleType: hiSysEvent.RuleType.PREFIX
			}],
			onEvent: (info) => {
				console.info(`testHiSysEventApi63: OnEvent...`)
				expect(Object.keys(info).length > 0).assertTrue()
				console.info(`testHiSysEventApi63: domain is : ${info.domain}, name is ${info.name},
				                                   eventType is ${info.eventType}`)
				if (info.params instanceof Object) {
					for (const key in info.params) {
						console.info(`testHiSysEventApi63: ${key}: ${info.params[key]}`)
					}
				}
			},
			onServiceDied: () => {
				console.info(`testHiSysEventApi63 Onservice died`);
			}
		}
		try {
			hiSysEvent.addWatcher(watcher)
			expect().assertFail();
			console.info('testHiSysEventApi63 end')
			done();
		} catch (err) {
			console.error(`testHiSysEventApi63 > error code: ${err.code}, error msg: ${err.message}`)
			expect(err.code == 202).assertTrue()
			console.info('testHiSysEventApi63 end')
			done()
		}
	})

	/**
	 * @tc.number DFX_DFT_HiSysEvent_JS_6400
	 * @tc.name testHiSysEventApi64
	 * @tc.desc 验证普通应用调用订阅接口，规则为tag, rule=REGULAR，返回错误码202
	 */
	it('testHiSysEventApi64', 3, async function (done) {
		console.info('testHiSysEventApi64 start')
		let watcher = {
			rules: [{
				tag: "STABIL\\w+",
				ruleType: hiSysEvent.RuleType.REGULAR
			}],
			onEvent: (info) => {
				console.info(`testHiSysEventApi64: OnEvent...`)
				expect(Object.keys(info).length > 0).assertTrue()
				console.info(`testHiSysEventApi64: domain is : ${info.domain},
				              name is ${info.name}, eventType is ${info.eventType}`)
				if (info.params instanceof Object) {
					for (const key in info.params) {
						console.info(`testHiSysEventApi64: ${key}: ${info.params[key]}`)
					}
				}
			},
			onServiceDied: () => {
				console.info(`testHiSysEventApi64 Onservice died`);
			}
		}
		try {
			hiSysEvent.addWatcher(watcher)
			expect().assertFail();
			console.info('testHiSysEventApi64 end')
			done();
		} catch (err) {
			console.error(`testHiSysEventApi64 > error code: ${err.code}, error msg: ${err.message}`)
			expect(err.code == 202).assertTrue()
			console.info('testHiSysEventApi64 end')
			done()
		}
	})

	/**
	 * @tc.number DFX_DFT_HiSysEvent_JS_6500
	 * @tc.name testHiSysEventApi65
	 * @tc.desc 验证普通应用调用删除订阅接口，返回错误码202
	 */
	it('testHiSysEventApi65', 3, async function (done) {
		console.info('testHiSysEventApi18 start')
		let watcher = {
			rules: [{
				domain: "RELIABILITY",
				name: "STACK",
				ruleType: hiSysEvent.RuleType.PREFIX
			}],
			onEvent: (info) => {
				console.info(`testHiSysEventApi65: OnEvent...`)
				expect(Object.keys(info).length > 0).assertTrue()
				console.info(`testHiSysEventApi65: domain is : ${info.domain}, name is ${info.name},
				                                                               eventType is ${info.eventType}`)
				if (info.params instanceof Object) {
					for (const key in info.params) {
						console.info(`testHiSysEventApi65: ${key}: ${info.params[key]}`)
					}
				}
			},
			onServiceDied: () => {
				console.info(`testHiSysEventApi65 Onservice died`);
			}
		}
		setTimeout(() => {
			try {
				hiSysEvent.removeWatcher(watcher)
				expect().assertFail();
				console.info('testHiSysEventApi65 end')
				done();
			} catch (err) {
				console.error(`testHiSysEventApi65 > error code: ${err.code}, error msg: ${err.message}`)
				expect(err.code == 202).assertTrue()
				console.info('testHiSysEventApi65 end')
				done()
			}
        }, 1000)
	})

	/**
	 * @tc.number DFX_DFT_HiSysEvent_JS_6600
	 * @tc.name testHiSysEventApi66
	 * @tc.desc 验证普通应用调用查询订阅接口，返回错误码202
	 */
	it('testHiSysEventApi66', 1, async function (done) {
		console.info('testHiSysEventApi66 start')
		try {
			hiSysEvent.query({
				beginTime: -1,
				endTime: -1,
				maxEvents: 500000,
			}, [{
				domain: "RELIABILITY" ,
				names: ["STACK"],
			}], {
				onQuery: function (infos) {
				},
				onComplete: function(reason, total) {
					done()
				}
			})
			expect().assertFail()
		} catch (err) {
			console.error(`testHiSysEventApi66 > error code: ${err.code}, error msg: ${err.message}`)
			expect(err.code == 202).assertTrue()
			console.info('testHiSysEventApi66 end')
			done()
		}
	})

	/**
	 * @tc.number DFX_DFT_HiSysevent_SandBox_0100
	 * @tc.name testHiSysEventBox01
	 * @tc.desc 验证普通应用调用exportSysEvents接口，返回错误码202
	 */
	it('testHiSysEventBox01', 1, async function (done) {
		console.info('testHiSysEventBox01 start')
		try {
			hiSysEvent.exportSysEvents({
				beginTime: -1,
				endTime: -1,
				maxEvents: 1,
			}, [{
				domain: "RELIABILITY",
				names: ["STACK"],
			}])
			expect().assertFail()
			console.error('testHiSysEventBox01 error')
			done()
		} catch (err) {
			console.error(`testHiSysEventBox01 > error code: ${err.code}, error msg: ${err.message}`)
			expect(err.code == 202).assertTrue()
			console.info('testHiSysEventBox01 end')
			done()
		}
	})

	/**
	 * @tc.number DFX_DFT_HiSysevent_SandBox_0200
	 * @tc.name testHiSysEventBox02
	 * @tc.desc 验证普通应用调用subscribe接口，返回错误码202
	 */
	it('testHiSysEventBox02', 1, async function (done) {
		console.info('testHiSysEventBox02 start')
		try {
			hiSysEvent.subscribe([{
				domain: "RELIABILITY",
				names: ["STACK"],
			}])
			expect().assertFail()
			console.error('testHiSysEventBox02 error')
			done()
		} catch (err) {
			console.error(`testHiSysEventBox02 > error code: ${err.code}, error msg: ${err.message}`)
			expect(err.code == 202).assertTrue()
			console.info('testHiSysEventBox02 end')
			done()
		}
	})

	/**
	 * @tc.number DFX_DFT_HiSysevent_SandBox_0300
	 * @tc.name testHiSysEventBox03
	 * @tc.desc 验证普通应用调用unsubscribe接口，返回错误码202
	 */
	it('testHiSysEventBox03', 1, async function (done) {
		console.info('testHiSysEventBox03 start')
		try {
			hiSysEvent.unsubscribe();
			expect().assertFail()
			console.error('testHiSysEventBox03 error')
			done()
		} catch (err) {
			console.error(`testHiSysEventBox03 > error code: ${err.code}, error msg: ${err.message}`)
			expect(err.code == 202).assertTrue()
			console.info('testHiSysEventBox03 end')
			done()
		}
	})
})
}
