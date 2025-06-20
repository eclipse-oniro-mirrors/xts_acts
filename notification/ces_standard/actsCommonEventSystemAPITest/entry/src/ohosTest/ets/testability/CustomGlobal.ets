import { common } from '@kit.AbilityKit';

export class CustomGlobal{
    public static context:common.UIAbilityContext;

    public static setContext(context:common.UIAbilityContext){
        CustomGlobal.context = context;
    }
}