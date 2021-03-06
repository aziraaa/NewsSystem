<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%pageContext.setAttribute("currentMenu", "cal");%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@include file="/admin/meta.jsp"%>
<title>编辑角色</title>
<%@include file="/admin/s.jsp"%>
<script type="text/javascript"
	src='<s:url value="/js/jquery-1.10.2.min.js" />' /></script>
<script type="text/javascript">
	$(function() {
		$('#one1').click(function() {
			var size = $('#left>option:selected').size();
			if (size != 0) {
				$('#left > option:selected').appendTo($('#right'));
			} else {
				$('#left>option:first-child').appendTo($('#right'));
			}
		});
		$('#all1').click(function() {
			$('#left > option').appendTo($('#right'));
		});
		$('#one2').click(function() {
			var size = $('#right>option:selected').size();
			if (size != 0) {
				$('#right > option:selected').appendTo($('#left'));
			} else {
				$('#right>option:first-child').appendTo($('#left'));
			}
		});
		$('#all2').click(function() {
			$('#right > option').appendTo($('#left'));
		});
	});

	function submitForm1() {
		$('#left > option').attr('selected', 'selected');
		return true;
	}
</script>
</head>
<body>
	<%@include file="/admin/header.jsp"%>
	<div class="row-fluid">
		<%@include file="/admin/menu.jsp"%>

		<section id="m-main" class="col-md-10"> <article
			class="m-widget"> <header class="header">
		<h4 class="title">添加角色</h4>
		</header>

		<div class="content content-inner">

			<form id="form1" method="post" action="RoleAction_saveOrUpdateRole"
				class="form-horizontal">
				<div class="control-group">
					<label class="control-label">角色名称：</label>
					<div class="controls">
						<div class="input-append">
							<s:textfield name="roleName" />
						</div>
					</div>
				</div>
				<div class="control-group">
					<label class="control-label">角色属性：</label>
					<div class="controls">
						<div class="input-append" style="padding-left: 0px;">
							<s:textfield name="roleValue" />
						</div>
					</div>
				</div>
				<div class="control-group">
					<label class="control-label">角色描述：</label>
					<div class="controls">
						<div class="input-append" style="padding-left: 0px;">
							<s:textarea name="roleDesc" cols="15" rows="5" />
						</div>
					</div>
				</div>
				<div class="control-group">
					<label class="control-label">角色权限：</label>
					<div class="controls">
						<div class="input-append" style="padding-left: 0px;">
							<table>
								<tr>
									<td width="45%" align="right" class="login-text02">角色已有权限：<br>
										<s:select id="left" name="ownRightIds" list="rights"
											listKey="id" listValue="rightName" multiple="true" size="15"
											cssStyle="width:180px">
										</s:select></td>
									<td width="10%" valign="middle" align="center"><input
										type="button" id="one1" value="&gt;" class="btn"></input><br>
										<br> <input type="button" id="one2" value="&lt;"
										class="btn"></input><br> <br> <input type="button"
										id="all1" value="&gt;&gt;" class="btn"></input><br> <br>
										<input type="button" id="all2" value="&lt;&lt;" class="btn"></input><br>
										<br></td>
									<td width="45%" align="left" class="login-text02">角色未有权限：<br>
										<s:select id="right" list="noOwnRights" name="noOwnRightIds"
											listKey="id" listValue="rightName" multiple="true" size="15"
											cssStyle="width:180px">
										</s:select></td>
								</tr>
							</table>
						</div>
					</div>
				</div>

				<div class="control-group">
					<div class="controls">
						<button id="submitButton" type="submit" class="btn">保存</button>
						&nbsp;
						<button type="button" onclick="history.back();" class="btn">返回</button>
					</div>
				</div>
			</form>
		</div>
		</article> </section>
		<!-- end of main -->
	</div>
</body>
</html>