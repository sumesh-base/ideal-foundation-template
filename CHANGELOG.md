# Changelog

## [0.2.0](https://github.com/sumesh-base/ideal-foundation-template/compare/v0.1.0...v0.2.0) (2026-08-21)


### Features

* add nightly drift detection workflow ([1a14501](https://github.com/sumesh-base/ideal-foundation-template/commit/1a14501d5aa4d0496a8638ccb0d465084cdde83f))
* add tenant-b to demonstrate envcommon overrides and unique resources ([27a30ff](https://github.com/sumesh-base/ideal-foundation-template/commit/27a30ffa1dd16755721cce6cfaf5e7bbc26b42ec))
* cleanly filter production out of matrix on standard push to prevent confusing approval requests ([2ef0a6e](https://github.com/sumesh-base/ideal-foundation-template/commit/2ef0a6efff44ca3fbbc3b01a33b0e1a49645e61a))
* demo edge cases (envcommon overrides & unique resources) ([8e9e871](https://github.com/sumesh-base/ideal-foundation-template/commit/8e9e8719028167c40694a9f7f4563046f0adf390))
* demo targeted execution for RDS ([be40212](https://github.com/sumesh-base/ideal-foundation-template/commit/be402124a8a3cccc583db8ab633ac62a6bd14c84))
* demo targeted execution for RDS ([a851bb2](https://github.com/sumesh-base/ideal-foundation-template/commit/a851bb2af5791a05d4293ff8444b3958e1c08cd3))
* enforce release gates for production deployment ([56dfd3f](https://github.com/sumesh-base/ideal-foundation-template/commit/56dfd3fb2a6377b71354716d4e6388e0d2ba5979))
* enforce release gates for production deployment ([b35ce41](https://github.com/sumesh-base/ideal-foundation-template/commit/b35ce41947db60b1b55dd56acb6e0d83581e0810))
* parse terragrunt output to detailed module breakdown table ([ed3960a](https://github.com/sumesh-base/ideal-foundation-template/commit/ed3960aca62880595dd8cd0c38a7cb9ed1bc8016))
* upgrade PR comment table to show exact resources modified ([69d946d](https://github.com/sumesh-base/ideal-foundation-template/commit/69d946d497b4446cc45f2f491912725c357bb229))


### Bug Fixes

* add Terragrunt Plan aggregator job to satisfy branch protections ([0336068](https://github.com/sumesh-base/ideal-foundation-template/commit/03360686764c57ed1ed0dbf9dc23958d1fcf6c3b))
* remove paths filter so required status checks pass on docs PRs ([1d0180d](https://github.com/sumesh-base/ideal-foundation-template/commit/1d0180d4a57a2a8c102045e085e736cc9927fd25))
* resolve RDS configuration error (SCRUM-6) ([e4e8fba](https://github.com/sumesh-base/ideal-foundation-template/commit/e4e8fba624687a3a9dd823ed1abc175ea05cbb64))
* resolve RDS configuration error for production ([8ba7672](https://github.com/sumesh-base/ideal-foundation-template/commit/8ba767269d0ca52adb13a09c208fc64ab63621c9))
* resolve yaml indentation syntax error in python heredoc ([d378f26](https://github.com/sumesh-base/ideal-foundation-template/commit/d378f26775131f62ce322703689bbfa75e00252f))


### Performance Improvements

* implement dynamic differential terragrunt matrix ([0d9f003](https://github.com/sumesh-base/ideal-foundation-template/commit/0d9f0032adf9e28dfdf97f3778051b4bb21873af))
* implement dynamic differential terragrunt runs ([41dff55](https://github.com/sumesh-base/ideal-foundation-template/commit/41dff5566ec8bb6af66939268b8e1869304a7012))

## 0.1.0 (2026-08-21)


### Features

* add RDS module and prod tenant-a resources ([751454c](https://github.com/sumesh-base/ideal-foundation-template/commit/751454cc115c5c546c55c07f08cddd28764b7285))
* add RDS module and prod tenant-a resources ([64edd38](https://github.com/sumesh-base/ideal-foundation-template/commit/64edd381d7d9b686bce06e78501cbc0c24eb27e4))
* complete multi-account architecture setup with OIDC and fencing ([af43b09](https://github.com/sumesh-base/ideal-foundation-template/commit/af43b09a45a5839aaf66a207fea1249f502c152e))
* demo production plan ([41cb090](https://github.com/sumesh-base/ideal-foundation-template/commit/41cb090c09e4461d511ace0e097d6bf6e9c59ec1))
* demo production plan ([672b806](https://github.com/sumesh-base/ideal-foundation-template/commit/672b806d82cf40443345564674639d46b68a0de4))
* enable automatic dummy feature for VPC ([35395ee](https://github.com/sumesh-base/ideal-foundation-template/commit/35395ee8470edeb3e843fe8a06dfaeb53a305050))
* enable automatic dummy feature for VPC ([d58d905](https://github.com/sumesh-base/ideal-foundation-template/commit/d58d9057debce2065d3c187ce5b62bffffa0c492))
* Enterprise-ready matrix pipeline and release-please integration ([58b9b01](https://github.com/sumesh-base/ideal-foundation-template/commit/58b9b015200e3b57064240ee71e084b38330ad4c))
* implement multi-environment multi-tenant terragrunt architecture ([95e02d6](https://github.com/sumesh-base/ideal-foundation-template/commit/95e02d64dc3b95f090b96084ffa1316912ac653f))
* multi-account setup and approval gates ([df4ff0f](https://github.com/sumesh-base/ideal-foundation-template/commit/df4ff0f524702923ce84f1f6469ceb96e35cd0c1))


### Bug Fixes

* add mock_outputs for terragrunt dependencies ([02ee795](https://github.com/sumesh-base/ideal-foundation-template/commit/02ee7956e62451ff661355b3d55ceeb1ae8ef2d5))
* bump github-script to v9 ([4de12dd](https://github.com/sumesh-base/ideal-foundation-template/commit/4de12dd5870841a2790fee4af09d883461d0fd60))
* correct release-please syntax ([6e37f87](https://github.com/sumesh-base/ideal-foundation-template/commit/6e37f875a23abc5f52d161c50dd37cc17ab4ea0c))
