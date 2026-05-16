import { webview } from '@kit.ArkWeb'
import { fileIo as fs } from '@kit.CoreFileKit'
import events_emitter from '@ohos.events.emitter';
import Utils from '../../test/Utils.test';
import { Driver, MouseButton, ON, On } from '@kit.TestKit';
let driver = Driver.create();
const EVENT_ID_SET_SUITE_KEY = 183129;

@Entry
@Component
struct Summarizer {
  controller: webview.WebviewController = new webview.WebviewController()
  @State str: string = ""
  @State isReceive: number = -1;
  @State isPageEnd: number = -1;

  
  onPageShow() {
    let valueChangeEvent: events_emitter.InnerEvent = {
      eventId: EVENT_ID_SET_SUITE_KEY,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(valueChangeEvent, this.valueChangeCallBack)
  }

  onPageHide() {
    events_emitter.off(EVENT_ID_SET_SUITE_KEY)
  }


  private valueChangeCallBack = (eventData: events_emitter.EventData) => {
    console.info("web page valueChangeCallBack");
    if (eventData != null) {
      console.info("valueChangeCallBack:" + JSON.stringify(eventData));
      if (eventData.data != null && eventData.data.ACTION != null) {
        this.str = eventData.data.ACTION;
        this.isReceive = 1;
      }
    }
  }

  transmitText(
    text: string,
    callback: (char: string) => void,
    finCallback: () => void,
    delay: number = 10
  ): void {
    let index = 0;

    const interval = setInterval(() => {
      if (index >= text.length) {
        finCallback();
        clearInterval(interval);
        return;
      }

      callback(text[index]);
      index++;
    }, delay);
  }

  languageModel: AISessionEvent = {
    aiSessionType: AISessionType.PROMPT,
    onCreateAISession: (id: string, params: string, result: OnAISessionCallback): boolean => {
      Utils.emitEvent('onCreateAISession', 20250420);
      console.info(`lichenwei: PROMPT onCreateAISession, id = ${id}, params = ${params}`)
      setTimeout(() => {
        result(AISessionResultType.SUCCESS, 'lichenwei: PROMPT onCreateAISession, success')
      }, 1000)
      return true
    },
    onExecuteAIAction: (id: string, params: string, result: OnAISessionCallback): void => {
      Utils.emitEvent('onExecuteAIAction', 20250421);
      console.info(`lichenwei: PROMPT onExecuteAIAction, id = ${id}, params = ${params}`)
      this.transmitText(`LLM：${params}`,
        (char: string) => {
          result(AISessionResultType.RUNNING, char);
        },
        () => {
          result(AISessionResultType.SUCCESS, "");
        });
    },
    onDestroyAISession: (id: string): void => {
      Utils.emitEvent('onDestroyAIAction', 20250422);
      setTimeout(() => {
        console.info(`lichenwei: PROMPT onDestroyAISession, id = ${id}`)
      }, 1000)
    }
  }
  languageDetector: AISessionEvent = {
    aiSessionType: AISessionType.LANGUAGE_DETECTOR,
    onCreateAISession: (id: string, params: string, result: OnAISessionCallback): boolean => {
      Utils.emitEvent('onCreateAISession', 20250423);
      console.info(`lichenwei: LANGUAGE_DETECTOR onCreateAISession, id = ${id}, params = ${params}`)
      setTimeout(() => {
        result(AISessionResultType.SUCCESS, 'lichenwei: LANGUAGE_DETECTOR onCreateAISession, success')
      }, 1000)
      return true
    },
    onExecuteAIAction: (id: string, params: string, result: OnAISessionCallback): void => {
      console.info(`lichenwei: LANGUAGE_DETECTOR onExecuteAIAction, id = ${id}, params = ${params}`)
      result(AISessionResultType.SUCCESS, `[{"language": "en", "score": 0.689}, {"language": "zh", "score": 0.310}]`);
    },
    onDestroyAISession: (id: string): void => {
      Utils.emitEvent('onDestroyAISession', 20250424);
      console.info(`lichenwei: LANGUAGE_DETECTOR onDestroyAISession, id = ${id}`)
    }
  }
  proofreader: AISessionEvent = {
    aiSessionType: AISessionType.PROOFREADER,
    onCreateAISession: (id: string, params: string, result: OnAISessionCallback): boolean => {
      Utils.emitEvent('onCreateAISession', 20250425);
      console.info(`lichenwei: PROOFREADER onCreateAISession, id = ${id}, params = ${params}`)
      setTimeout(() => {
        result(AISessionResultType.SUCCESS, 'lichenwei: PROOFREADER onCreateAISession, success')
      }, 1000)
      return true
    },
    onExecuteAIAction: (id: string, params: string, result: OnAISessionCallback): void => {
      console.info(`lichenwei: PROOFREADER onExecuteAIAction, id = ${id}, params = ${params}`)
      let obj = JSON.parse(params) as object
      if (obj['correctedInput'] && obj['correction']) {
        result(AISessionResultType.SUCCESS, `{"label": "Spelling"}`);
      } else {
        this.transmitText(`校对：${params}`,
          (char: string) => {
            result(AISessionResultType.RUNNING, char);
          },
          () => {
            result(AISessionResultType.SUCCESS, "");
          });
      }
    },
    onDestroyAISession: (id: string): void => {
      Utils.emitEvent('onDestroyAISession', 20250426);
      console.info(`lichenwei: PROOFREADER onDestroyAISession, id = ${id}`)
    }
  }
  writer: AISessionEvent = {
    aiSessionType: AISessionType.WRITER,
    onCreateAISession: (id: string, params: string, result: OnAISessionCallback): boolean => {
      Utils.emitEvent('onCreateAISession', 20250427);
      console.info(`lichenwei: WRITER onCreateAISession, id = ${id}, params = ${params}`)
      setTimeout(() => {
        result(AISessionResultType.SUCCESS, 'lichenwei: WRITER onCreateAISession, success')
      }, 1000)
      return true
    },
    onExecuteAIAction: (id: string, params: string, result: OnAISessionCallback): void => {
      console.info(`lichenwei: WRITER onExecuteAIAction, id = ${id}, params = ${params}`)
      this.transmitText(`写作：${params}`,
        (char: string) => {
          result(AISessionResultType.RUNNING, char);
        },
        () => {
          result(AISessionResultType.SUCCESS, "");
        });
    },
    onDestroyAISession: (id: string): void => {
      Utils.emitEvent('onDestroyAISession', 20250428);
      console.info(`lichenwei: WRITER onDestroyAISession, id = ${id}`)
    }
  }
  rewriter: AISessionEvent = {
    aiSessionType: AISessionType.REWRITER,
    onCreateAISession: (id: string, params: string, result: OnAISessionCallback): boolean => {
      Utils.emitEvent('onCreateAISession', 20250429);
      console.info(`lichenwei: REWRITER onCreateAISession, id = ${id}, params = ${params}`)
      setTimeout(() => {
        result(AISessionResultType.SUCCESS, 'lichenwei: REWRITER onCreateAISession, success')
      }, 1000)
      return true
    },
    onExecuteAIAction: (id: string, params: string, result: OnAISessionCallback): void => {
      console.info(`lichenwei: REWRITER onExecuteAIAction, id = ${id}, params = ${params}`)
      this.transmitText(`总结：${params}`,
        (char: string) => {
          result(AISessionResultType.RUNNING, char);
        },
        () => {
          result(AISessionResultType.SUCCESS, "");
        });
    },
    onDestroyAISession: (id: string): void => {
      Utils.emitEvent('onDestroyAISession', 20250430);
      console.info(`lichenwei: REWRITER onDestroyAISession, id = ${id}`)
    }
  }
  translator: AISessionEvent = {
    aiSessionType: AISessionType.TRANSLATOR,
    onCreateAISession: (id: string, params: string, result: OnAISessionCallback): boolean => {
      console.info(`lichenwei: TRANSLATOR onCreateAISession, id = ${id}, params = ${params}`)
      setTimeout(() => {
        result(AISessionResultType.SUCCESS, 'lichenwei: TRANSLATOR onCreateAISession, success')
      }, 1000)
      return true
    },
    onExecuteAIAction: (id: string, params: string, result: OnAISessionCallback): void => {
      Utils.emitEvent('onExecuteAIAction', 20250431);
      console.info(`lichenwei: TRANSLATOR onExecuteAIAction, id = ${id}, params = ${params}`)
      this.transmitText(`翻译：${params}`,
        (char: string) => {
          result(AISessionResultType.RUNNING, char);
        },
        () => {
          result(AISessionResultType.SUCCESS, "");
        });
    },
    onDestroyAISession: (id: string): void => {
      console.info(`lichenwei: TRANSLATOR onDestroyAISession, id = ${id}`)
    }
  }
  summarizer: AISessionEvent = {
    aiSessionType: AISessionType.SUMMARIZER,
    onCreateAISession: (id: string, params: string, result: OnAISessionCallback): boolean => {
      Utils.emitEvent('onCreateAISession', 20250432);
      console.info(`lichenwei: SUMMARIZER onCreateAISession, id = ${id}, params = ${params}`)
      setTimeout(() => {
        result(AISessionResultType.SUCCESS, 'lichenwei: SUMMARIZER onCreateAISession, success')
      }, 1000)
      return true
    },
    onExecuteAIAction: (id: string, params: string, result: OnAISessionCallback): void => {
      console.info(`lichenwei: SUMMARIZER onExecuteAIAction, id = ${id}, params = ${params}`)
      this.transmitText(`总结：${params}`,
        (char: string) => {
          result(AISessionResultType.RUNNING, char);
        },
        () => {
          result(AISessionResultType.SUCCESS, "");
        });
    },
    onDestroyAISession: (id: string): void => {
      Utils.emitEvent('onDestroyAISession', 20250433);
      console.info(`lichenwei: SUMMARIZER onDestroyAISession, id = ${id}`)
    }
  }

  build() {
    Column() {
      Row() {
        Button("WebViewController click").key('WebViewAiSessionOptionsButton').onClick(async () => {
          console.info("key==>" + this.str)
          await Utils.waitForExist(()=>this.isReceive, this.str+' isReceive', 1, 1000);
          await Utils.waitForExist(()=>this.isPageEnd, this.str+' isPageEnd', 1, 1000);
          switch (this.str) {
            case "emitWebViewLanguageModel01": {
              try {
                if(canIUse('SystemCapability.UIDesign.HDSPattern.Standard')) {
                  console.log('emitWebViewLanguageModel01111')
                  this.isPageEnd = -1;
                  this.controller.loadUrl("resource://rawfile/prompt.html");
                  await Utils.waitForExist(() => this.isPageEnd, this.str + ' isPageEnd', 1, 1000);
                  let buttonOne = await driver.findComponent(ON.text('Create'));
                  await buttonOne.click();
                } else {
                  Utils.emitEvent('onCreateAISession', 20250420);
                }
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }

            case "emitWebViewLanguageModel02": {
              try {
                if(canIUse('SystemCapability.UIDesign.HDSPattern.Standard')) {
                  console.log('emitWebViewLanguageModel0222')
                  this.isPageEnd = -1;
                  this.controller.loadUrl("resource://rawfile/prompt.html");
                  await Utils.waitForExist(() => this.isPageEnd, this.str + ' isPageEnd', 1, 1000);
                  let buttonOne = await driver.findComponent(ON.text('Create'));
                  await buttonOne.click();
                  await Utils.sleep(2000)
                  this.controller.runJavaScript('executeClick()');
                } else {
                  Utils.emitEvent('onExecuteAIAction', 20250421);
                }
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }

            case "emitWebViewLanguageModel03": {
              try {
                if(canIUse('SystemCapability.UIDesign.HDSPattern.Standard')) {
                  console.log('emitWebViewLanguageModel0333')
                  this.isPageEnd = -1;
                  this.controller.loadUrl("resource://rawfile/prompt.html");
                  await Utils.waitForExist(() => this.isPageEnd, this.str + ' isPageEnd', 1, 1000);
                  let buttonOne = await driver.findComponent(ON.text('Create'));
                  await buttonOne.click();
                  await Utils.sleep(2000)
                  this.controller.runJavaScript('destroyClick()');
                } else {
                  Utils.emitEvent('onDestroyAIAction', 20250422);
                }
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }

            case "emitWebViewLanguageDetector04": {
              try {
                if(canIUse('SystemCapability.UIDesign.HDSPattern.Standard')) {
                  console.log('emitWebViewLanguageDetector0444')
                  this.isPageEnd = -1;
                  this.controller.loadUrl("resource://rawfile/language_detector.html");
                  await Utils.waitForExist(() => this.isPageEnd, this.str + ' isPageEnd', 1, 1000);
                  let buttonOne = await driver.findComponent(ON.text('中文'));
                  await buttonOne.click();
                  await Utils.sleep(2000)
                  this.controller.runJavaScript('detectClick()');
                } else {
                  Utils.emitEvent('onCreateAISession', 20250423);
                }
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }

            case "emitWebViewProofreader05": {
              try {
                if(canIUse('SystemCapability.UIDesign.HDSPattern.Standard')) {
                  console.log('emitWebViewProofreader0555')
                  this.isPageEnd = -1;
                  this.controller.loadUrl("resource://rawfile/proofreader.html");
                  await Utils.waitForExist(() => this.isPageEnd, this.str + ' isPageEnd', 1, 1000);
                  let buttonOne = await driver.findComponent(ON.text('开始校对'));
                  await buttonOne.click();
                } else {
                  Utils.emitEvent('onCreateAISession', 20250425);
                }
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }

            case "emitWebViewProofreader06": {
              try {
                if(canIUse('SystemCapability.UIDesign.HDSPattern.Standard')) {
                  console.log('emitWebViewProofreader0666')
                  this.isPageEnd = -1;
                  this.controller.loadUrl("resource://rawfile/proofreader.html");
                  await Utils.waitForExist(() => this.isPageEnd, this.str + ' isPageEnd', 1, 1000);
                  let buttonOne = await driver.findComponent(ON.text('返回导航页'));
                  await buttonOne.click();
                } else {
                  Utils.emitEvent('onDestroyAISession', 20250426);
                }
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }
            case "emitWebViewWriter07": {
              try {
                if(canIUse('SystemCapability.UIDesign.HDSPattern.Standard')) {
                  console.log('emitWebViewWriter0777')
                  this.isPageEnd = -1;
                  this.controller.loadUrl("resource://rawfile/writer.html");
                  await Utils.waitForExist(() => this.isPageEnd, this.str + ' isPageEnd', 1, 1000);
                  let buttonOne = await driver.findComponent(ON.text('生成内容'));
                  await buttonOne.click();
                } else {
                  Utils.emitEvent('onCreateAISession', 20250427);
                }
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }
            case "emitWebViewWriter08": {
              try {
                if(canIUse('SystemCapability.UIDesign.HDSPattern.Standard')) {
                  console.log('emitWebViewWriter0888')
                  this.isPageEnd = -1;
                  this.controller.loadUrl("resource://rawfile/writer.html");
                  await Utils.waitForExist(() => this.isPageEnd, this.str + ' isPageEnd', 1, 1000);
                  let buttonOne = await driver.findComponent(ON.text('生成内容'));
                  await buttonOne.click();
                  await Utils.sleep(2000)
                  let buttonTwo = await driver.findComponent(ON.text('返回导航页'));
                  await buttonTwo.click();
                } else {
                  Utils.emitEvent('onDestroyAISession', 20250428);
                }
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }

            case "emitWebViewWriter09": {
              try {
                if(canIUse('SystemCapability.UIDesign.HDSPattern.Standard')) {
                  console.log('emitWebViewWriter0999')
                  this.isPageEnd = -1;
                  this.controller.loadUrl("resource://rawfile/rewriter.html");
                  await Utils.waitForExist(() => this.isPageEnd, this.str + ' isPageEnd', 1, 1000);
                  let buttonTwo = await driver.findComponent(ON.text('下载模型并重写'));
                  await buttonTwo.click();
                } else {
                  Utils.emitEvent('onCreateAISession', 20250429);
                }
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }

            case "emitWebViewWriter10": {
              try {
                if(canIUse('SystemCapability.UIDesign.HDSPattern.Standard')) {
                  console.log('emitWebViewWriter010')
                  this.isPageEnd = -1;
                  this.controller.loadUrl("resource://rawfile/rewriter.html");
                  await Utils.waitForExist(() => this.isPageEnd, this.str + ' isPageEnd', 1, 1000);
                  let buttonOne = await driver.findComponent(ON.text('下载模型并重写'));
                  await buttonOne.click();
                  await Utils.sleep(2000)
                  let buttonTwo = await driver.findComponent(ON.text('返回导航页'));
                  await buttonTwo.click();
                } else {
                  Utils.emitEvent('onDestroyAISession', 20250430);
                }
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }

            case "emitWebViewTranslator11": {
              try {
                if(canIUse('SystemCapability.UIDesign.HDSPattern.Standard')) {
                  console.log('emitWebViewTranslator11')
                  this.isPageEnd = -1;
                  this.controller.loadUrl("resource://rawfile/translator.html");
                  await Utils.waitForExist(() => this.isPageEnd, this.str + ' isPageEnd', 1, 1000);
                  let buttonOne = await driver.findComponent(ON.text('开始翻译'));
                  await buttonOne.click();
                } else {
                  Utils.emitEvent('onExecuteAIAction', 20250431);
                }
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }

            case "emitWebViewSummarizer12": {
              try {
                if(canIUse('SystemCapability.UIDesign.HDSPattern.Standard')) {
                  console.log('emitWebViewSummarizer12')
                  this.isPageEnd = -1;
                  this.controller.loadUrl("resource://rawfile/summarizer.html");
                  await Utils.waitForExist(() => this.isPageEnd, this.str + ' isPageEnd', 1, 1000);
                  let buttonOne = await driver.findComponent(ON.text('示例文章'));
                  await buttonOne.click();
                  await Utils.sleep(2000)
                  let buttonTwo = await driver.findComponent(ON.text('批量总结'));
                  await buttonTwo.click();
                } else {
                  Utils.emitEvent('onCreateAISession', 20250432);
                }
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }


            case "emitWebViewSummarizer13": {
              try {
                if(canIUse('SystemCapability.UIDesign.HDSPattern.Standard')) {
                  console.log('emitWebViewSummarizer13')
                  this.isPageEnd = -1;
                  this.controller.loadUrl("resource://rawfile/summarizer.html");
                  await Utils.waitForExist(() => this.isPageEnd, this.str + ' isPageEnd', 1, 1000);
                  let buttonOne = await driver.findComponent(ON.text('示例文章'));
                  await buttonOne.click();
                  await Utils.sleep(2000)
                  let buttonTwo = await driver.findComponent(ON.text('批量总结'));
                  await buttonTwo.click();
                  await Utils.sleep(2000);
                  let buttonThree = await driver.findComponent(ON.text('返回导航页'));
                  await buttonThree.click();
                } else {
                  Utils.emitEvent('onDestroyAISession', 20250433);
                }
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }

          }
        })
      }

      Web({
        src: $rawfile("navigation.html"),
        controller: this.controller
      })
        .javaScriptAccess(true)
        .aiSessionOptions([this.summarizer, this.translator, this.writer, this.rewriter, this.proofreader,
          this.languageDetector, this.languageModel])
        .onPageEnd(()=>{
          this.isPageEnd = 1;
        })
    }
  }
}