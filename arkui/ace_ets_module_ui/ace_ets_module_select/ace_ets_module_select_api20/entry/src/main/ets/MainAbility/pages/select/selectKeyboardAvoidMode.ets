import { inputMethod } from '@kit.IMEKit';
import { LengthMetrics } from '@kit.ArkUI';

@Entry
@Component
struct Index {
  private inputController: inputMethod.InputMethodController = inputMethod.getController();
  @State private selectOptions: SelectOption[] = [
    {
      value: 'aaa',
    },
    {
      value: 'bbb',
    },
    {
      value: 'ccc',
    },
    {
      value: 'bbb',
    },
    {
      value: 'bbb',
    },
    {
      value: 'bbb',
    },
    {
      value: 'ccc',
    },
    {
      value: 'bbb',
    },
    {
      value: 'ccc',
    },
    {
      value: 'bbb',
    },
    {
      value: 'ccc',
    },
    {
      value: 'bbb',
    },
    {
      value: 'ccc',
    },
    {
      value: 'bbb',
    },
    {
      value: 'ccc',
    },
    {
      value: 'bbb',
    },
    {
      value: 'ccc',
    },
    {
      value: 'ddd',
    }
  ];

  build() {
    Column () {
      Select(this.selectOptions)
        .value('1111')
        .id('select01')
        .margin('20px')
        .minKeyboardAvoidDistance(LengthMetrics.vp(10))
        .onClick(() => {
          setTimeout(() => {
            this.attachAndListener()
          }, 2000)
        })
      Select(this.selectOptions)
        .value('222222')
        .id('select02')
        .margin('20px')
        .keyboardAvoidMode(MenuKeyboardAvoidMode.NONE)
        .minKeyboardAvoidDistance(LengthMetrics.vp(10))
        .onClick(() => {
          setTimeout(() => {
            this.attachAndListener()
          }, 2000)
        })
      Select(this.selectOptions)
        .value('Click Show Options')
        .id('select03')
        .keyboardAvoidMode(MenuKeyboardAvoidMode.TRANSLATE_AND_RESIZE)
        .minKeyboardAvoidDistance(LengthMetrics.vp(20))
        .onClick(() => {
          setTimeout(() => {
            this.attachAndListener()
          }, 2000)
        })
    }
    .height('100%')
    .width('100%')
  }

  async attachAndListener() {
    focusControl.requestFocus('Index')
    try {
      await this.inputController.attach(true, {
        inputAttribute: {
          textInputType: inputMethod.TextInputType.TEXT,
          enterKeyType: inputMethod.EnterKeyType.SEARCH
        }
      })
    } catch (err) {
      console.error('Fail to attach')
    }
  }
}