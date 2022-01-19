// window.addEventListener('load', () =>  {

//   const moneyInput = document.getElementById("money-cost");
//       const subtotalOutput = document.getElementById("subtotal-cost");
//       const taxOutput = document.getElementById("tax-cost")
//       const totalOutput = document.getElementById("total-cost");
//       moneyInput.addEventListener("input", () => {
//         subtotalOutput.value = moneyInput.value;
//         const taxValue = Math.floor(subtotalOutput.value * 0.1);
//         taxOutput.value = taxValue;
//         const value_result = subtotalOutput.value;
//         const totalNumber = (Math.floor(parseInt(taxValue) + parseInt(value_result)));
//         totalOutput.value = totalNumber;
//       })
//     });



// $(function(){
//   // フォームカウント
//   var frm_cnt = 0;

// 	// clone object
//   $(document).on('click', 'span.add', function() {
//     var original = $('#form_block\\[' + frm_cnt + '\\]');
//     var originCnt = frm_cnt;

//     frm_cnt++;
//     original
//       .clone()
//       .hide()
//       .insertAfter(original)
//       .attr('id', 'form_block[' + frm_cnt + ']') // クローンのid属性を変更。
//       .end() // 一度適用する
//       .find('input, text_field').each(function(idx, obj) {
//         $(obj).attr({
//           id: $(obj).attr('id').replace(/\[[0-9]\]+$/, '[' + frm_cnt + ']'),
//           name: $(obj).attr('name').replace(/\[[0-9]\]+$/, '[' + frm_cnt + ']')
//         });
//         $(obj).val('');
//     });
//     // clone取得
//     var clone = $('#form_block\\[' + frm_cnt + '\\]');
//     clone.children('span.close').show();
//     clone.slideDown('slow');
//   });

// 	// close object
// 	$(document).on('click', 'span.close', function() {
//     var removeObj = $(this).parent();
//     removeObj.fadeOut('fast', function() {
//       removeObj.remove();
//       // 番号振り直し
//       frm_cnt = 0;
//       $(".form-block[id^='form_block']").each(function(index, formObj) {
//         if ($(formObj).attr('id') != 'form_block[0]') {
//           frm_cnt++;
//           $(formObj)
//             .attr('id', 'form_block[' + frm_cnt + ']') // id属性を変更。
//             .find('input, text_field').each(function(idx, obj) {
//             $(obj).attr({
//               id: $(obj).attr('id').replace(/\[[0-9]\]+$/, '[' + frm_cnt + ']'),
//               name: $(obj).attr('name').replace(/\[[0-9]\]+$/, '[' + frm_cnt + ']')
//             });
//           });
//         }
//       });
//     });
//   });

// });

// $(function(){
//   // フォームカウント
//   var frm_cnt = 0;
// $(document).ready(function(){
//   var frm_cnt=1;$(document).on('click','span.add',add_new_input);
//   function add_new_input(){
//   var original=$('#form_block\\['+frm_cnt+'\\]');
//   var originCnt=frm_cnt;
//   var originVal=$("input[name='sex\\["+frm_cnt+"\\]']:checked").val(
//   );
//   frm_cnt++;
//   original
//   .clone()
//   .hide()
//   .insertAfter(original)
//   .attr('id','form_block['+frm_cnt+']')
//   .end()
//   .find('input, textarea')
//   .each(function(idx,obj){
//     $(obj)
//     .attr({
//       id:$(obj).attr('id').replace(/\[[0-9]\]+$/,'['+frm_cnt+']'),
//       name:$(obj).attr('name').replace(/\[[0-9]\]+$/,'['+frm_cnt+']')});
//       $(obj).val(0);});
//       var clone=$('#form_block\\['+frm_cnt+'\\]');
//       clone.show();}
//         function calcmeanprice(){
//           var $form=$('#formmeanprice');
//           var param=$form.serializeArray();
//           var number=[];
//           var freq=[];
//           var freqtotal=0;
//           jQuery.each(param,function(i,field){
//             if(field.name.substr(0,4)=="freq"){
//               freq.push(parseFloat(field.value));
//               freqtotal+=parseFloat(field.value);}
//               else{number.push(parseFloat(field.value));}});
//               var meantotal=0;
//               var length=number.length;
//               for(i=0;i<length;i++){meantotal+=number[i]*freq[i];}
//         $("#meanfreqtotal")
//         .text(freqtotal.toLocaleString());
//         $("#meanpricetotal")
//         .text(meantotal.toLocaleString());
//         meanprice=meantotal/freqtotal;
//         $("#meanpriceval").text(meanprice.toLocaleString());}
//         $("#calculatemeanprice")
//         .click(function(){calcmeanprice();
//           return false;});$
//           ("#savemeanprice")
//           .click(function(){
//             var formdatameanprice=[];
//             formdatameanprice.unshift({"time":jQuery
//             .now(),"title":"formdata","data":
//             $("#formmeanprice").serializeArray()});
//             localStorage.setItem("calculatormeanprice",JSON.stringify(formdatameanprice));
//             calcmeanprice();return false;
//           });
//           $("#loadmeanprice").click(function(){
//             var datameanprice=JSON.parse(localStorage.getItem("calculatormeanprice"));
//             if(datameanprice){
//               var num=Math.floor(datameanprice[0].data.length/2-1-frm_cnt);
//               for(i=0;i<num;i++){add_new_input();}
//         $.each(datameanprice[0].data,function(i,item){
//           var id=item.name;id=id.replace('[','\\[');
//           id=id.replace(']','\\]');$('#'+id).val(item.value);
//         })
//           ;}
//         calcmeanprice();
//         return false;
//         });
//         });
