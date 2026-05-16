import abilityDelegatorRegistry from '@ohos.application.abilityDelegatorRegistry';
import AbilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import {BusinessError} from '@ohos.base';

const delegator: AbilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();

export async function startAbility(bundleName: string, abilityName: string) {
    await delegator.executeShellCommand(`aa start -b ${bundleName} -a ${abilityName}`).then(result => {
        console.info(`UiTestCase, start abilityFinished: ${result}`)
    }).catch((err: BusinessError) => {
        console.error(`UiTestCase, start abilityFailed: ${err}`)
    })
}

export async function stopApplication(bundleName: string) {
    await delegator.executeShellCommand(`aa force-stop ${bundleName} `).then(result => {
        console.info(`UiTestCase, stop application finished: ${result}`)
    }).catch((err: BusinessError) => {
        console.error(`UiTestCase,stop application failed: ${err}`)
    })
}