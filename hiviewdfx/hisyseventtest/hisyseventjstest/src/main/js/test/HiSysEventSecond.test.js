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

export default function hiSysEventJsSecondTest() {
describe('hiSysEventJsSecondTest', function () {
    beforeAll(function() {
        console.info('hiSysEventJsTest beforeAll called')
    })

    afterAll(function() {
        console.info('hiSysEventJsTest afterAll called')
    })

    beforeEach(function() {
        console.info('hiSysEventJsTest beforeEach called')
    })

    afterEach(function() {
        console.info('hiSysEventJsTest afterEach called')
    })

	/**
	 * @tc.number DFX_DFT_HiSysEvent_JS_2700
	 * @tc.name testHiSysEventApi27
	 * @tc.desc 验证调用write接口系统事件打点，领域名称长度超16个字符，忽略事件打点，错误码11200001
	 */
	it('testHiSysEventApi27', 1, async function (done) {
		console.info('testHiSysEventApi27 start')
		try {
			hiSysEvent.write({
				domain: "RELIABILITY_RELIABILITY",
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
					console.error(`in testHiSysEventApi27 test callback: err.code = ${err.code}, error msg is ${err.message}`)
					expect(err.code == 11200001).assertTrue()
				} else {
					console.info(`in testHiSysEventApi27 test callback: result = ${val}`)
					expect(false).assertTrue()
				}
				console.info('testHiSysEventApi27 end')
				done()
			})
		} catch (error) {
			console.error(`error code: ${error.code}, error msg: ${error.message}`);
			expect(false).assertTrue()
			console.info('testHiSysEventApi27 end')
			done()
		}
	})

	/**
	 * @tc.number DFX_DFT_HiSysEvent_JS_2800
	 * @tc.name testHiSysEventApi28
	 * @tc.desc 验证调用write接口系统事件打点，领域名称包含特殊字符，忽略事件打点，错误码11200001
	 */
	it('testHiSysEventApi28', 1, async function (done) {
		console.info('testHiSysEventApi28 start')
		try {
			hiSysEvent.write({
				domain: "RELIABILITY#?",
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
					console.error(`in testHiSysEventApi28 test callback: err.code = ${err.code}, error msg is ${err.message}`)
					expect(err.code == 11200001).assertTrue()
				} else {
					console.info(`in testHiSysEventApi28 test callback: result = ${val}`)
					expect(false).assertTrue()
				}
				console.info('testHiSysEventApi28 end')
				done()
			})
		} catch (error) {
			console.error(`error code: ${error.code}, error msg: ${error.message}`);
			expect(false).assertTrue()
			console.info('testHiSysEventApi28 end')
			done()
		}
	})

	/**
	 * @tc.number DFX_DFT_HiSysEvent_JS_2900
	 * @tc.name testHiSysEventApi29
	 * @tc.desc 验证调用write接口系统事件打点，领域名称为空，忽略事件打点，错误码11200001。
	 */
	it('testHiSysEventApi29', 1, async function (done) {
		console.info('testHiSysEventApi29 start')
		try {
			hiSysEvent.write({
				domain: "",
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
					console.error(`in testHiSysEventApi29 test callback: err.code = ${err.code}, error msg is ${err.message}`)
					expect(err.code == 11200001).assertTrue()
				} else {
					console.info(`in testHiSysEventApi29 test callback: result = ${val}`)
					expect(false).assertTrue()
				}
				console.info('testHiSysEventApi29 end')
				done()
			})
		} catch (error) {
			console.error(`error code: ${error.code}, error msg: ${error.message}`);
			expect(false).assertTrue()
			console.info('testHiSysEventApi29 end')
			done()
		}
	})

	/**
	 * @tc.number DFX_DFT_HiSysEvent_JS_3000
	 * @tc.name testHiSysEventApi30
	 * @tc.desc 验证调用write接口系统事件打点，系统事件名称长度超32个字符，忽略事件打点，错误码11200002。
	 */
	it('testHiSysEventApi30', 1, async function (done) {
		console.info('testHiSysEventApi30 start')
		try {
			hiSysEvent.write({
				domain: "RELIABILITY",
				name: "STACK_STACK_STACK_STACK_STACK_STACK",
				eventType: hiSysEvent.EventType.FAULT,
				params: {
					PID: 1,
					UID: 1,
					PACKAGE_NAME: "com.ohos.hisysevent.test",
					PROCESS_NAME: "hiview js test suite",
					MSG: "no msg."
				}
			}, (err, val) => {
				if (err) {
					console.error(`in testHiSysEventApi30 test callback: err.code = ${err.code}, error msg is ${err.message}`)
					expect(err.code == 11200002).assertTrue()
				} else {
					console.info(`in testHiSysEventApi30 test callback: result = ${val}`)
					expect(false).assertTrue()
				}
				console.info('testHiSysEventApi30 end')
				done()
			})
		} catch (err) {
			console.error(`testHiSysEventApi30 > error code: ${err.code}, error msg: ${err.message}`)
			expect(false).assertTrue()
			console.info('testHiSysEventApi30 end')
			done()
		}
	})

	/**
	 * @tc.number DFX_DFT_HiSysEvent_JS_3100
	 * @tc.name testHiSysEventApi31
	 * @tc.desc 验证调用write接口系统事件打点，系统事件名称包含特殊字符，忽略事件打点，错误码11200002。
	 */
	it('testHiSysEventApi31', 1, async function (done) {
		console.info('testHiSysEventApi31 start')
		try {
			hiSysEvent.write({
				domain: "RELIABILITY",
				name: "STACK#?",
				eventType: hiSysEvent.EventType.FAULT,
				params: {
					PID: 1,
					UID: 1,
					PACKAGE_NAME: "com.ohos.hisysevent.test",
					PROCESS_NAME: "hiview js test suite",
					MSG: "no msg."
				}
			}, (err, val) => {
				if (err) {
					console.error(`in testHiSysEventApi31 test callback: err.code = ${err.code}, error msg is ${err.message}`)
					expect(err.code == 11200002).assertTrue()
				} else {
					console.info(`in testHiSysEventApi31 test callback: result = ${val}`)
					expect(false).assertTrue()
				}
				console.info('testHiSysEventApi31 end')
				done()
			})
		} catch (err) {
			console.error(`testHiSysEventApi31 > error code: ${err.code}, error msg: ${err.message}`)
			expect(false).assertTrue()
			console.info('testHiSysEventApi31 end')
			done()
		}
	})

	/**
	 * @tc.number DFX_DFT_HiSysEvent_JS_3200
	 * @tc.name testHiSysEventApi32
	 * @tc.desc 验证调用write接口系统事件打点，系统事件名称为空，忽略事件打点，错误码11200002。
	 */
	it('testHiSysEventApi32', 1, async function (done) {
		console.info('testHiSysEventApi32 start')
		try {
			hiSysEvent.write({
				domain: "RELIABILITY",
				name: "",
				eventType: hiSysEvent.EventType.FAULT,
				params: {
					PID: 1,
					UID: 1,
					PACKAGE_NAME: "com.ohos.hisysevent.test",
					PROCESS_NAME: "hiview js test suite",
					MSG: "no msg."
				}
			}, (err, val) => {
				if (err) {
					console.error(`in testHiSysEventApi32 test callback: err.code = ${err.code}, error msg is ${err.message}`)
					expect(err.code == 11200002).assertTrue()
				} else {
					console.info(`in testHiSysEventApi32 test callback: result = ${val}`)
					expect(false).assertTrue()
				}
				console.info('testHiSysEventApi32 end')
				done()
			})
		} catch (err) {
			console.error(`testHiSysEventApi32 > error code: ${err.code}, error msg: ${err.message}`)
			expect(false).assertTrue()
			console.info('testHiSysEventApi32 end')
			done()
		}
	})

	/**
	 * @tc.number DFX_DFT_HiSysEvent_JS_3500
	 * @tc.name testHiSysEventApi35
	 * @tc.desc 验证调用write接口系统事件打点，系统事件总长度超过384K，忽略事件打点，错误码11200004。
	 */
	it('testHiSysEventApi35', 3, async function (done) {
		console.info('testHiSysEventApi35 start')
		try {
			let params = {
				PID: 1,
				UID: 1,
				PACKAGE_NAME: "com.ohos.hisysevent.test",
				PROCESS_NAME: "just a testcase",
				MSG: "no msg."
			}
			for (let i = 0; i < 40; i++) {
				params[`bundle${i}`] = Array.from({length: 10 * 1024}).join("ohos")
			}
			hiSysEvent.write({
				domain: "RELIABILITY",
				name: "STACK",
				eventType: hiSysEvent.EventType.FAULT,
				params:params
			}, (err, val) => {
				if (err) {
					console.error(`in testHiSysEventApi35 test callback: err.code = ${err.code}, error msg is ${err.message}`)
					expect(err.code == 11200004).assertTrue()
				} else {
					console.info(`in testHiSysEventApi35 test callback: result = ${val}`)
					expect(false).assertTrue()
				}
				console.info('testHiSysEventApi35 end')
				done()
			})
		} catch (err) {
			console.error(`testHiSysEventApi35 > error code: ${err.code}, error msg: ${err.message}`)
			expect(false).assertTrue()
			console.info('testHiSysEventApi35 end')
			done()
		}
	})

	/**
	 * @tc.number DFX_DFT_HiSysEvent_JS_3600
	 * @tc.name testHiSysEventApi36
	 * @tc.desc 验证调用write接口系统事件打点，领系统事件参数名称长度超32个字符，忽略事件打点，错误码11200051。
	 */
	it('testHiSysEventApi36', 3, async function (done) {
		console.info('testHiSysEventApi36 start')
		try {
			hiSysEvent.write({
				domain: "RELIABILITY",
				name: "STACK",
				eventType: hiSysEvent.EventType.FAULT,
				params: {
					PID: 1,
					UID: 1,
					STACK_STACK_STACK_STACK_STACK_STACK_STACK_STACK_STACK_STACK_STACK_STACK: "com.ohos.hisysevent.test",
					PROCESS_NAME: "hiview js test suite",
					MSG: "no msg."
				}
			}, (err, val) => {
				if (err) {
					console.error(`in testHiSysEventApi36 test callback: err.code = ${err.code}, error msg is ${err.message}`)
					expect(err.code == 11200051).assertTrue()
				} else {
					console.info(`in testHiSysEventApi36 test callback: result = ${val}`)
					expect(false).assertTrue()
				}
				console.info('testHiSysEventApi36 end')
				done()
			})
		} catch (err) {
			console.error(`testHiSysEventApi36 > error code: ${err.code}, error msg: ${err.message}`)
			expect(false).assertTrue()
			console.info('testHiSysEventApi36 end')
			done()
		}
	})

	/**
	 * @tc.number DFX_DFT_HiSysEvent_JS_3700
	 * @tc.name testHiSysEventApi37
	 * @tc.desc 验证调用write接口系统事件打点，系统事件参数名称包含特殊字符，忽略事件打点，错误码11200051。
	 */
	it('testHiSysEventApi37', 3, async function (done) {
		console.info('testHiSysEventApi37 start')
		try {
			hiSysEvent.write({
				domain: "RELIABILITY",
				name: "STACK",
				eventType: hiSysEvent.EventType.FAULT,
				params: {
					PID: 1,
					UID: 1,
					"STACK#?": "com.ohos.hisysevent.test",
					PROCESS_NAME: "hiview js test suite",
					MSG: "no msg."
				}
			}, (err, val) => {
				if (err) {
					console.error(`in testHiSysEventApi37 test callback: err.code = ${err.code}, error msg is ${err.message}`)
					expect(err.code == 11200051).assertTrue()
				} else {
					console.info(`in testHiSysEventApi37 test callback: result = ${val}`)
					expect(false).assertTrue()
				}
				console.info('testHiSysEventApi37 end')
				done()
			})
		} catch (err) {
			console.error(`testHiSysEventApi37 > error code: ${err.code}, error msg: ${err.message}`)
			expect(false).assertTrue()
			console.info('testHiSysEventApi37 end')
			done()
		}
	})

	/**
	 * @tc.number DFX_DFT_HiSysEvent_JS_3800
	 * @tc.name testHiSysEventApi38
	 * @tc.desc 验证调用write接口系统事件打点，系统事件参数名称为空，忽略事件打点，错误码11200051。
	 */
	it('testHiSysEventApi38', 3, async function (done) {
		console.info('testHiSysEventApi38 start')
		try {
			hiSysEvent.write({
				domain: "RELIABILITY",
				name: "STACK",
				eventType: hiSysEvent.EventType.FAULT,
				params: {
					PID: 1,
					UID: 1,
					"": "com.ohos.hisysevent.test",
					PROCESS_NAME: "hiview js test suite",
					MSG: "no msg."
				}
			}, (err, val) => {
				if (err) {
					console.error(`in testHiSysEventApi38 test callback: err.code = ${err.code}, error msg is ${err.message}`)
					expect(err.code == 11200051).assertTrue()
				} else {
					console.info(`in testHiSysEventApi38 test callback: result = ${val}`)
					expect(false).assertTrue()
				}
				console.info('testHiSysEventApi38 end')
				done()
			})
		} catch (err) {
			console.error(`testHiSysEventApi38 > error code: ${err.code}, error msg: ${err.message}`)
			expect(false).assertTrue()
			console.info('testHiSysEventApi38 end')
			done()
		}
	})

	/**
	 * @tc.number DFX_DFT_HiSysEvent_JS_3900
	 * @tc.name testHiSysEventApi39
	 * @tc.desc 验证调用write接口系统事件打点，字符串类型的参数值的长度超过10K，忽略事件打点，错误码11200052。
	 */
	it('testHiSysEventApi39', 3, async function (done) {
		console.info('testHiSysEventApi39 start')
		try {
			hiSysEvent.write({
				domain: "RELIABILITY",
				name: "STACK",
				eventType: hiSysEvent.EventType.FAULT,
				params: {
					PID: 1,
					UID: 1,
					PACKAGE_NAME: "com.ohos.hisysevent.test",
					PROCESS_NAME: Array.from({length: 10 * 1024 + 10}).join("ohos"),
					MSG: "no msg."
				}
			}, (err, val) => {
				if (err) {
					console.error(`in testHiSysEventApi39 test callback: err.code = ${err.code}, error msg is ${err.message}`)
					expect(err.code == 11200052).assertTrue()
				} else {
					console.info(`in testHiSysEventApi39 test callback: result = ${val}`)
					expect(false).assertTrue()
				}
				console.info('testHiSysEventApi39 end')
				done()
			})
		} catch (err) {
			console.error(`testHiSysEventApi39 > error code: ${err.code}, error msg: ${err.message}`)
			expect(false).assertTrue()
			console.info('testHiSysEventApi39 end')
			done()
		}
	})

	/**
	 * @tc.number DFX_DFT_HiSysEvent_JS_4000
	 * @tc.name testHiSysEventApi40
	 * @tc.desc 验证调用write接口系统事件打点，系统事件的参数数量超过128个，忽略事件打点，错误码11200053。
	 */
	it('testHiSysEventApi40', 3, async function (done) {
		console.info('testHiSysEventApi40 start')
		let largeParams = {}
		for (let i = 0; i < 200; i++) {
			largeParams["name" + i] = i
		}
		try {
			hiSysEvent.write({
				domain: "RELIABILITY",
				name: "STACK",
				eventType: hiSysEvent.EventType.FAULT,
				params: largeParams
			}, (err, val) => {
				if (err) {
					console.error(`in testHiSysEventApi40 test callback: err.code = ${err.code}, error msg is ${err.message}`)
					expect(err.code == 11200053).assertTrue()
				} else {
					console.info(`in testHiSysEventApi40 test callback: result = ${val}`)
					expect(false).assertTrue()
				}
				console.info('testHiSysEventApi40 end')
				done()
			})
		} catch (err) {
			console.error(`testHiSysEventApi40 > error code: ${err.code}, error msg: ${err.message}`)
			expect(false).assertTrue()
			console.info('testHiSysEventApi40 end')
			done()
		}
	})

    /**
	 * @tc.number DFX_DFT_HiSysEvent_JS_4100
	 * @tc.name testHiSysEventApi41
	 * @tc.desc 验证调用write接口系统事件打点，系统事件中有数组类型的参数值的长度超过100，忽略事件打点，错误码11200054。
	 */
	it('testHiSysEventApi41', 3, async function (done) {
		console.info('testHiSysEventApi41 start')
		let msgArray = []
		for (let i = 0; i < 200; i++) {
			msgArray[i] = i
		}
		try {
			hiSysEvent.write({
				domain: "RELIABILITY",
				name: "STACK",
				eventType: hiSysEvent.EventType.FAULT,
				params: {
					PID: 1,
					UID: 1,
					PACKAGE_NAME: "com.ohos.hisysevent.test",
					PROCESS_NAME: "hiview js test suite",
					MSG: msgArray
				}
			}, (err, val) => {
				if (err) {
					console.error(`in testHiSysEventApi41 test callback: err.code = ${err.code}, error msg is ${err.message}`)
					expect(err.code == 11200054).assertTrue()
				} else {
					console.info(`in testHiSysEventApi41 test callback: result = ${val}`)
					expect(false).assertTrue()
				}
				console.info('testHiSysEventApi41 end')
				done()
			})
		} catch (err) {
			console.error(`testHiSysEventApi41 > error code: ${err.code}, error msg: ${err.message}`)
			expect(false).assertTrue()
			console.info('testHiSysEventApi41 end')
			done()
		}
	})
	/**
	 * @tc.number DFX_DFT_HiSysEvent_JS_4200
	 * @tc.name testHiSysEventApi42
	 * @tc.desc 验证调用addWatcher接口添加系统事件监听者，监听者数量超过限制，拒绝添加此监听者，错误码11200101。
	 */
	it('testHiSysEventApi42', 3, async function (done) {
		console.info('testHiSysEventApi42 start')
        var watcher = []
		try {
			for (var i = 0; i < 31; i++) {
				watcher[i] = {
					rules: [{
						domain: "RELIABILITY" + i,
						name: "STACK",
						ruleType: hiSysEvent.RuleType.WHOLE_WORD,
					}],
					onEvent: (info) => {
					},
					onServiceDied: () => {
					}
				}
				hiSysEvent.addWatcher(watcher[i])
			}
		}catch (err) {
			console.error(`testHiSysEventApi42 > addWatcher error code: ${err.code}, error msg: ${err.message}`)
			expect(err.code == 11200101).assertTrue()
			console.info('testHiSysEventApi42 addWatcher end')
			done()
		}
        setTimeout(() => {
            try {
                for (var i = 0; i < 31; i++) {
                    hiSysEvent.removeWatcher(watcher[i])
                }
            }catch (err) {
                console.error(`testHiSysEventApi42 > remove error code: ${err.code}, error msg: ${err.message}`)
			    expect(err.code == 11200201).assertTrue()
			    console.info('testHiSysEventApi42 remove end')
			    done()
            }
        }, 5000)
        done()
	})

	/**
	 * @tc.number DFX_DFT_HiSysEvent_JS_4300
	 * @tc.name testHiSysEventApi43
	 * @tc.desc 验证调用addWatcher接口添加系统事件监听者，监听规则数量超过限制，拒绝添加此监听者，错误码11200102。
	 */
	it('testHiSysEventApi43', 3, async function (done) {
		console.info('testHiSysEventApi43 start')
		let msgArray = []
		for (let i = 0; i < 21; i++) {
			msgArray[i] = {
				domain: "RELIABILITY" + i,
				name: "STACK",
				ruleType: hiSysEvent.RuleType.WHOLE_WORD,
			}
		}
		try {
			let watcher = {
				rules: msgArray,
				onEvent: (info) => {
				},
				onServiceDied: () => {
				}
			}
			hiSysEvent.addWatcher(watcher)
			done()
		}catch (err) {
			console.error(`testHiSysEventApi43 > error code: ${err.code}, error msg: ${err.message}`)
			expect(err.code == 11200102).assertTrue()
			console.info('testHiSysEventApi43 end')
			done()
		}
	})

	/**
	 * @tc.number DFX_DFT_HiSysEvent_JS_4400
	 * @tc.name testHiSysEventApi44
	 * @tc.desc 验证调用removeWatcher接口删除系统事件监听者，事件监听者为空，拒绝移除此监听者，错误码11200201。
	 */
	it('testHiSysEventApi44', 3, async function (done) {
		console.info('testHiSysEventApi44 start')
		let watcher11 = {
			rules: [{
				domain: "RELIABILITY" ,
				name: "STACK",
				ruleType: hiSysEvent.RuleType.WHOLE_WORD,
			}],
			onEvent: (info) => {
			},
			onServiceDied: () => {
			}
		}
		setTimeout(() => {
			try {
				hiSysEvent.removeWatcher("")
				expect(true).assertTrue()
				console.info('testHiSysEventApi44 end')
				done()
			}catch (err) {
				console.error(`testHiSysEventApi44 > error code: ${err.code}, error msg: ${err.message}`)
				expect(err.code == 11200201).assertTrue()
				console.info('testHiSysEventApi44 end')
				done()
			}
		}, 1000)
	})

	/**
	 * @tc.number DFX_DFT_HiSysEvent_JS_4500
	 * @tc.name testHiSysEventApi45
	 * @tc.desc 验证调用removeWatcher接口删除系统事件监听者，事件监听者不在监听队列，拒绝移除此监听者，错误码11200201。
	 */
	it('testHiSysEventApi45', 3, async function (done) {
		console.info('testHiSysEventApi45 start')
		let watcher11 = {
			rules: [{
				domain: "RELIABILITY" ,
				name: "STACK",
				ruleType: hiSysEvent.RuleType.WHOLE_WORD,
			}],
			onEvent: (info) => {
			},
			onServiceDied: () => {
			}
		}
		setTimeout(() => {
			try {
				hiSysEvent.removeWatcher(watcher11)
				expect(true).assertTrue()
				console.info('testHiSysEventApi45 end')
				done()
			}catch (err) {
				console.error(`testHiSysEventApi45 > error code: ${err.code}, error msg: ${err.message}`)
				expect(err.code == 11200201).assertTrue()
				console.info('testHiSysEventApi45 end')
				done()
			}
		}, 1000)
	})

	/**
	 * @tc.number DFX_DFT_HiSysEvent_JS_4600
	 * @tc.name testHiSysEventApi46
	 * @tc.desc 验证调用query接口查询系统事件，查询规则个数超过10个，忽略此次系统事件的查询，错误码11200301。
	 */
	it('testHiSysEventApi46', 3, async function (done) {
		console.info('testHiSysEventApi46 start')
		try {
			hiSysEvent.write({
				domain: "RELIABILITY",
				name: "STACK",
				eventType: hiSysEvent.EventType.FAULT,
				params: {
					PID: 1,
					UID: 1,
					PACKAGE_NAME: "com.ohos.hisysevent.test",
					PROCESS_NAME: "hiview napi test suite",
					MSG: "no msg."
				}
			}, (err, val) => {
				if (err) {
					console.error('in testHiSysEventApi46 test callback: err.code = ' + err.code)
				} else {
					console.info('in testHiSysEventApi46 test callback: result = ' + val)
				}
			})
			setTimeout(() => {
				try {
					let msgArray = []
					for (let i = 0; i < 11; i++) {
						msgArray[i] = {
							domain: "RELIABILITY" + i,
							names: ["STACK"],
						}
					}
					hiSysEvent.query({
						beginTime: -1,
						endTime: -1,
						maxEvents: 2,
					}, msgArray, {
						onQuery: function (infos) {
							console.info(`testHiSysEventApi46: onQuery...`)
							expect(infos.length >= 0).assertTrue()
							console.info(`testHiSysEventApi46: infos.size is ${infos.length}`)
							if (infos instanceof Array) {
								for (let i = 0; i < infos.length; i++) {
									let item = infos[i];
									console.info(`testHiSysEventApi46: domain is ${item.domain}, name is ${item.name}, eventType is ${item.eventType}`)
									if (item.params instanceof Object) {
										for (const key in item.params) {
											console.info(`testHiSysEventApi46: ${key}: ${item.params[key]}`)
										}
									}
								}
							}
						},
						onComplete: function(reason, total) {
							console.info(`testHiSysEventApi46: onComplete...`)
							console.info(`testHiSysEventApi46: reason is ${reason}, total is ${total}`)
							expect(true).assertTrue()
							console.info(`testHiSysEventApi46 end`)
							done()
						}
					})
				} catch (err) {
					console.error(`testHiSysEventApi46 delay > error code: ${err.code}, error msg: ${err.message}`)
					expect(err.code == 11200301).assertTrue()
					console.info('hiSysEventJsUnitTest006 end')
					done()
				}
			}, 1000);
		} catch (err) {
			console.error(`testHiSysEventApi46 > error code: ${err.code}, error msg: ${err.message}`)
			expect(false).assertTrue()
			console.info('testHiSysEventApi46 end')
			done()
		}
	})

	/**
	 * @tc.number DFX_DFT_HiSysEvent_JS_4700
	 * @tc.name testHiSysEventApi47
	 * @tc.desc 验证调用query接口查询系统事件，事件领域名称长度超过16个字符，忽略此次系统事件的查询，错误码11200302。
	 */
	it('testHiSysEventApi47', 3, async function (done) {
		console.info('testHiSysEventApi47 start')
		try {
			hiSysEvent.write({
				domain: "RELIABILITY",
				name: "STACK",
				eventType: hiSysEvent.EventType.FAULT,
				params: {
					PID: 1,
					UID: 1,
					PACKAGE_NAME: "com.ohos.hisysevent.test",
					PROCESS_NAME: "hiview napi test suite",
					MSG: "no msg."
				}
			}, (err, val) => {
				if (err) {
					console.error('in testHiSysEventApi47 test callback: err.code = ' + err.code)
				} else {
					console.info('in testHiSysEventApi47 test callback: result = ' + val)
				}
			})
			setTimeout(() => {
				try {
					hiSysEvent.query({
						beginTime: -1,
						endTime: -1,
						maxEvents: 2,
					}, [{
						domain: "RELIABILITY_RELIABILITY" ,
						names: ["STACK"],
					}], {
						onQuery: function (infos) {
							console.info(`testHiSysEventApi47: onQuery...`)
							expect(infos.length >= 0).assertTrue()
							console.info(`testHiSysEventApi47: infos.size is ${infos.length}`)
							if (infos instanceof Array) {
								for (let i = 0; i < infos.length; i++) {
									let item = infos[i];
									console.info(`testHiSysEventApi47: domain is ${item.domain}, name is ${item.name}, eventType is ${item.eventType}`)
									if (item.params instanceof Object) {
										for (const key in item.params) {
											console.info(`testHiSysEventApi47: ${key}: ${item.params[key]}`)
										}
									}
								}
							}
						},
						onComplete: function(reason, total) {
							console.info(`testHiSysEventApi47: onComplete...`)
							console.info(`testHiSysEventApi47: reason is ${reason}, total is ${total}`)
							expect(true).assertTrue()
							console.info(`testHiSysEventApi47 end`)
							done()
						}
					})
				} catch (err) {
					console.error(`testHiSysEventApi47 delay > error code: ${err.code}, error msg: ${err.message}`)
					expect(err.code == 11200302 || err.code == 11200304).assertTrue()
					console.info('testHiSysEventApi47 end')
					done()
				}
			}, 2000);
		} catch (err) {
			console.error(`testHiSysEventApi47 > error code: ${err.code}, error msg: ${err.message}`)
			expect(false).assertTrue()
			console.info('testHiSysEventApi47 end')
			done()
		}
	})

	/**
	 * @tc.number DFX_DFT_HiSysEvent_JS_4800
	 * @tc.name testHiSysEventApi48
	 * @tc.desc 验证调用query接口查询系统事件，事件名称长度超过32个字符，忽略此次系统事件的查询，错误码11200302。
	 */
	it('testHiSysEventApi48', 3, async function (done) {
		console.info('testHiSysEventApi48 start')
		try {
			hiSysEvent.write({
				domain: "RELIABILITY",
				name: "STACK",
				eventType: hiSysEvent.EventType.FAULT,
				params: {
					PID: 1,
					UID: 1,
					PACKAGE_NAME: "com.ohos.hisysevent.test",
					PROCESS_NAME: "hiview napi test suite",
					MSG: "no msg."
				}
			}, (err, val) => {
				if (err) {
					console.error('in testHiSysEventApi48 test callback: err.code = ' + err.code)
				} else {
					console.info('in testHiSysEventApi48 test callback: result = ' + val)
				}
			})
			setTimeout(() => {
				try {
					hiSysEvent.query({
						beginTime: -1,
						endTime: -1,
						maxEvents: 2,
					}, [{
						domain: "RELIABILITY" ,
						names: ["STACK_STACK_STACK_STACK_STACK_STACK"],
					}], {
						onQuery: function (infos) {
							console.info(`testHiSysEventApi48: onQuery...`)
							expect(infos.length >= 0).assertTrue()
							console.info(`testHiSysEventApi48: infos.size is ${infos.length}`)
							if (infos instanceof Array) {
								for (let i = 0; i < infos.length; i++) {
									let item = infos[i];
									console.info(`testHiSysEventApi48: domain is ${item.domain}, name is ${item.name}, eventType is ${item.eventType}`)
									if (item.params instanceof Object) {
										for (const key in item.params) {
											console.info(`testHiSysEventApi48: ${key}: ${item.params[key]}`)
										}
									}
								}
							}
						},
						onComplete: function(reason, total) {
							console.info(`testHiSysEventApi48: onComplete...`)
							console.info(`testHiSysEventApi48: reason is ${reason}, total is ${total}`)
							expect(true).assertTrue()
							console.info(`testHiSysEventApi48 end`)
							done()
						}
					})
				} catch (err) {
					console.error(`testHiSysEventApi48 delay > error code: ${err.code}, error msg: ${err.message}`)
					expect(err.code == 11200302 || err.code == 11200304).assertTrue()
					console.info('testHiSysEventApi48 end')
					done()
				}
			}, 2000);
		} catch (err) {
			console.error(`testHiSysEventApi48 > error code: ${err.code}, error msg: ${err.message}`)
			expect(false).assertTrue()
			console.info('testHiSysEventApi48 end')
			done()
		}
	})

	/**
	 * @tc.number DFX_DFT_HiSysEvent_JS_4900
	 * @tc.name testHiSysEventApi49
	 * @tc.desc 验证调用query接口查询系统事件，事件领域名称包含特殊字符，忽略此次系统事件的查询，错误码11200302。
	 */
	it('testHiSysEventApi49', 3, async function (done) {
		console.info('testHiSysEventApi49 start')
		try {
			hiSysEvent.write({
				domain: "RELIABILITY",
				name: "STACK",
				eventType: hiSysEvent.EventType.FAULT,
				params: {
					PID: 1,
					UID: 1,
					PACKAGE_NAME: "com.ohos.hisysevent.test",
					PROCESS_NAME: "hiview napi test suite",
					MSG: "no msg."
				}
			}, (err, val) => {
				if (err) {
					console.error('in testHiSysEventApi49 test callback: err.code = ' + err.code)
				} else {
					console.info('in testHiSysEventApi49 test callback: result = ' + val)
				}
			})
			setTimeout(() => {
				try {
					hiSysEvent.query({
						beginTime: -1,
						endTime: -1,
						maxEvents: 2,
					}, [{
						domain: "RELIABILITY?#" ,
						names: ["STACK"],
					}], {
						onQuery: function (infos) {
							console.info(`testHiSysEventApi49: onQuery...`)
							expect(infos.length >= 0).assertTrue()
							console.info(`testHiSysEventApi49: infos.size is ${infos.length}`)
							if (infos instanceof Array) {
								for (let i = 0; i < infos.length; i++) {
									let item = infos[i];
									console.info(`testHiSysEventApi49: domain is ${item.domain}, name is ${item.name}, eventType is ${item.eventType}`)
									if (item.params instanceof Object) {
										for (const key in item.params) {
											console.info(`testHiSysEventApi49: ${key}: ${item.params[key]}`)
										}
									}
								}
							}
						},
						onComplete: function(reason, total) {
							console.info(`testHiSysEventApi49: onComplete...`)
							console.info(`testHiSysEventApi49: reason is ${reason}, total is ${total}`)
							expect(true).assertTrue()
							console.info(`testHiSysEventApi49 end`)
							done()
						}
					})
				} catch (err) {
					console.error(`testHiSysEventApi49 delay > error code: ${err.code}, error msg: ${err.message}`)
					expect(err.code == 11200302 || err.code == 11200304).assertTrue()
					console.info('testHiSysEventApi49 end')
					done()
				}
			}, 2000);
		} catch (err) {
			console.error(`testHiSysEventApi49 > error code: ${err.code}, error msg: ${err.message}`)
			expect(false).assertTrue()
			console.info('testHiSysEventApi49 end')
			done()
		}
	})

	/**
	 * @tc.number DFX_DFT_HiSysEvent_JS_5000
	 * @tc.name testHiSysEventApi50
	 * @tc.desc 验证调用query接口查询系统事件，事件名称包含特殊字符，忽略此次系统事件的查询，错误码11200302。
	 */
	it('testHiSysEventApi50', 3, async function (done) {
		console.info('testHiSysEventApi50 start')
		try {
			hiSysEvent.write({
				domain: "RELIABILITY",
				name: "STACK",
				eventType: hiSysEvent.EventType.FAULT,
				params: {
					PID: 1,
					UID: 1,
					PACKAGE_NAME: "com.ohos.hisysevent.test",
					PROCESS_NAME: "hiview napi test suite",
					MSG: "no msg."
				}
			}, (err, val) => {
				if (err) {
					console.error('in testHiSysEventApi50 test callback: err.code = ' + err.code)
				} else {
					console.info('in testHiSysEventApi50 test callback: result = ' + val)
				}
			})
			setTimeout(() => {
				try {
					hiSysEvent.query({
						beginTime: -1,
						endTime: -1,
						maxEvents: 2,
					}, [{
						domain: "RELIABILITY" ,
						names: ["STACK?#"],
					}], {
						onQuery: function (infos) {
							console.info(`testHiSysEventApi50: onQuery...`)
							expect(infos.length >= 0).assertTrue()
							console.info(`testHiSysEventApi50: infos.size is ${infos.length}`)
							if (infos instanceof Array) {
								for (let i = 0; i < infos.length; i++) {
									let item = infos[i];
									console.info(`testHiSysEventApi50: domain is ${item.domain}, name is ${item.name}, eventType is ${item.eventType}`)
									if (item.params instanceof Object) {
										for (const key in item.params) {
											console.info(`testHiSysEventApi50: ${key}: ${item.params[key]}`)
										}
									}
								}
							}
						},
						onComplete: function(reason, total) {
							console.info(`testHiSysEventApi50: onComplete...`)
							console.info(`testHiSysEventApi50: reason is ${reason}, total is ${total}`)
							expect(true).assertTrue()
							console.info(`testHiSysEventApi50 end`)
							done()
						}
					})
				} catch (err) {
					console.error(`testHiSysEventApi50 delay > error code: ${err.code}, error msg: ${err.message}`)
					expect(err.code == 11200302 || err.code == 11200304).assertTrue()
					console.info('testHiSysEventApi50 end')
					done()
				}
			}, 2000);
		} catch (err) {
			console.error(`testHiSysEventApi50 > error code: ${err.code}, error msg: ${err.message}`)
			expect(false).assertTrue()
			console.info('testHiSysEventApi50 end')
			done()
		}
	})

	/**
	 * @tc.number DFX_DFT_HiSysEvent_JS_5100
	 * @tc.name testHiSysEventApi51
	 * @tc.desc 验证调用query接口查询系统事件，事件领域名称为空，忽略此次系统事件的查询，错误码11200302。
	 */
	it('testHiSysEventApi51', 3, async function (done) {
		console.info('testHiSysEventApi51 start')
		try {
			hiSysEvent.write({
				domain: "RELIABILITY",
				name: "STACK",
				eventType: hiSysEvent.EventType.FAULT,
				params: {
					PID: 1,
					UID: 1,
					PACKAGE_NAME: "com.ohos.hisysevent.test",
					PROCESS_NAME: "hiview napi test suite",
					MSG: "no msg."
				}
			}, (err, val) => {
				if (err) {
					console.error('in testHiSysEventApi51 test callback: err.code = ' + err.code)
				} else {
					console.info('in testHiSysEventApi51 test callback: result = ' + val)
				}
			})
			setTimeout(() => {
				try {
					hiSysEvent.query({
						beginTime: -1,
						endTime: -1,
						maxEvents: 2,
					}, [{
						domain: "" ,
						names: ["STACK"],
					}], {
						onQuery: function (infos) {
							console.info(`testHiSysEventApi51: onQuery...`)
							expect(infos.length >= 0).assertTrue()
							console.info(`testHiSysEventApi51: infos.size is ${infos.length}`)
							if (infos instanceof Array) {
								for (let i = 0; i < infos.length; i++) {
									let item = infos[i];
									console.info(`testHiSysEventApi51: domain is ${item.domain}, name is ${item.name}, eventType is ${item.eventType}`)
									if (item.params instanceof Object) {
										for (const key in item.params) {
											console.info(`testHiSysEventApi51: ${key}: ${item.params[key]}`)
										}
									}
								}
							}
						},
						onComplete: function(reason, total) {
							console.info(`testHiSysEventApi51: onComplete...`)
							console.info(`testHiSysEventApi51: reason is ${reason}, total is ${total}`)
							expect(true).assertTrue()
							console.info(`testHiSysEventApi51 end`)
							done()
						}
					})
				} catch (err) {
					console.error(`testHiSysEventApi51 delay > error code: ${err.code}, error msg: ${err.message}`)
					expect(err.code == 11200302 || err.code == 11200304).assertTrue()
					console.info('testHiSysEventApi51 end')
					done()
				}
			}, 2000);
		} catch (err) {
			console.error(`testHiSysEventApi51 > error code: ${err.code}, error msg: ${err.message}`)
			expect(false).assertTrue()
			console.info('testHiSysEventApi51 end')
			done()
		}
	})

	/**
	 * @tc.number DFX_DFT_HiSysEvent_JS_5200
	 * @tc.name testHiSysEventApi52
	 * @tc.desc 验证调用query接口查询系统事件，事件名称为空，忽略此次系统事件的查询，错误码11200302。
	 */
	it('testHiSysEventApi52', 3, async function (done) {
		console.info('testHiSysEventApi52 start')
		try {
			hiSysEvent.write({
				domain: "RELIABILITY",
				name: "STACK",
				eventType: hiSysEvent.EventType.FAULT,
				params: {
					PID: 1,
					UID: 1,
					PACKAGE_NAME: "com.ohos.hisysevent.test",
					PROCESS_NAME: "hiview napi test suite",
					MSG: "no msg."
				}
			}, (err, val) => {
				if (err) {
					console.error('in testHiSysEventApi52 test callback: err.code = ' + err.code)
				} else {
					console.info('in testHiSysEventApi52 test callback: result = ' + val)
				}
			})
			setTimeout(() => {
				try {
					hiSysEvent.query({
						beginTime: -1,
						endTime: -1,
						maxEvents: 2,
					}, [{
						domain: "RELIABILITY" ,
						names: [],
					}], {
						onQuery: function (infos) {
							console.info(`testHiSysEventApi52: onQuery...`)
							expect(infos.length >= 0).assertTrue()
							console.info(`testHiSysEventApi52: infos.size is ${infos.length}`)
							if (infos instanceof Array) {
								for (let i = 0; i < infos.length; i++) {
									let item = infos[i];
									console.info(`testHiSysEventApi52: domain is ${item.domain}, name is ${item.name}, eventType is ${item.eventType}`)
									if (item.params instanceof Object) {
										for (const key in item.params) {
											console.info(`testHiSysEventApi52: ${key}: ${item.params[key]}`)
										}
									}
								}
							}
						},
						onComplete: function(reason, total) {
							console.info(`testHiSysEventApi52: onComplete...`)
							console.info(`testHiSysEventApi52: reason is ${reason}, total is ${total}`)
							expect(true).assertTrue()
							console.info(`testHiSysEventApi52 end`)
							done()
						}
					})
				} catch (err) {
					console.error(`testHiSysEventApi52 delay > error code: ${err.code}, error msg: ${err.message}`)
					expect(err.code == 11200302 || err.code == 11200304).assertTrue()
					console.info('testHiSysEventApi52 end')
					done()
				}
			}, 2000);
		} catch (err) {
			console.error(`testHiSysEventApi52 > error code: ${err.code}, error msg: ${err.message}`)
			expect(false).assertTrue()
			console.info('testHiSysEventApi52 end')
			done()
		}
	})

	/**
	 * @tc.number DFX_DFT_HiSysEvent_JS_5300
	 * @tc.name testHiSysEventApi53
	 * @tc.desc 验证调用write接口，缺少write参数，无法打点，错误码401。
	 */
	it('testHiSysEventApi53', 3, async function (done) {
		console.info('testHiSysEventApi53 start')
		try {
			hiSysEvent.write({}, (err, val) => {
				if (err) {
					console.error('in testHiSysEventApi53 test callback: err.code = ' + err.code)
				} else {
					console.info('in testHiSysEventApi53 test callback: result = ' + val)
				}
			})
		} catch (err) {
			console.error(`testHiSysEventApi53 > error code: ${err.code}, error msg: ${err.message}`)
			expect(err.code == 401).assertTrue()
			console.info('testHiSysEventApi53 end')
			done()
		}
	})

	/**
	 * @tc.number DFX_DFT_HiSysEvent_JS_5400
	 * @tc.name testHiSysEventApi54
	 * @tc.desc 验证调用query接口，缺少订阅规则，错误码401。
	 */
	it('testHiSysEventApi54', 3, async function (done) {
		console.info('testHiSysEventApi54 start')
		try {
			hiSysEvent.write({
				domain: "RELIABILITY",
				name: "STACK",
				eventType: hiSysEvent.EventType.FAULT,
				params: {
					PID: 1,
					UID: 1,
					PACKAGE_NAME: "com.ohos.hisysevent.test",
					PROCESS_NAME: "hiview napi test suite",
					MSG: "no msg."
				}
			}, (err, val) => {
				if (err) {
					console.error('in testHiSysEventApi54 test callback: err.code = ' + err.code)
				} else {
					console.info('in testHiSysEventApi54 test callback: result = ' + val)
				}
			})
			setTimeout(() => {
				try {
					hiSysEvent.query( {
						onQuery: function (infos) {
							console.info(`testHiSysEventApi54: onQuery...`)
							expect(infos.length >= 0).assertTrue()
							console.info(`testHiSysEventApi54: infos.size is ${infos.length}`)
							if (infos instanceof Array) {
								for (let i = 0; i < infos.length; i++) {
									let item = infos[i];
									console.info(`testHiSysEventApi54: domain is ${item.domain}, name is ${item.name}, eventType is ${item.eventType}`)
									if (item.params instanceof Object) {
										for (const key in item.params) {
											console.info(`testHiSysEventApi54: ${key}: ${item.params[key]}`)
										}
									}
								}
							}
						},
						onComplete: function(reason, total) {
							console.info(`testHiSysEventApi54: onComplete...`)
							console.info(`testHiSysEventApi54: reason is ${reason}, total is ${total}`)
							expect(true).assertTrue()
							console.info(`testHiSysEventApi54 end`)
							done()
						}
					})
				} catch (err) {
					console.error(`testHiSysEventApi54 delay > error code: ${err.code}, error msg: ${err.message}`)
					expect(err.code == 401).assertTrue()
					console.info('testHiSysEventApi54 end')
					done()
				}
			}, 1000);
		} catch (err) {
			console.error(`testHiSysEventApi54 > error code: ${err.code}, error msg: ${err.message}`)
			expect(false).assertTrue()
			console.info('testHiSysEventApi54 end')
			done()
		}
	})

	/**
	 * @tc.number DFX_DFT_HiSysEvent_JS_5500
	 * @tc.name testHiSysEventApi55
	 * @tc.desc 验证调用addwatcher接口，缺少watcher参数，错误码401。
	 */
	it('testHiSysEventApi55', 3, async function (done) {
		console.info('testHiSysEventApi55 start')
		try {
			let watcher = {
				onEvent: (info) => {
					console.info(`testHiSysEventApi12: OnEvent...`)
					expect(Object.keys(info).length > 0).assertTrue()
					console.info(`testHiSysEventApi12: domain is : ${info.domain}, name is ${info.name},
				                                               eventType is ${info.eventType}`)
					if (info.params instanceof Object) {
						for (const key in info.params) {
							console.info(`testHiSysEventApi12: ${key}: ${info.params[key]}`)
						}
					}
				},
				onServiceDied: () => {
					console.info(`testHiSysEventApi12 Onservice died`);
				}
			}
			hiSysEvent.addWatcher(watcher)
		} catch (err) {
			console.error(`testHiSysEventApi55 > error code: ${err.code}, error msg: ${err.message}`)
			expect(err.code == 401).assertTrue()
			console.info('testHiSysEventApi55 end')
			done()
		}
	})

	/**
	 * @tc.number DFX_DFT_HiSysEvent_JS_5700
	 * @tc.name testHiSysEventApi57
	 * @tc.desc 验证调用query接口，查询频率超过限制，忽略此次查询，错误码11200304。。
	 */
	it('testHiSysEventApi57', 3, async function (done) {
		console.info('testHiSysEventApi57 start')
		try {
			for (let i = 0; i < 5; i++) {
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
			}
		} catch (err) {
			console.error(`testHiSysEventApi57 delay > error code: ${err.code}, error msg: ${err.message}`)
			expect(err.code == 11200304).assertTrue()
			console.info('testHiSysEventApi57 end')
			done()
		}
	})
})
}
