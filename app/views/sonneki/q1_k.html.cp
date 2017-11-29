<% provide(:title, "q1")%>

<h1>損益算 確認問題1</h1>
<p>仕入れ値と定価の関係を表す式はどれか。</p>
<div id="explain">

<table class="table table-bordered" v-bind:class="{'table-hover': !show}">
<thead>
<tr><th>選択肢</th></tr>
</thead>
<tbody>
<tr v-on:click="updateAns($event)">
  <td><%= @array[0]%></td>
</tr>
<tr v-on:click="updateAns()">
  <td><%= @array[1]%></td>
</tr>
<tr v-on:click="updateAns()">
  <td><%= @array[2]%></td>
</tr>
</tbody>
</table>

<p v-if="flag" v-show="show"><br>正解!!</p>
<p v-else v-show="show"><br>不正解</p>

<div v-show="show">
<span>答え：</span><span id="answer"><%= @ans %></span>
<p>解説</p>
<blockquote>
<p>仕入れ値と定価の関係</p>
<p>定価は仕入れ値に利益を加算したものであるから</p>
<p>定価=仕入れ値+利益 である。</p>
</blockquote>
</div>
</div>
<%= link_to "損益算Top", :sonneki %>
<%= javascript_pack_tag 'explain_vue' %>
